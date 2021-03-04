import 'package:flutter_modular/flutter_modular.dart';
import 'package:mesa_news/app/modules/home/model/body_news_model.dart';
import 'package:mesa_news/app/modules/home/model/filter_model.dart';
import 'package:mesa_news/app/modules/home/model/news_model.dart';
import 'package:mesa_news/app/shared/constant/api/news_api.dart';
import 'package:mesa_news/app/shared/dio/custom_dio.dart';
import 'package:mesa_news/app/shared/dio/model/result.dart';
import 'package:mesa_news/app/shared/extension/future_extension.dart';
import 'package:mesa_news/app/shared/sqflite/sqflite_handler.dart';

part 'home_repository.g.dart';

@Injectable()
class HomeRepository extends Disposable {
  final CustomDio _client;
  final SqfliteHandler _database;

  HomeRepository(this._client, this._database);

  Future<Result<List<NewsModel>>> highlights() async {
    var response = await _client.get('${NewsApi.GET_HIGHLIGHTS}').result(
          (json) => BodyNewsModel.fromJson(json).data,
        );

    if (response.isSuccess) {
      for (NewsModel news in response.data) {
        if (await _database.checkHasNews(news.title)) {
          news.isFavorited = true;
        }
      }
    }
    return response;
  }

  Future<Result<BodyNewsModel>> news(int currentPage, int perPage, FilterModel filter) async {
    if (filter.onlyFavorites) {
      var response = await _database.getNews(currentPage, perPage, filter.dateFormatted);

      if (response.isSuccess) {
        response.data.data.forEach((e) => e.isFavorited = true);
      }
      return response;
    } else {
      var response = await _client.get('${NewsApi.GET_NEWS}', queryParameters: {
        NewsApi.PARAM_NEWS_CURRENT_PAGE: currentPage,
        NewsApi.PARAM_NEWS_PER_PAGE: perPage,
        if (filter.date != null) NewsApi.PARAM_NEWS_PUBLISHED_AT: filter.dateFormatted,
      }).result((json) => BodyNewsModel.fromJson(json));

      if (response.isSuccess) {
        for (NewsModel news in response.data.data) {
          if (await _database.checkHasNews(news.title)) {
            news.isFavorited = true;
          }
        }
      }
      return response;
    }
  }

  Future<Result<void>> addFavorite(NewsModel data) {
    return _database.insertNews(data);
  }

  Future<Result<void>> removeFavorite(String title) {
    return _database.deleteNews(title);
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
