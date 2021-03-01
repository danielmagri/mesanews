import 'package:flutter/material.dart'
    show
        ButtonStyle,
        Color,
        Colors,
        Container,
        EdgeInsets,
        ElevatedButton,
        Key,
        MaterialStateProperty,
        StatelessWidget,
        Text,
        TextStyle,
        Widget,
        required;
import 'package:mesa_news/app/shared/utils/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color background;
  final Color overlayColor;
  final Function onTap;

  CustomElevatedButton.blue({Key key, @required this.text, this.onTap})
      : textColor = Colors.white,
        background = AppColors.PRIMARY_COLOR,
        overlayColor = Colors.white24,
        super(key: key);

  @override
  Widget build(_) {
    return Container(
      width: double.maxFinite,
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(background),
            overlayColor: MaterialStateProperty.all<Color>(overlayColor),
          ),
          onPressed: onTap),
    );
  }
}
