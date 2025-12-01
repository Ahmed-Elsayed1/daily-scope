import '../entities/news_article.dart';
import '../repositories/news_repository.dart';

class FetchHeadlinesUseCase {
  const FetchHeadlinesUseCase({required this.repository});

  final NewsRepository repository;

  Future<List<NewsArticle>> call({required int page}) {
    return repository.fetchHeadlines(page: page);
  }
}
