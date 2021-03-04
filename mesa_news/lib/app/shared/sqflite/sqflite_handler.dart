import 'package:flutter/widgets.dart' show WidgetsFlutterBinding;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mesa_news/app/modules/home/model/body_news_model.dart';
import 'package:mesa_news/app/modules/home/model/news_model.dart';
import 'package:mesa_news/app/modules/home/model/pagination_model.dart';
import 'package:mesa_news/app/shared/dio/model/failure.dart';
import 'package:mesa_news/app/shared/dio/model/result.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

part 'sqflite_handler.g.dart';

@Injectable()
class SqfliteHandler {
  Future<Database> get database async {
    WidgetsFlutterBinding.ensureInitialized();

    return openDatabase(
      join(await getDatabasesPath(), 'doggie_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE news(title TEXT PRIMARY KEY, description TEXT, content TEXT, author TEXT, published_at TEXT, highlight INTEGER, url TEXT, image_url TEXT)",
        );
      },
      version: 1,
    );
  }

  Future<Result<void>> insertNews(NewsModel news) async {
    try {
      final Database db = await database;

      var res = await db.insert('news', news.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);

      if (res == -1) {
        return Result.error(Failure.unknownFailure("Data erro"));
      } else {
        return Result.success(null);
      }
    } catch (e) {
      return Result.error(Failure.unknownFailure(e));
    }
  }

  Future<Result<void>> deleteNews(String title) async {
    try {
      final db = await database;

      var res = await db.delete('news', where: "title = ?", whereArgs: [title]);

      if (res == 0) {
        return Result.error(Failure.unknownFailure("Data erro"));
      } else {
        return Result.success(null);
      }
    } catch (e) {
      return Result.error(Failure.unknownFailure(e));
    }
  }

  Future<bool> checkHasNews(String title) async {
    try {
      final db = await database;

      return (await db.query('news', where: "title = ?", whereArgs: [title])).isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  Future<Result<BodyNewsModel>> getNews(int currentPage, int perPage, String dateFilter) async {
    try {
      final Database db = await database;

      List<Map<String, dynamic>> list = dateFilter == null
          ? await db.query('news', limit: perPage, offset: perPage * (currentPage - 1), orderBy: "published_at DESC")
          : await db.query('news',
              where: "published_at = ?",
              whereArgs: [dateFilter],
              orderBy: "published_at DESC",
              limit: perPage,
              offset: perPage * (currentPage - 1));
      int count = dateFilter == null
          ? Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM news'))
          : Sqflite.firstIntValue(await db.rawQuery("SELECT COUNT(*) FROM news WHERE published_at = $dateFilter"));

      var newsList = list.map((e) => NewsModel.fromJson(e)).toList();

      return Result.success(BodyNewsModel(
          data: newsList,
          pagination: PaginationModel(
              currentPage: currentPage,
              perPage: perPage,
              totalItems: count,
              totalPages: count != 0 ? (count / perPage).ceil() : 0)));
    } catch (e) {
      return Result.error(Failure.unknownFailure(e));
    }
  }
}
