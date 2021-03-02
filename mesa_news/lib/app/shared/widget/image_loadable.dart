import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mesa_news/app/shared/utils/app_colors.dart';
import 'package:mesa_news/app/shared/widget/skeleton.dart';

class ImageLoadable extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final BoxFit boxFit;

  ImageLoadable({Key key, @required this.url, this.width, this.height, this.boxFit = BoxFit.cover}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return url == null || url.isEmpty
        ? Container(
            color: AppColors.ACCENT_COLOR,
            width: width,
            height: height,
            alignment: Alignment.center,
            child: const Text("Erro", style: TextStyle(color: Colors.white, fontSize: 15)),
          )
        : CachedNetworkImage(
            imageUrl: url,
            width: width,
            height: height,
            fit: boxFit,
            errorWidget: (_, __, ___) => Container(
              color: AppColors.ACCENT_COLOR,
              width: width,
              height: height,
              alignment: Alignment.center,
              child: const Text("Erro", style: TextStyle(color: Colors.white, fontSize: 15)),
            ),
            placeholder: (context, url) => Skeleton(width: width, height: height),
          );
  }
}
