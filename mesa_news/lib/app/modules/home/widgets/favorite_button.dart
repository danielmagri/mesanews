import 'package:flutter/material.dart';
import 'package:mesa_news/app/shared/utils/app_colors.dart';

class FavoriteButton extends StatefulWidget {
  final bool isFavorited;
  final Function onTap;

  const FavoriteButton({Key key, this.isFavorited, this.onTap}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(_) {
    return IconButton(
      icon: Icon(widget.isFavorited ? Icons.bookmark : Icons.bookmark_border),
      color: AppColors.PRIMARY_COLOR,
      visualDensity: VisualDensity.compact,
      splashRadius: 24,
      onPressed: widget.onTap,
    );
  }
}
