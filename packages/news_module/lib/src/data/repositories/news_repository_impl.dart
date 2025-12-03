import '../../domain/entities/news_article.dart';
import '../../domain/repositories/news_repository.dart';
import '../datasources/news_api_service.dart';
import '../datasources/news_cache_data_source.dart';
import '../models/news_article_model.dart';

/// Implementation of [NewsRepository] using NewsAPI and SQLite cache.
class NewsRepositoryImpl implements NewsRepository {
  /// Creates a news repository implementation
  NewsRepositoryImpl({
    required this.apiService,
    required this.cacheDataSource,
  });

  final NewsApiService apiService;
  final NewsCacheDataSource cacheDataSource;

  @override
  Future<void> cacheArticles(List<NewsArticle> articles) async {
    final models = articles.map(NewsArticleModel.fromEntity).toList();
    await cacheDataSource.cacheArticles(models);
  }

  @override
  Future<void> clearCache() => cacheDataSource.clear();

  @override
  Future<List<NewsArticle>> fetchHeadlines({required int page}) async {
    final models = await apiService.fetchHeadlines(page: page);
    await cacheDataSource.cacheArticles(models);
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<NewsArticle>> searchArticles({
    required String query,
    required int page,
  }) async {
    final models = await apiService.searchArticles(query: query, page: page);
    // Optionally cache search results too
    await cacheDataSource.cacheArticles(models);
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<NewsArticle>> fetchByCategory({
    required String category,
    required int page,
  }) async {
    final models =
        await apiService.fetchByCategory(category: category, page: page);
    await cacheDataSource.cacheArticles(models);
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<NewsArticle>> loadCachedHeadlines() async {
    final models = await cacheDataSource.readArticles();
    return models.map((model) => model.toEntity()).toList();
  }
}
