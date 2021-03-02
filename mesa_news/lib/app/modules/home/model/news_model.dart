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
        return "${date.day.toString().padLeft(2,'0')}/${date.month.toString().padLeft(2,'0')}/${date.year.toString()}";
      }
    } catch (_) {
      return "erro";
    }
  }

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        title: json['title'] ?? "",
        description: json['description'] ?? "",
        content: json['content'] ?? "",
        author: json['author'] ?? "",
        publishedAt: json['published_at'] ?? "",
        highlight: json['highlight'] ?? false,
        url: json['url'] ?? "",
        imageUrl: json['image_url'] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "content": content,
        "author": author,
        "published_at": publishedAt,
        "highlight": highlight,
        "url": url,
        "image_url": imageUrl,
      };
}
