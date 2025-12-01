import '../../domain/entities/news_article.dart';

class NewsArticleModel {
  const NewsArticleModel({
    required this.id,
    required this.title,
    required this.source,
    required this.publishedAt,
    this.imageUrl,
    this.description,
  });

  final String id;
  final String title;
  final String source;
  final DateTime publishedAt;
  final String? imageUrl;
  final String? description;

  NewsArticle toEntity() => NewsArticle(
        id: id,
        title: title,
        source: source,
        publishedAt: publishedAt,
        imageUrl: imageUrl,
        description: description,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'source': source,
        'published_at': publishedAt.toIso8601String(),
        'image_url': imageUrl,
        'description': description,
      };

  factory NewsArticleModel.fromEntity(NewsArticle article) {
    return NewsArticleModel(
      id: article.id,
      title: article.title,
      source: article.source,
      publishedAt: article.publishedAt,
      imageUrl: article.imageUrl,
      description: article.description,
    );
  }

  factory NewsArticleModel.fromMap(Map<String, dynamic> map) {
    return NewsArticleModel(
      id: map['id'] as String,
      title: map['title'] as String,
      source: map['source'] as String,
      publishedAt: DateTime.parse(map['published_at'] as String),
      imageUrl: map['image_url'] as String?,
      description: map['description'] as String?,
    );
  }
}
