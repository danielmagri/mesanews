import 'package:flutter/material.dart' show TextInputType;
import 'package:mesa_news/app/shared/validators/email_validator.dart';
import 'package:mesa_news/app/shared/validators/not_empty_validator.dart';

enum TextFieldInputType { EMAIL, PASSWORD }

typedef _validateFunc = String Function(String);

extension TextFieldInputTypeExtension on TextFieldInputType {
  String get titleText {
    switch (this) {
      case TextFieldInputType.EMAIL:
        return "E-mail";
      case TextFieldInputType.PASSWORD:
        return "Senha";
      default:
        return "";
    }
  }

  TextInputType get keyboardType {
    switch (this) {
      case TextFieldInputType.EMAIL:
        return TextInputType.emailAddress;
      case TextFieldInputType.PASSWORD:
        return TextInputType.text;
      default:
        return TextInputType.text;
    }
  }

  bool get isObscure => this == TextFieldInputType.PASSWORD;

  _validateFunc get validator {
    switch (this) {
      case TextFieldInputType.EMAIL:
        return EmailValidator.validate;
      case TextFieldInputType.PASSWORD:
        return NotEmptyValidator.validate;
      default:
        return NotEmptyValidator.validate;
    }
  }
}
