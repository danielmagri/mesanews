import 'package:flutter/material.dart'
    show
        BorderRadius,
        BoxFit,
        ClipRRect,
        Colors,
        Column,
        CrossAxisAlignment,
        EdgeInsets,
        FontStyle,
        FontWeight,
        InkWell,
        Key,
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
import 'package:mesa_news/app/shared/widget/image_loadable.dart';
import 'package:mesa_news/app/shared/widget/skeleton.dart';

class NewsItemShimmer extends StatelessWidget {
  @override
  Widget build(_) {
    return Skeleton.custom(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContainerShimmer(width: double.maxFinite, height: 145),
            const SizedBox(height: 12),
            ContainerShimmer(width: double.maxFinite, height: 18),
            const SizedBox(height: 4),
            ContainerShimmer(width: 100, height: 18),
            const SizedBox(height: 8),
            ContainerShimmer(width: double.maxFinite, height: 15),
            const SizedBox(height: 4),
            ContainerShimmer(width: double.maxFinite, height: 15),
            const SizedBox(height: 4),
            ContainerShimmer(width: 50, height: 15),
          ],
        ),
      ),
    );
  }
}

class NewsItem extends StatelessWidget {
  final NewsModel data;
  final Function onTap;

  const NewsItem({Key key, this.data, this.onTap}) : super(key: key);

  @override
  Widget build(_) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(5),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: ImageLoadable(url: data.imageUrl, width: double.maxFinite, height: 145, boxFit: BoxFit.cover)),
            const SizedBox(height: 12),
            Row(children: [
              const Spacer(),
              Text(data.publishedDateText,
                  style: const TextStyle(
                      color: Colors.black, fontSize: 13, fontStyle: FontStyle.italic, fontWeight: FontWeight.w400)),
            ]),
            const SizedBox(height: 12),
            Text(
              data.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text(
              data.description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
