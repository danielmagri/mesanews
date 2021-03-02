class PaginationModel {
  PaginationModel({this.currentPage, this.perPage, this.totalPages, this.totalItems});

  final int currentPage;
  final int perPage;
  final int totalPages;
  final int totalItems;

  factory PaginationModel.fromJson(Map<String, dynamic> json) => PaginationModel(
        currentPage: json['current_page'] ?? 0,
        perPage: json['per_page'] ?? 0,
        totalPages: json['total_pages'] ?? 0,
        totalItems: json['total_items'] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "per_page": perPage,
        "total_pages": totalPages,
        "total_items": totalItems,
      };
}
