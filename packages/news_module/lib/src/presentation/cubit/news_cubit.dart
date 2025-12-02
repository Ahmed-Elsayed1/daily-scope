import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/news_article.dart';
import '../../domain/repositories/news_repository.dart';
import '../../domain/usecases/fetch_headlines.dart';
import '../../domain/usecases/refresh_headlines.dart';

part 'news_cubit.freezed.dart';

/// Status enum for news operations
enum NewsStatus {
  /// Initial state
  initial,

  /// Loading data
  loading,

  /// Successfully loaded
  success,

  /// Error occurred
  failure,
}

/// Cubit for managing news state.
///
/// Handles fetching, searching, filtering, and caching of  news articles.
class NewsCubit extends Cubit<NewsState> {
  /// Creates a news cubit
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

  /// Loads cached articles on initialization
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

  /// Loads the next page of articles
  Future<void> loadNextPage() async {
    if (state.hasReachedMax) {
      return;
    }

    emit(state.copyWith(status: NewsStatus.loading, errorMessage: null));
    final nextPage = state.articles.isEmpty ? 1 : state.page + 1;

    try {
      List<NewsArticle> articles;

      // Determine which fetch method to use based on current filter/search
      if (state.searchQuery != null && state.searchQuery!.isNotEmpty) {
        articles = await _repository.searchArticles(
          query: state.searchQuery!,
          page: nextPage,
        );
      } else if (state.category != null && state.category!.isNotEmpty) {
        articles = await _repository.fetchByCategory(
          category: state.category!,
          page: nextPage,
        );
      } else {
        articles = await fetchHeadlines(page: nextPage);
      }

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
        errorMessage: error.toString().replaceAll('Exception: ', ''),
      ));
    }
  }

  /// Refreshes the article list (pull-to-refresh)
  Future<void> refresh() async {
    emit(state.copyWith(
      status: NewsStatus.loading,
      page: 1,
      hasReachedMax: false,
      errorMessage: null,
      articles: [], // Clear existing articles
    ));

    try {
      List<NewsArticle> articles;

      if (state.searchQuery != null && state.searchQuery!.isNotEmpty) {
        articles = await _repository.searchArticles(
          query: state.searchQuery!,
          page: 1,
        );
      } else if (state.category != null && state.category!.isNotEmpty) {
        articles = await _repository.fetchByCategory(
          category: state.category!,
          page: 1,
        );
      } else {
        articles = await refreshHeadlines();
      }

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
        errorMessage: error.toString().replaceAll('Exception: ', ''),
      ));
    }
  }

  /// Searches articles by keyword
  Future<void> search(String query) async {
    emit(state.copyWith(
      searchQuery: query,
      category: null, // Clear category when searching
      articles: [],
      page: 1,
      hasReachedMax: false,
      status: NewsStatus.loading,
      errorMessage: null,
    ));

    await loadNextPage();
  }

  /// Filters articles by category
  Future<void> filterByCategory(String category) async {
    emit(state.copyWith(
      category: category,
      searchQuery: null, // Clear search when filtering
      articles: [],
      page: 1,
      hasReachedMax: false,
      status: NewsStatus.loading,
      errorMessage: null,
    ));

    await loadNextPage();
  }

  /// Clears all filters and returns to headlines
  Future<void> clearFilters() async {
    emit(state.copyWith(
      searchQuery: null,
      category: null,
      articles: [],
      page: 1,
      hasReachedMax: false,
      status: NewsStatus.loading,
      errorMessage: null,
    ));

    await loadNextPage();
  }
}

/// State for news
@freezed
class NewsState with _$NewsState {
  const factory NewsState({
    @Default(NewsStatus.initial) NewsStatus status,
    @Default(<NewsArticle>[]) List<NewsArticle> articles,
    @Default(1) int page,
    @Default(false) bool hasReachedMax,
    String? errorMessage,
    DateTime? lastUpdated,
    String? searchQuery,
    String? category,
  }) = _NewsState;
}
