import 'package:mesa_news/app/modules/home/model/news_model.dart';
import 'package:mesa_news/app/modules/home/repositories/home_repository.dart';
import 'package:mesa_news/app/shared/model/generic/shimmer_state_model.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final HomeRepository _repository;

  _HomeControllerBase(this._repository);

  final ShimmerState<List<NewsModel>> highlightsState = ShimmerState();

  void fetchData() async {
    (await _repository.highlights()).result(highlightsState.setData, highlightsState.setError);
  }
}
