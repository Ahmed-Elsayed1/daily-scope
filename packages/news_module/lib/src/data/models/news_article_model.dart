import '../../domain/entities/news_article.dart';

/// Data model for news articles from the NewsAPI.
///
/// Maps between the API JSON format and the domain entity.
class NewsArticleModel {
  /// Creates a news article model
  const NewsArticleModel({
    required this.id,
    required this.title,
    required this.source,
    required this.publishedAt,
    this.url,
    this.imageUrl,
    this.description,
    this.content,
    this.author,
  });

  final String id;
  final String title;
  final String source;
  final DateTime publishedAt;
  final String? url;
  final String? imageUrl;
  final String? description;
  final String? content;
  final String? author;

  /// Converts this model to a domain entity
  NewsArticle toEntity() => NewsArticle(
        id: id,
        title: title,
        source: source,
        publishedAt: publishedAt,
        url: url,
        imageUrl: imageUrl,
        description: description,
        content: content,
        author: author,
      );

  /// Converts this model to a map for SQLite storage
  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'source': source,
        'published_at': publishedAt.toIso8601String(),
        'url': url,
        'image_url': imageUrl,
        'description': description,
        'content': content,
        'author': author,
      };

  /// Creates a model from a domain entity
  factory NewsArticleModel.fromEntity(NewsArticle article) {
    return NewsArticleModel(
      id: article.id,
      title: article.title,
      source: article.source,
      publishedAt: article.publishedAt,
      url: article.url,
      imageUrl: article.imageUrl,
      description: article.description,
      content: article.content,
      author: article.author,
    );
  }

  /// Creates a model from a SQLite map
  factory NewsArticleModel.fromMap(Map<String, dynamic> map) {
    return NewsArticleModel(
      id: map['id'] as String,
      title: map['title'] as String,
      source: map['source'] as String,
      publishedAt: DateTime.parse(map['published_at'] as String),
      url: map['url'] as String?,
      imageUrl: map['image_url'] as String?,
      description: map['description'] as String?,
      content: map['content'] as String?,
      author: map['author'] as String?,
    );
  }
}
