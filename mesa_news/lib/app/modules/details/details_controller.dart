import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'details_controller.g.dart';

@Injectable()
class DetailsController = _DetailsControllerBase with _$DetailsController;

abstract class _DetailsControllerBase with Store {

}
