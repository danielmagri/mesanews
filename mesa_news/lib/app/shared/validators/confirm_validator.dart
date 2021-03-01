import 'package:mesa_news/app/shared/constant/string/validation.dart';

class ConfirmValidator {
  static String validate(String value, String fieldToCompare) {
    if (value == null || value.isEmpty) {
      return Validation.MANDATORY_FIELD;
    }
    
    return fieldToCompare == value ? null : Validation.PASSWORD_NOT_MATCH;
  }
}
