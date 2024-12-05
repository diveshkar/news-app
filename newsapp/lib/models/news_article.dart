class NewsArticle {
  final String title;
  final String? description;
  final String url;
  final String? urlToImage;
  final String publishedAt;

  NewsArticle({
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'] ?? 'No Title',
      description: json['description'],
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'] ?? '',
    );
  }

  static List<NewsArticle> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => NewsArticle.fromJson(json)).toList();
  }
}
