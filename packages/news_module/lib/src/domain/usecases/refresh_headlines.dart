import '../entities/news_article.dart';
import '../repositories/news_repository.dart';

class RefreshHeadlinesUseCase {
  const RefreshHeadlinesUseCase({required this.repository});

  final NewsRepository repository;

  Future<List<NewsArticle>> call() async {
    await repository.clearCache();
    return repository.fetchHeadlines(page: 1);
  }
}
