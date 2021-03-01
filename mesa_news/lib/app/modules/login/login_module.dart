import 'package:mesa_news/app/modules/login/pages/signup/signup_page.dart';

import 'pages/signup/signup_controller.dart';
import 'package:mesa_news/app/modules/login/pages/email/email_page.dart';
import 'package:mesa_news/app/shared/constant/routes/routes.dart';

import 'pages/email/email_controller.dart';
import 'repositories/login_repository.dart';
import 'pages/login/login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pages/login/login_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $LoginRepository,
        $SignupController,
        $EmailController,
        $LoginController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => LoginPage()),
        ModularRouter(Routes.EMAIL_LOGIN, child: (_, args) => EmailPage(), transition: TransitionType.downToUp),
        ModularRouter(Routes.SIGNUP_LOGIN, child: (_, args) => SignupPage(), transition: TransitionType.downToUp),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
