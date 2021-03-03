import 'package:mesa_news/app/modules/home/model/filter_model.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'filter_controller.g.dart';

@Injectable()
class FilterController = _FilterControllerBase with _$FilterController;

abstract class _FilterControllerBase with Store {
  FilterModel filter = FilterModel();

  @observable
  bool filterbuttonVisible = false;

  @observable
  String dateText = "Todas";

  @action
  void start(FilterModel value) {
    filter.date = value.date;
    filter.onlyFavorites = value.onlyFavorites;
    dateText = filter.dateBeautyFormatted;
  }

  @action
  void setDate(DateTime date) {
    if (date != null) {
      filter.date = date;
      filterbuttonVisible = true;
      dateText = filter.dateBeautyFormatted;
    }
  }
}
