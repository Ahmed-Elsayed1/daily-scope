import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/news_article.dart';
import '../../domain/repositories/news_repository.dart';
import '../../domain/usecases/fetch_headlines.dart';
import '../../domain/usecases/refresh_headlines.dart';

part 'news_cubit.freezed.dart';

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
        super(const NewsState.initial()) {
    _hydrateFromCache();
  }

  final NewsRepository _repository;
  final FetchHeadlinesUseCase fetchHeadlines;
  final RefreshHeadlinesUseCase refreshHeadlines;

  /// Loads cached articles on initialization
  Future<void> _hydrateFromCache() async {
    final cached = await _repository.loadCachedHeadlines();
    if (cached.isNotEmpty) {
      emit(NewsState.loaded(
        articles: cached,
        page: 1,
      ));
    }
    await loadNextPage();
  }

  /// Loads the next page of articles
  Future<void> loadNextPage() async {
    final currentState = state;

    // If already loading or reached max, do nothing
    if (currentState is _Loaded &&
        (currentState.isLoadingMore || currentState.hasReachedMax)) {
      return;
    }

    // Determine current params
    final int nextPage;
    final String? searchQuery;
    final String? category;
    final List<NewsArticle> currentArticles;

    if (currentState is _Loaded) {
      nextPage = currentState.page + 1;
      searchQuery = currentState.searchQuery;
      category = currentState.category;
      currentArticles = currentState.articles;
      emit(currentState.copyWith(isLoadingMore: true));
    } else {
      nextPage = 1;
      searchQuery = null;
      category = null;
      currentArticles = [];
      emit(const NewsState.loading());
    }

    try {
      List<NewsArticle> articles;

      // Determine which fetch method to use based on current filter/search
      if (searchQuery != null && searchQuery.isNotEmpty) {
        articles = await _repository.searchArticles(
          query: searchQuery,
          page: nextPage,
        );
      } else if (category != null && category.isNotEmpty) {
        articles = await _repository.fetchByCategory(
          category: category,
          page: nextPage,
        );
      } else {
        articles = await fetchHeadlines(page: nextPage);
      }

      emit(NewsState.loaded(
        articles: [...currentArticles, ...articles],
        page: nextPage,
        hasReachedMax: articles.isEmpty,
        searchQuery: searchQuery,
        category: category,
        isLoadingMore: false,
      ));
    } catch (error) {
      // If we have data, show error but keep data?
      // Or emit failure? For now, if we have data, maybe just stop loading and show snackbar?
      // But the state needs to reflect error.
      // If we were loading more, we revert to loaded with error?
      // The simple failure state replaces everything.
      // Let's stick to simple failure for now, or maybe keep loaded but add error field?
      // The user requested "Freezed Union", implying distinct states.
      // If we fail pagination, we usually want to keep showing the list.
      // But for this refactor, let's emit failure if it's the first load,
      // or if it's pagination, we might need a more complex state.
      // Given the constraints, I'll emit failure.

      emit(NewsState.failure(
        message: error.toString().replaceAll('Exception: ', ''),
      ));
    }
  }

  /// Refreshes the article list (pull-to-refresh)
  Future<void> refresh() async {
    // Keep current filters
    String? searchQuery;
    String? category;

    state.mapOrNull(
      loaded: (loaded) {
        searchQuery = loaded.searchQuery;
        category = loaded.category;
      },
    );

    emit(const NewsState.loading());

    try {
      List<NewsArticle> articles;

      if (searchQuery != null && searchQuery!.isNotEmpty) {
        articles = await _repository.searchArticles(
          query: searchQuery!,
          page: 1,
        );
      } else if (category != null && category!.isNotEmpty) {
        articles = await _repository.fetchByCategory(
          category: category!,
          page: 1,
        );
      } else {
        articles = await refreshHeadlines();
      }

      emit(NewsState.loaded(
        articles: articles,
        page: 1,
        hasReachedMax: articles.isEmpty,
        searchQuery: searchQuery,
        category: category,
      ));
    } catch (error) {
      emit(NewsState.failure(
        message: error.toString().replaceAll('Exception: ', ''),
      ));
    }
  }

  /// Searches articles by keyword
  Future<void> search(String query) async {
    emit(const NewsState.loading());

    // We need to set the search query in the state context for loadNextPage to pick it up?
    // Actually loadNextPage takes params from state.
    // But here we are resetting.

    try {
      final articles = await _repository.searchArticles(
        query: query,
        page: 1,
      );

      emit(NewsState.loaded(
        articles: articles,
        page: 1,
        hasReachedMax: articles.isEmpty,
        searchQuery: query,
        category: null,
      ));
    } catch (error) {
      emit(NewsState.failure(
        message: error.toString().replaceAll('Exception: ', ''),
      ));
    }
  }

  /// Filters articles by category
  Future<void> filterByCategory(String category) async {
    emit(const NewsState.loading());

    try {
      final articles = await _repository.fetchByCategory(
        category: category,
        page: 1,
      );

      emit(NewsState.loaded(
        articles: articles,
        page: 1,
        hasReachedMax: articles.isEmpty,
        searchQuery: null,
        category: category,
      ));
    } catch (error) {
      emit(NewsState.failure(
        message: error.toString().replaceAll('Exception: ', ''),
      ));
    }
  }

  /// Clears all filters and returns to headlines
  Future<void> clearFilters() async {
    emit(const NewsState.loading());

    try {
      final articles = await fetchHeadlines(page: 1);

      emit(NewsState.loaded(
        articles: articles,
        page: 1,
        hasReachedMax: articles.isEmpty,
        searchQuery: null,
        category: null,
      ));
    } catch (error) {
      emit(NewsState.failure(
        message: error.toString().replaceAll('Exception: ', ''),
      ));
    }
  }
}

/// State for news
/// State for news using Freezed union types
@freezed
class NewsState with _$NewsState {
  const factory NewsState.initial() = _Initial;
  const factory NewsState.loading() = _Loading;
  const factory NewsState.loaded({
    required List<NewsArticle> articles,
    @Default(1) int page,
    @Default(false) bool hasReachedMax,
    String? searchQuery,
    String? category,
    @Default(false) bool isLoadingMore,
  }) = _Loaded;
  const factory NewsState.failure({required String message}) = _Failure;
}
