import 'package:flutter/material.dart' show ScrollController;
import 'package:mesa_news/app/modules/home/model/filter_model.dart';
import 'package:mesa_news/app/modules/home/model/news_model.dart';
import 'package:mesa_news/app/modules/home/repositories/home_repository.dart';
import 'package:mesa_news/app/shared/dio/model/result.dart';
import 'package:mesa_news/app/shared/model/generic/infinite_state_model.dart';
import 'package:mesa_news/app/shared/model/generic/result_state_model.dart';
import 'package:mesa_news/app/shared/model/generic/shimmer_state_model.dart';
import 'package:mesa_news/app/shared/shared_preferences/get_storages.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tuple/tuple.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase extends Disposable with Store {
  final HomeRepository _repository;
  final GetStorages _storage;

  _HomeControllerBase(this._repository, this._storage);

  ScrollController scrollController = ScrollController();

  final FilterModel filter = FilterModel();

  final ShimmerState<List<NewsModel>> highlightsState = ShimmerState();
  final InfiniteState<NewsModel> newsState = InfiniteState(perPage: 10);
  final ResultState<bool> favoriteState = ResultState();

  void start() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 50) {
        newsState.requestMoreItems();
      }
    });

    newsState.requestFunction((currentPage, perPage) async {
      return (await _repository.news(currentPage, perPage, filter)).result((data) {
        return Result.success(Tuple2(data.pagination?.totalItems ?? 0, data.data));
      }, (error) => Result.error(error));
    });

    fetchData();
  }

  void fetchData() async {
    (await _repository.highlights()).result(highlightsState.setData, highlightsState.setError);
    newsState.requestMoreItems();
  }

  void setFavorite(NewsModel news) async {
    favoriteState.setLoading(true);
    if (!news.isFavorited) {
      (await _repository.addFavorite(news)).result((_) => _favoriteSuccess(news), (error) {
        favoriteState.setError(error);
      });
    } else {
      (await _repository.removeFavorite(news.title)).result((_) => _favoriteSuccess(news), (error) {
        favoriteState.setError(error);
      });
    }
  }

  void _favoriteSuccess(NewsModel news) {
    var value = !news.isFavorited;
    if (filter.onlyFavorites) {
      newsState.data?.removeWhere((e) => e.title == news.title);
    } else {
      newsState.data?.where((e) => e.title == news.title)?.forEach((e) => e.isFavorited = value);
    }

    highlightsState.data?.where((e) => e.title == news.title)?.forEach((e) => e.isFavorited = value);
    favoriteState.setData(value);
  }

  void setFilter(FilterModel value) {
    filter.date = value.date;
    filter.onlyFavorites = value.onlyFavorites;
    newsState.resetDataAndRequest();
  }

  void logout() {
    _storage.token = "";
  }

  @override
  void dispose() {
    scrollController.dispose();
  }
}
