import 'package:mesa_news/app/shared/constant/routes/routes.dart';
import 'package:mesa_news/app/shared/shared_preferences/get_storages.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'splash_controller.g.dart';

@Injectable()
class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  final GetStorages _storages;

  _SplashControllerBase(this._storages);

  void start() async {
    if (_storages.token.isNotEmpty) {
      Modular.to.pushReplacementNamed(Routes.HOME);
    } else {
      Modular.to.pushReplacementNamed(Routes.LOGIN);
    }
  }
}
