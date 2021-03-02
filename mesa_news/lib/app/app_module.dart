import 'package:mesa_news/app/modules/details/details_module.dart';
import 'package:mesa_news/app/splash/splash_page.dart';

import 'splash/splash_controller.dart';
import 'package:mesa_news/app/modules/home/home_module.dart';
import 'package:mesa_news/app/modules/login/login_module.dart';
import 'package:mesa_news/app/shared/constant/routes/routes.dart';
import 'package:mesa_news/app/shared/dio/custom_dio.dart';
import 'package:mesa_news/app/shared/shared_preferences/get_storages.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:mesa_news/app/app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $GetStorages,
        $CustomDio,
        $AppController,
        $SplashController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => SplashPage(), transition: TransitionType.fadeIn),
        ModularRouter(Routes.LOGIN, module: LoginModule(), transition: TransitionType.fadeIn),
        ModularRouter(Routes.HOME, module: HomeModule(), transition: TransitionType.fadeIn),
        ModularRouter(Routes.DETAILS, module: DetailsModule(), transition: TransitionType.downToUp),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
