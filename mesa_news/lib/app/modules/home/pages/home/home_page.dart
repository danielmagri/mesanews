import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mesa_news/app/modules/home/widgets/highlights_item.dart';
import 'package:mesa_news/app/shared/base/base_modular_state.dart';
import 'package:mesa_news/app/shared/widget/skeleton.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BaseModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    controller.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mesa News", style: Theme.of(context).textTheme.headline6),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 16, bottom: 16),
            child: Text("Destaques", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700)),
          ),
          Observer(
              builder: (_) => controller.highlightsState.handleState(
                    () => Skeleton.custom(
                      child: CarouselSlider.builder(
                        itemCount: 2,
                        itemBuilder: (context, i) => HighlightsItemShimmer(),
                        options: CarouselOptions(
                          initialPage: 0,
                          viewportFraction: 0.9,
                          enableInfiniteScroll: false,
                          height: 140,
                        ),
                      ),
                    ),
                    (data) => CarouselSlider.builder(
                      itemCount: data.length,
                      itemBuilder: (context, i) => HighlightsItem(data: data[i]),
                      options: CarouselOptions(
                        initialPage: 0,
                        viewportFraction: 0.9,
                        enableInfiniteScroll: false,
                        height: 140,
                      ),
                    ),
                    handleError,
                  )),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 16, bottom: 18),
            child: Text("Últimas notícias",
                style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700)),
          ),
          
        ],
      ),
    );
  }
}
