import '../entities/news_article.dart';

/// Repository interface for news data operations.
/// 
/// Defines methods for fetching, searching, and caching news articles.
abstract class NewsRepository {
  /// Fetches top headlines with pagination
  Future<List<NewsArticle>> fetchHeadlines({required int page});
  
  /// Searches articles by keyword
  Future<List<NewsArticle>> searchArticles({
    required String query,
    required int page,
  });
  
  /// Fetches headlines filtered by category
  Future<List<NewsArticle>> fetchByCategory({
    required String category,
    required int page,
  });
  
  /// Loads cached articles from local storage
  Future<List<NewsArticle>> loadCachedHeadlines();
  
  /// Caches articles to local storage
  Future<void> cacheArticles(List<NewsArticle> articles);
  
  /// Clears all cached articles
  Future<void> clearCache();
}
