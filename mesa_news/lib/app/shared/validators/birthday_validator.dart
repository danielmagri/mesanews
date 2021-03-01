import 'package:intl/intl.dart';
import 'package:mesa_news/app/shared/constant/string/validation.dart';

class BirthdayValidator {
  static String validate(String text) {
    if (text.isEmpty) {
      return null;
    }

    try {
      var date = DateFormat("dd/MM/yyyy").parse(text);

      if (date.isBefore(DateTime.now())) {
        return null;
      } else {
        return Validation.INVALID_DATE;
      }
    } on Exception {
      return Validation.INVALID_DATE;
    }
  }
}
