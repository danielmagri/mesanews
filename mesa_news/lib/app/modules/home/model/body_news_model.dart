import 'package:mesa_news/app/modules/home/model/news_model.dart';
import 'package:mesa_news/app/modules/home/model/pagination_model.dart';

class BodyNewsModel {
  BodyNewsModel({this.pagination, this.data});

  final PaginationModel pagination;
  final List<NewsModel> data;

  factory BodyNewsModel.fromJson(Map<String, dynamic> json) => BodyNewsModel(
        pagination: json['pagination'] != null ? PaginationModel.fromJson(json['pagination']) : null,
        data: json['data'] != null ? List.from(json['data'].map((e) => NewsModel.fromJson(e))) : [],
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination.toJson(),
        "data": data.map((e) => e.toJson()).toList(),
      };
}
