import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';

import 'data/datasources/news_api_service.dart';
import 'data/datasources/news_cache_data_source.dart';
import 'data/repositories/news_repository_impl.dart';
import 'domain/repositories/news_repository.dart';
import 'domain/usecases/fetch_headlines.dart';
import 'domain/usecases/refresh_headlines.dart';
import 'presentation/cubit/news_cubit.dart';

class NewsModuleFactory {
  NewsModuleFactory({
    required this.apiKey,
    required this.country,
    this.language = 'en',
  });

  final String apiKey;
  final String country;
  final String language;

  Future<NewsRepository> createRepository(
      Database database, http.Client client) async {
    final cache = NewsCacheDataSource(database);
    await cache.init();
    final api = NewsApiService(
      client: client,
      apiKey: apiKey,
      country: country,
      language: language,
    );
    return NewsRepositoryImpl(apiService: api, cacheDataSource: cache);
  }

  NewsCubit createCubit(NewsRepository repository) {
    return NewsCubit(
      repository: repository,
      fetchHeadlines: FetchHeadlinesUseCase(repository: repository),
      refreshHeadlines: RefreshHeadlinesUseCase(repository: repository),
    );
  }
}
