import 'package:flutter/material.dart'
    show ButtonStyle, Colors, ElevatedButtonThemeData, FontWeight, MaterialApp, MaterialStateProperty, OutlinedButtonThemeData, StatelessWidget, TextStyle, TextTheme, ThemeData, Widget;
import 'package:flutter_modular/flutter_modular.dart' show Modular;
import 'package:mesa_news/app/shared/utils/app_colors.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(_) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Mesa News',
      theme: ThemeData(
        primaryColor: AppColors.PRIMARY_COLOR,
        accentColor: AppColors.ACCENT_COLOR,
        fontFamily: 'roboto',
        textTheme: const TextTheme(
          caption: TextStyle(letterSpacing: -0.41),
          overline: TextStyle(letterSpacing: -0.41),
          subtitle1: TextStyle(letterSpacing: -0.41),
          subtitle2: TextStyle(letterSpacing: -0.41),
          headline1: TextStyle(letterSpacing: -0.41),
          headline2: TextStyle(letterSpacing: -0.41),
          headline3: TextStyle(letterSpacing: -0.41),
          headline4: TextStyle(letterSpacing: -0.41),
          headline5: TextStyle(letterSpacing: -0.41),
          headline6: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700, letterSpacing: -0.41),
          bodyText1: TextStyle(letterSpacing: -0.41),
          bodyText2: TextStyle(letterSpacing: -0.41),
          button: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, letterSpacing: -0.41),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
        )),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
        )),
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
