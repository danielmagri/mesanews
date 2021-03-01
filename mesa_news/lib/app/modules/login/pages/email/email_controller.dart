import 'package:flutter/material.dart' show FormState, GlobalKey, TextEditingController;
import 'package:mesa_news/app/modules/login/repositories/login_repository.dart';
import 'package:mesa_news/app/shared/model/generic/result_state_model.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'email_controller.g.dart';

@Injectable()
class EmailController = _EmailControllerBase with _$EmailController;

abstract class _EmailControllerBase extends Disposable with Store {
  final LoginRepository _repository;

  _EmailControllerBase(this._repository);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  ResultState<String> loginState = ResultState();

  void login() async {
    if (formKey.currentState.validate()) {
      loginState.makeRequest(_repository.signin(emailController.text, passwordController.text));
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
