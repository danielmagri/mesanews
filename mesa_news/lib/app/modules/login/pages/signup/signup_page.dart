import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mesa_news/app/shared/base/base_modular_state.dart';
import 'package:mesa_news/app/shared/constant/routes/routes.dart';
import 'package:mesa_news/app/shared/enums/text_field_input_type.dart';
import 'package:mesa_news/app/shared/widget/custom_elevated_button.dart';
import 'package:mesa_news/app/shared/widget/custom_text_field.dart';
import 'signup_controller.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends BaseModularState<SignupPage, SignupController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    disposers = [
      controller.signupState.handleState(handleLoading, (data) {
        Modular.to.pushNamedAndRemoveUntil(Routes.HOME, (_) => false);
      }, handleError),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(),
        title: Text("Cadastrar", style: Theme.of(context).textTheme.headline6),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomTextField(
                inputType: TextFieldInputType.NAME,
                controller: controller.nameController,
                hasNext: true,
              ),
              const SizedBox(height: 26),
              CustomTextField(
                inputType: TextFieldInputType.EMAIL,
                controller: controller.emailController,
                hasNext: true,
              ),
              const SizedBox(height: 26),
              CustomTextField(
                inputType: TextFieldInputType.PASSWORD,
                controller: controller.passwordController,
                hasNext: true,
              ),
              const SizedBox(height: 26),
              CustomTextField(
                inputType: TextFieldInputType.CONFIRM_PASSWORD,
                controller: controller.confirmPasswordController,
                pendentController: controller.passwordController,
                hasNext: true,
              ),
              const SizedBox(height: 26),
              CustomTextField(
                inputType: TextFieldInputType.BIRTHDAY,
                controller: controller.birthdayController,
              ),
              const SizedBox(height: 32),
              CustomElevatedButton.blue(text: "Cadastrar", onTap: controller.signup),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
