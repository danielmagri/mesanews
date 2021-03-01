import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

abstract class Masks {
  static get birthdayFormatter => [
        MaskTextInputFormatter(mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')})
      ];
}
