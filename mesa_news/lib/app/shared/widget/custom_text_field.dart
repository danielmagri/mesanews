import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mesa_news/app/shared/enums/text_field_input_type.dart';
import 'package:mesa_news/app/shared/utils/app_colors.dart';
import 'package:mesa_news/app/shared/validators/confirm_validator.dart';

class CustomTextField extends StatelessWidget {
  final TextFieldInputType inputType;
  final TextEditingController controller;
  final TextEditingController pendentController;
  final bool hasNext;

  const CustomTextField(
      {Key key, @required this.inputType, this.controller, this.pendentController, this.hasNext = false})
      : super(key: key);

  String validate(String value) {
    if (inputType == TextFieldInputType.CONFIRM_PASSWORD) {
      return ConfirmValidator.validate(value, pendentController.text);
    } else {
      return inputType.validator(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(inputType.titleText,
              style: TextStyle(color: AppColors.PRIMARY_DARK_COLOR, fontSize: 12, fontWeight: FontWeight.w500)),
          const SizedBox(height: 5),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: TextFormField(
              controller: controller,
              inputFormatters: inputType.masks,
              keyboardType: inputType.keyboardType,
              obscureText: inputType.isObscure,
              validator: validate,
              textInputAction: hasNext ? TextInputAction.next : TextInputAction.done,
              cursorColor: AppColors.PRIMARY_COLOR,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.TEXT_FIELD_BACKGROUND,
                border: InputBorder.none,
              ),
            ),
          )
        ],
      ),
    );
  }
}
