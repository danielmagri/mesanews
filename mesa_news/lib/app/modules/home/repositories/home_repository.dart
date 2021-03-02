import 'package:flutter_modular/flutter_modular.dart';
import 'package:mesa_news/app/modules/home/model/body_news_model.dart';
import 'package:mesa_news/app/modules/home/model/news_model.dart';
import 'package:mesa_news/app/shared/constant/api/news_api.dart';
import 'package:mesa_news/app/shared/dio/custom_dio.dart';
import 'package:mesa_news/app/shared/dio/model/result.dart';
import 'package:mesa_news/app/shared/extension/future_extension.dart';

part 'home_repository.g.dart';

@Injectable()
class HomeRepository extends Disposable {
  final CustomDio _client;

  HomeRepository(this._client);

  Future<Result<List<NewsModel>>> highlights() {
    return _client.get('${NewsApi.GET_HIGHLIGHTS}').result(
          (json) => BodyNewsModel.fromJson(json).data,
        );
  }

  Future<Result<BodyNewsModel>> news(int currentPage, int perPage, {String publishedAt}) {
    return _client.get('${NewsApi.GET_NEWS}', queryParameters: {
      NewsApi.PARAM_NEWS_CURRENT_PAGE: currentPage,
      NewsApi.PARAM_NEWS_PER_PAGE: perPage,
      if (publishedAt != null) NewsApi.PARAM_NEWS_PUBLISHED_AT: publishedAt,
    }).result((json) => BodyNewsModel.fromJson(json));
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
