import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mesa_news/app/shared/base/base_modular_state.dart';
import 'package:mesa_news/app/shared/constant/assets/images.dart';
import 'package:mesa_news/app/shared/constant/routes/routes.dart';
import 'package:mesa_news/app/shared/enums/text_field_input_type.dart';
import 'package:mesa_news/app/shared/utils/app_colors.dart';
import 'package:mesa_news/app/shared/widget/custom_elevated_button.dart';
import 'package:mesa_news/app/shared/widget/custom_text_field.dart';
import 'email_controller.dart';

class EmailPage extends StatefulWidget {
  const EmailPage({Key key}) : super(key: key);

  @override
  _EmailPageState createState() => _EmailPageState();
}

class _EmailPageState extends BaseModularState<EmailPage, EmailController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    disposers = [
      controller.signinState.handleState(handleLoading, (data) {
        Modular.to.pushNamedAndRemoveUntil(Routes.HOME, (_) => false);
      }, handleError),
    ];
    super.initState();
  }

  void goToSignupLogin() {
    Modular.link.pushReplacementNamed(Routes.SIGNUP_LOGIN);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const CloseButton(),
        title: Text("Entrar com e-mail", style: Theme.of(context).textTheme.headline6),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Image.asset(Images.LOGIN, width: 120),
              const SizedBox(height: 50),
              CustomTextField(
                inputType: TextFieldInputType.EMAIL,
                controller: controller.emailController,
                hasNext: true,
              ),
              const SizedBox(height: 26),
              CustomTextField(
                inputType: TextFieldInputType.PASSWORD,
                controller: controller.passwordController,
              ),
              const SizedBox(height: 32),
              CustomElevatedButton.blue(text: "Login", onTap: controller.signin),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Não tenho conta.",
                      style: TextStyle(color: AppColors.PRIMARY_COLOR, fontSize: 14, fontWeight: FontWeight.w500)),
                  const SizedBox(width: 2),
                  TextButton(
                      onPressed: goToSignupLogin,
                      style: ButtonStyle(visualDensity: VisualDensity.compact),
                      child: const Text("Cadastrar", style: TextStyle(fontSize: 14)))
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
