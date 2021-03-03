import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mesa_news/app/modules/home/model/news_model.dart';
import 'package:mesa_news/app/shared/base/base_modular_state.dart';
import 'package:mesa_news/app/shared/utils/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'details_controller.dart';

class DetailsPage extends StatefulWidget {
  final NewsModel news;

  const DetailsPage({Key key, @required this.news}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends BaseModularState<DetailsPage, DetailsController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: const CloseButton(),
          leadingWidth: 45,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 4),
              Text(widget.news == null ? "Erro" : widget.news.title,
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
              const SizedBox(height: 4),
              if (widget.news != null)
                Text(widget.news.url, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500)),
            ],
          ),
          centerTitle: true,
        ),
        body: widget.news == null
            ? Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 55),
                    Icon(Icons.error_outline, color: AppColors.GRAY_LIGHT, size: 80),
                    const SizedBox(height: 32),
                    Text(
                      "Erro",
                      style: const TextStyle(fontSize: 18, color: AppColors.GRAY, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Houve um problema.\nTente novamente mais tarde.",
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 14, color: AppColors.GRAY, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              )
            : WebView(
                initialUrl: widget.news.url,
              ));
  }
}
