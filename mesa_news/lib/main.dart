import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mesa_news/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  await GetStorage.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(ModularApp(module: AppModule()));
}
