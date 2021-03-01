import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mesa_news/app/shared/constant/assets/images.dart';
import 'package:mesa_news/app/shared/constant/routes/routes.dart';
import 'package:mesa_news/app/shared/utils/app_colors.dart';
import 'package:mesa_news/app/shared/widget/custom_outlined_button.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  void goToEmailLogin() {
    Modular.link.pushNamed(Routes.EMAIL_LOGIN);
  }

  @override
  Widget build(_) {
    return Scaffold(
      backgroundColor: AppColors.PRIMARY_COLOR,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Image.asset(Images.LOGO, width: 115),
          const SizedBox(height: 20),
          const Text("NEWS",
              style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.w900, letterSpacing: 25)),
          Spacer(),
          CustomOutlinedButton.white(text: "Entrar com e-mail", onTap: goToEmailLogin),
          Padding(
            padding: const EdgeInsets.only(top: 36, bottom: 28),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Não tenho conta.",
                  style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
              const SizedBox(width: 2),
              TextButton(
                  onPressed: () {},
                  style: ButtonStyle(visualDensity: VisualDensity.compact),
                  child: const Text("Cadastrar", style: TextStyle(fontSize: 14)))
            ]),
          ),
        ],
      ),
    );
  }
}
