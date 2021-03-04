import 'package:flutter/material.dart'
    show
        BorderRadius,
        BoxFit,
        ClipRRect,
        Colors,
        Column,
        CrossAxisAlignment,
        EdgeInsets,
        Expanded,
        FontStyle,
        FontWeight,
        GestureDetector,
        Key,
        MainAxisAlignment,
        Padding,
        Row,
        SizedBox,
        Spacer,
        StatelessWidget,
        Text,
        TextOverflow,
        TextStyle,
        Widget;
import 'package:mesa_news/app/modules/home/model/news_model.dart';
import 'package:mesa_news/app/modules/home/widgets/favorite_button.dart';
import 'package:mesa_news/app/shared/widget/image_loadable.dart';
import 'package:mesa_news/app/shared/widget/skeleton.dart';

class HighlightsItemShimmer extends StatelessWidget {
  @override
  Widget build(_) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        ContainerShimmer(width: 128, height: 128),
        const SizedBox(width: 16),
        Expanded(
          child: SizedBox(
            height: 128,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ContainerShimmer(width: double.maxFinite, height: 18),
              const SizedBox(height: 4),
              ContainerShimmer(width: double.maxFinite, height: 18),
              const SizedBox(height: 4),
              ContainerShimmer(width: 50, height: 18),
              const Spacer(),
              Row(children: [
                FavoriteButton(isFavorited: true),
                ContainerShimmer(width: 75, height: 15),
              ]),
              const Spacer(),
            ]),
          ),
        ),
        const SizedBox(width: 8),
      ]),
    );
  }
}

class HighlightsItem extends StatelessWidget {
  final NewsModel data;
  final Function onTap;
  final Function onFavoriteTap;

  const HighlightsItem({Key key, this.data, this.onTap, this.onFavoriteTap}) : super(key: key);

  @override
  Widget build(_) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: ImageLoadable(url: data.imageUrl, width: 128, height: 128, boxFit: BoxFit.cover)),
          const SizedBox(width: 16),
          Expanded(
            child: SizedBox(
              height: 128,
              child: Column(children: [
                Text(
                  data.title,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                Row(children: [
                  FavoriteButton(isFavorited: data.isFavorited, onTap: onFavoriteTap),
                  Text(data.publishedDateText,
                      style: const TextStyle(
                          color: Colors.black, fontSize: 13, fontStyle: FontStyle.italic, fontWeight: FontWeight.w400)),
                ]),
                const Spacer(),
              ]),
            ),
          ),
          const SizedBox(width: 8),
        ]),
      ),
    );
  }
}
