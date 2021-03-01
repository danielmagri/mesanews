import 'package:mesa_news/app/shared/constant/string/validation.dart';

class NotEmptyValidator {
  static String validate(String text, {void Function() onValid, void Function() onInvalid}) {
    if (text == null || text.isEmpty) {
      onInvalid?.call();
      return Validation.MANDATORY_FIELD;
    }

    onValid?.call();
    return null;
  }
}
