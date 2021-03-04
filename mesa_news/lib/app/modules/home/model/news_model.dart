class NewsModel {
  NewsModel(
      {this.title,
      this.description,
      this.content,
      this.author,
      this.publishedAt,
      this.highlight,
      this.url,
      this.imageUrl});

  final String title;
  final String description;
  final String content;
  final String author;
  final String publishedAt;
  final bool highlight;
  final String url;
  final String imageUrl;

  bool isFavorited = false;

  String get publishedDateText {
    try {
      var date = DateTime.parse(publishedAt);
      var difference = DateTime.now().difference(date);

      if (difference.inMinutes < 60) {
        return "${difference.inMinutes} minutos atrás";
      } else if (difference.inHours < 24) {
        return "${difference.inHours} horas atrás";
      } else if (difference.inDays < 7) {
        return "${difference.inDays} dias atrás";
      } else {
        return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year.toString()}";
      }
    } catch (_) {
      return "erro";
    }
  }

  String get dateFormatted {
    try {
      var date = DateTime.parse(publishedAt);

      return "${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
    } catch (_) {
      return "";
    }
  }

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        title: json['title'] ?? "",
        description: json['description'] ?? "",
        content: json['content'] ?? "",
        author: json['author'] ?? "",
        publishedAt: json['published_at'] ?? "",
        highlight: _mapHighlight(json['highlight']),
        url: json['url'] ?? "",
        imageUrl: json['image_url'] ?? "",
      );

  static bool _mapHighlight(dynamic value) {
    if (value == null) return false;
    if (value is int) {
      return value == 1;
    } else {
      return value;
    }
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "content": content,
        "author": author,
        "published_at": dateFormatted,
        "highlight": highlight ? 1 : 0,
        "url": url,
        "image_url": imageUrl,
      };
}
