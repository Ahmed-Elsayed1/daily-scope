part of 'news_cubit.dart';

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()` which is only for Freezed.');

mixin _$NewsState {
  NewsStatus get status => throw _privateConstructorUsedError;
  List<NewsArticle> get articles => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  bool get hasReachedMax => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  DateTime? get lastUpdated => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewsStateCopyWith<NewsState> get copyWith =>
      throw _privateConstructorUsedError;
}

abstract class $NewsStateCopyWith<$Res> {
  factory $NewsStateCopyWith(NewsState value, $Res Function(NewsState) then) =
      _$NewsStateCopyWithImpl<$Res, NewsState>;
  $Res call({
    NewsStatus status,
    List<NewsArticle> articles,
    int page,
    bool hasReachedMax,
    String? errorMessage,
    DateTime? lastUpdated,
  });
}

class _$NewsStateCopyWithImpl<$Res, $Val extends NewsState>
    implements $NewsStateCopyWith<$Res> {
  _$NewsStateCopyWithImpl(this._value, this._then);

  final $Val _value;
  final $Res Function($Val) _then;

  @override
  $Res call({
    Object? status = null,
    Object? articles = null,
    Object? page = null,
    Object? hasReachedMax = null,
    Object? errorMessage = freezed,
    Object? lastUpdated = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == null ? _value.status : status as NewsStatus,
      articles:
          articles == null ? _value.articles : articles as List<NewsArticle>,
      page: page == null ? _value.page : page as int,
      hasReachedMax:
          hasReachedMax == null ? _value.hasReachedMax : hasReachedMax as bool,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage as String?,
      lastUpdated: lastUpdated == freezed
          ? _value.lastUpdated
          : lastUpdated as DateTime?,
    ) as $Val);
  }
}

abstract class _$$NewsStateImplCopyWith<$Res>
    implements $NewsStateCopyWith<$Res> {
  factory _$$NewsStateImplCopyWith(
          _$NewsStateImpl value, $Res Function(_$NewsStateImpl) then) =
      __$$NewsStateImplCopyWithImpl<$Res>;
  @override
  $Res call({
    NewsStatus status,
    List<NewsArticle> articles,
    int page,
    bool hasReachedMax,
    String? errorMessage,
    DateTime? lastUpdated,
  });
}

class __$$NewsStateImplCopyWithImpl<$Res>
    extends _$NewsStateCopyWithImpl<$Res, _$NewsStateImpl>
    implements _$$NewsStateImplCopyWith<$Res> {
  __$$NewsStateImplCopyWithImpl(
      _$NewsStateImpl _value, $Res Function(_$NewsStateImpl) _then)
      : super(_value, _then);

  @override
  $Res call({
    Object? status = null,
    Object? articles = null,
    Object? page = null,
    Object? hasReachedMax = null,
    Object? errorMessage = freezed,
    Object? lastUpdated = freezed,
  }) {
    return _then(_$NewsStateImpl(
      status: status == null ? _value.status : status as NewsStatus,
      articles:
          articles == null ? _value._articles : articles as List<NewsArticle>,
      page: page == null ? _value.page : page as int,
      hasReachedMax:
          hasReachedMax == null ? _value.hasReachedMax : hasReachedMax as bool,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage as String?,
      lastUpdated: lastUpdated == freezed
          ? _value.lastUpdated
          : lastUpdated as DateTime?,
    ));
  }
}

class _$NewsStateImpl implements _NewsState {
  const _$NewsStateImpl({
    this.status = NewsStatus.initial,
    final List<NewsArticle> articles = const <NewsArticle>[],
    this.page = 1,
    this.hasReachedMax = false,
    this.errorMessage,
    this.lastUpdated,
  }) : _articles = articles;

  @override
  @JsonKey()
  final NewsStatus status;
  final List<NewsArticle> _articles;
  @override
  List<NewsArticle> get articles => List.unmodifiable(_articles);
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final bool hasReachedMax;
  @override
  final String? errorMessage;
  @override
  final DateTime? lastUpdated;

  @override
  String toString() {
    return 'NewsState(status: $status, articles: $articles, page: $page, hasReachedMax: $hasReachedMax, errorMessage: $errorMessage, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsStateImpl &&
            other.status == status &&
            const DeepCollectionEquality().equals(other._articles, _articles) &&
            other.page == page &&
            other.hasReachedMax == hasReachedMax &&
            other.errorMessage == errorMessage &&
            other.lastUpdated == lastUpdated);
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_articles),
      page,
      hasReachedMax,
      errorMessage,
      lastUpdated);

  @JsonKey(ignore: true)
  @override
  _$$NewsStateImplCopyWith<_$NewsStateImpl> get copyWith =>
      __$$NewsStateImplCopyWithImpl<_$NewsStateImpl>(this, _$identity);
}

abstract class _NewsState implements NewsState {
  const factory _NewsState({
    NewsStatus status,
    List<NewsArticle> articles,
    int page,
    bool hasReachedMax,
    String? errorMessage,
    DateTime? lastUpdated,
  }) = _$NewsStateImpl;

  @override
  NewsStatus get status;
  @override
  List<NewsArticle> get articles;
  @override
  int get page;
  @override
  bool get hasReachedMax;
  @override
  String? get errorMessage;
  @override
  DateTime? get lastUpdated;
  @override
  @JsonKey(ignore: true)
  _$$NewsStateImplCopyWith<_$NewsStateImpl> get copyWith;
}
