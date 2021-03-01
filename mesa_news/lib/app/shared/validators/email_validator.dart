import 'package:mesa_news/app/shared/constant/string/validation.dart';

class EmailValidator {
  static const String _pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  static String validate(String email, {void Function() onValid, void Function() onInvalid}) {
    if (email == null || email.isEmpty) {
      onInvalid?.call();
      return Validation.MANDATORY_FIELD;
    }

    if (!RegExp(_pattern).hasMatch(email)) {
      onInvalid?.call();
      return Validation.INVALID_EMAIL;
    }

    onValid?.call();
    return null;
  }
}
