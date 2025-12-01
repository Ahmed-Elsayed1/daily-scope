import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_article.freezed.dart';

@freezed
class NewsArticle with _$NewsArticle {
  const factory NewsArticle({
    required String id,
    required String title,
    required String source,
    required DateTime publishedAt,
    String? imageUrl,
    String? description,
  }) = _NewsArticle;
}
