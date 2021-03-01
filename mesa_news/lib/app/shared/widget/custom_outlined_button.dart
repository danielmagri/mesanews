import 'package:flutter/material.dart'
    show
        BorderSide,
        ButtonStyle,
        Color,
        Colors,
        Container,
        EdgeInsets,
        Key,
        MaterialStateProperty,
        OutlinedButton,
        StatelessWidget,
        Text,
        TextStyle,
        Widget,
        required;
import 'package:mesa_news/app/shared/utils/app_colors.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color borderColor;
  final Color overlayColor;
  final Function onTap;

  CustomOutlinedButton.white({Key key, @required this.text, this.onTap})
      : textColor = Colors.white,
        borderColor = Colors.white,
        overlayColor = Colors.white24,
        super(key: key);

  CustomOutlinedButton.blue({Key key, @required this.text, this.onTap})
      : textColor = AppColors.PRIMARY_COLOR,
        borderColor = AppColors.PRIMARY_DARK_COLOR,
        overlayColor = AppColors.PRIMARY_COLOR.withAlpha(100),
        super(key: key);

  @override
  Widget build(_) {
    return Container(
      width: double.maxFinite,
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: OutlinedButton(
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
          style: ButtonStyle(
            side: MaterialStateProperty.all(BorderSide(color: borderColor)),
            overlayColor: MaterialStateProperty.all<Color>(overlayColor),
          ),
          onPressed: onTap),
    );
  }
}
