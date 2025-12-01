import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/news_article.dart';
import '../../domain/repositories/news_repository.dart';
import '../../domain/usecases/fetch_headlines.dart';
import '../../domain/usecases/refresh_headlines.dart';

part 'news_cubit.freezed.dart';

enum NewsStatus { initial, loading, success, failure }

class NewsCubit extends Cubit<NewsState> {
  NewsCubit({
    required NewsRepository repository,
    required this.fetchHeadlines,
    required this.refreshHeadlines,
  })  : _repository = repository,
        super(const NewsState()) {
    _hydrateFromCache();
  }

  final NewsRepository _repository;
  final FetchHeadlinesUseCase fetchHeadlines;
  final RefreshHeadlinesUseCase refreshHeadlines;

  Future<void> _hydrateFromCache() async {
    final cached = await _repository.loadCachedHeadlines();
    if (cached.isNotEmpty) {
      emit(state.copyWith(
        status: NewsStatus.success,
        articles: cached,
        page: 1,
      ));
    }
    await loadNextPage();
  }

  Future<void> loadNextPage() async {
    if (state.hasReachedMax || state.status == NewsStatus.loading) {
      return;
    }
    emit(state.copyWith(status: NewsStatus.loading, errorMessage: null));
    final nextPage = state.articles.isEmpty ? 1 : state.page + 1;
    try {
      final articles = await fetchHeadlines(page: nextPage);
      emit(state.copyWith(
        status: NewsStatus.success,
        articles: [...state.articles, ...articles],
        page: nextPage,
        hasReachedMax: articles.isEmpty,
        lastUpdated: DateTime.now(),
      ));
    } catch (error) {
      emit(state.copyWith(
        status: NewsStatus.failure,
        errorMessage: error.toString(),
      ));
    }
  }

  Future<void> refresh() async {
    emit(state.copyWith(
      status: NewsStatus.loading,
      page: 1,
      hasReachedMax: false,
      errorMessage: null,
    ));
    try {
      final articles = await refreshHeadlines();
      emit(state.copyWith(
        status: NewsStatus.success,
        articles: articles,
        page: 1,
        hasReachedMax: articles.isEmpty,
        lastUpdated: DateTime.now(),
      ));
    } catch (error) {
      emit(state.copyWith(
        status: NewsStatus.failure,
        errorMessage: error.toString(),
      ));
    }
  }
}

@freezed
class NewsState with _$NewsState {
  const factory NewsState({
    @Default(NewsStatus.initial) NewsStatus status,
    @Default(<NewsArticle>[]) List<NewsArticle> articles,
    @Default(1) int page,
    @Default(false) bool hasReachedMax,
    String? errorMessage,
    DateTime? lastUpdated,
  }) = _NewsState;
}
