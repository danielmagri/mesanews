import 'package:flutter/material.dart' show FormState, GlobalKey, TextEditingController;
import 'package:mesa_news/app/modules/login/model/token_model.dart';
import 'package:mesa_news/app/modules/login/repositories/login_repository.dart';
import 'package:mesa_news/app/shared/model/generic/result_state_model.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'signup_controller.g.dart';

@Injectable()
class SignupController = _SignupControllerBase with _$SignupController;

abstract class _SignupControllerBase extends Disposable with Store {
  final LoginRepository _repository;

  _SignupControllerBase(this._repository);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();

  final ResultState<TokenModel> signupState = ResultState();

  void signup() async {
    if (formKey.currentState.validate()) {
      signupState.makeRequest(_repository.signup(
          nameController.text, emailController.text, passwordController.text, birthdayController.text));
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    birthdayController.dispose();
  }
}
