import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mesa_news/app/shared/constant/assets/images.dart';
import 'package:mesa_news/app/shared/utils/app_colors.dart';
import 'splash_controller.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    controller.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.PRIMARY_COLOR,
      child: Center(child: Image.asset(Images.LOGO, width: 115)),
    );
  }
}
