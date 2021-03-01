import 'package:flutter/material.dart' show TextInputType;
import 'package:flutter/services.dart';
import 'package:mesa_news/app/shared/utils/masks.dart';
import 'package:mesa_news/app/shared/validators/birthday_validator.dart';
import 'package:mesa_news/app/shared/validators/email_validator.dart';
import 'package:mesa_news/app/shared/validators/not_empty_validator.dart';

enum TextFieldInputType { EMAIL, PASSWORD, NAME, CONFIRM_PASSWORD, BIRTHDAY }

typedef _validateFunc = String Function(String);

extension TextFieldInputTypeExtension on TextFieldInputType {
  String get titleText {
    switch (this) {
      case TextFieldInputType.EMAIL:
        return "E-mail";
      case TextFieldInputType.PASSWORD:
        return "Senha";
      case TextFieldInputType.CONFIRM_PASSWORD:
        return "Confirmar senha";
      case TextFieldInputType.NAME:
        return "Nome";
      case TextFieldInputType.BIRTHDAY:
        return "Data de nascimento - opcional";
      default:
        return "";
    }
  }

  TextInputType get keyboardType {
    switch (this) {
      case TextFieldInputType.EMAIL:
        return TextInputType.emailAddress;
      case TextFieldInputType.CONFIRM_PASSWORD:
      case TextFieldInputType.PASSWORD:
        return TextInputType.text;
      case TextFieldInputType.NAME:
        return TextInputType.name;
      case TextFieldInputType.BIRTHDAY:
        return TextInputType.number;
      default:
        return TextInputType.text;
    }
  }

  bool get isObscure => this == TextFieldInputType.PASSWORD || this == TextFieldInputType.CONFIRM_PASSWORD;

  _validateFunc get validator {
    switch (this) {
      case TextFieldInputType.NAME:
        return NotEmptyValidator.validate;
      case TextFieldInputType.EMAIL:
        return EmailValidator.validate;
      case TextFieldInputType.PASSWORD:
        return NotEmptyValidator.validate;
      case TextFieldInputType.BIRTHDAY:
        return BirthdayValidator.validate;
      default:
        return null;
    }
  }

  List<TextInputFormatter> get masks {
    switch (this) {
      case TextFieldInputType.BIRTHDAY:
        return Masks.birthdayFormatter;
      default:
        return null;
    }
  }
}
