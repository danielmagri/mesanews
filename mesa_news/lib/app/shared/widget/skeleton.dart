import 'package:flutter/material.dart'
    show
        BorderRadius,
        BoxDecoration,
        Colors,
        Container,
        EdgeInsets,
        EdgeInsetsGeometry,
        Key,
        StatelessWidget,
        Widget,
        required;
import 'package:mesa_news/app/shared/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({Key key, @required this.width, @required this.height, this.margin = const EdgeInsets.all(0)})
      : child = null,
        super(key: key);

  Skeleton.custom({Key key, @required this.child})
      : width = null,
        height = null,
        margin = null,
        super(key: key);

  final Widget child;
  final double width;
  final double height;
  final EdgeInsets margin;

  @override
  Widget build(_) {
    return Shimmer.fromColors(
      baseColor: AppColors.SHIMMER_BASE,
      highlightColor: AppColors.SHIMMER_HIGHLIGHT,
      child: child != null
          ? child
          : Container(
              width: width,
              height: height,
              margin: margin,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
            ),
    );
  }
}

class ContainerShimmer extends Container {
  final double width;
  final double height;
  final EdgeInsetsGeometry margin;
  ContainerShimmer({@required this.width, @required this.height, this.margin})
      : super(
          width: width,
          height: height,
          margin: margin,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
        );
}
