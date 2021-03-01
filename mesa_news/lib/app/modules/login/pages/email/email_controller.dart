import 'package:flutter/material.dart' show FormState, GlobalKey;
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'email_controller.g.dart';

@Injectable()
class EmailController = _EmailControllerBase with _$EmailController;

abstract class _EmailControllerBase with Store {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void login() {
    if (formKey.currentState.validate()) {

    }
  }


}
