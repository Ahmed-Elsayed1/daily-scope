import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_article.freezed.dart';

/// Domain entity representing a news article.
/// 
/// Contains all information about a news article from the API.
@freezed
class NewsArticle with _$NewsArticle {
  const factory NewsArticle({
    required String id,
    required String title,
    required String source,
    required DateTime publishedAt,
    String? url,
    String? imageUrl,
    String? description,
    String? content,
    String? author,
  }) = _NewsArticle;
}
