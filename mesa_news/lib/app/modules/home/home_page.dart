import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mesa_news/app/modules/home/model/filter_model.dart';
import 'package:mesa_news/app/modules/home/model/news_model.dart';
import 'package:mesa_news/app/modules/home/widgets/highlights_item.dart';
import 'package:mesa_news/app/modules/home/widgets/news_item.dart';
import 'package:mesa_news/app/shared/base/base_modular_state.dart';
import 'package:mesa_news/app/shared/constant/routes/routes.dart';
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
    controller.start();
    super.initState();
  }

  void logout() {
    controller.logout();
    Modular.to.popAndPushNamed(Routes.LOGIN);
  }

  void goToDetails(NewsModel news) {
    Modular.to.pushNamed(Routes.DETAILS, arguments: news);
  }

  void goToFilter() {
    Modular.to.pushNamed(
      Routes.FILTER,
      arguments: controller.filter,
    )..then((value) => value is FilterModel ? controller.setFilter(value) : null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Mesa News", style: Theme.of(context).textTheme.headline6),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            tooltip: 'Filtro',
            onPressed: goToFilter,
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: logout,
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: controller.scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 16, bottom: 16),
              child:
                  Text("Destaques", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700)),
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
                        itemBuilder: (context, i) => HighlightsItem(
                          data: data[i],
                          onTap: () => goToDetails(data[i]),
                        ),
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
            Observer(
              builder: (_) => controller.newsState.listIsEmpty
                  ? Center(child: Text("Nenhuma notícia encontrada."))
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.newsState.length,
                      itemBuilder: (context, index) => controller.newsState.widgetBuilder(
                          index: index,
                          shimmerItem: () => NewsItemShimmer(),
                          item: (data) => NewsItem(
                                data: data,
                                onTap: () => goToDetails(data),
                              )),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
