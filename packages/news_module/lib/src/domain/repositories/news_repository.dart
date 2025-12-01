import '../entities/news_article.dart';

abstract class NewsRepository {
  Future<List<NewsArticle>> fetchHeadlines({required int page});
  Future<List<NewsArticle>> loadCachedHeadlines();
  Future<void> cacheArticles(List<NewsArticle> articles);
  Future<void> clearCache();
}
