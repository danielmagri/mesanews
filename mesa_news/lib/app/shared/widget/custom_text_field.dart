import 'package:flutter/material.dart';
import 'package:mesa_news/app/shared/enums/text_field_input_type.dart';
import 'package:mesa_news/app/shared/utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextFieldInputType inputType;
  final TextEditingController controller;
  final bool hasNext;

  const CustomTextField({Key key, @required this.inputType, this.controller, this.hasNext = false}) : super(key: key);

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
              keyboardType: inputType.keyboardType,
              obscureText: inputType.isObscure,
              validator: inputType.validator,
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
