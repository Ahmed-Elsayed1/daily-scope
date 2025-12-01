part of 'news_article.dart';

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()` which is reserved for Freezed.');

mixin _$NewsArticle {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;
  DateTime get publishedAt => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewsArticleCopyWith<NewsArticle> get copyWith =>
      throw _privateConstructorUsedError;
}

abstract class $NewsArticleCopyWith<$Res> {
  factory $NewsArticleCopyWith(
          NewsArticle value, $Res Function(NewsArticle) then) =
      _$NewsArticleCopyWithImpl<$Res, NewsArticle>;
  $Res call({
    String id,
    String title,
    String source,
    DateTime publishedAt,
    String? imageUrl,
    String? description,
  });
}

class _$NewsArticleCopyWithImpl<$Res, $Val extends NewsArticle>
    implements $NewsArticleCopyWith<$Res> {
  _$NewsArticleCopyWithImpl(this._value, this._then);

  final $Val _value;
  final $Res Function($Val) _then;

  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? source = null,
    Object? publishedAt = null,
    Object? imageUrl = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == null ? _value.id : id as String,
      title: title == null ? _value.title : title as String,
      source: source == null ? _value.source : source as String,
      publishedAt:
          publishedAt == null ? _value.publishedAt : publishedAt as DateTime,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String?,
      description:
          description == freezed ? _value.description : description as String?,
    ) as $Val);
  }
}

abstract class _$$NewsArticleImplCopyWith<$Res>
    implements $NewsArticleCopyWith<$Res> {
  factory _$$NewsArticleImplCopyWith(
          _$NewsArticleImpl value, $Res Function(_$NewsArticleImpl) then) =
      __$$NewsArticleImplCopyWithImpl<$Res>;
  @override
  $Res call({
    String id,
    String title,
    String source,
    DateTime publishedAt,
    String? imageUrl,
    String? description,
  });
}

class __$$NewsArticleImplCopyWithImpl<$Res>
    extends _$NewsArticleCopyWithImpl<$Res, _$NewsArticleImpl>
    implements _$$NewsArticleImplCopyWith<$Res> {
  __$$NewsArticleImplCopyWithImpl(
      _$NewsArticleImpl _value, $Res Function(_$NewsArticleImpl) _then)
      : super(_value, _then);

  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? source = null,
    Object? publishedAt = null,
    Object? imageUrl = freezed,
    Object? description = freezed,
  }) {
    return _then(_$NewsArticleImpl(
      id: id == null ? _value.id : id as String,
      title: title == null ? _value.title : title as String,
      source: source == null ? _value.source : source as String,
      publishedAt:
          publishedAt == null ? _value.publishedAt : publishedAt as DateTime,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String?,
      description:
          description == freezed ? _value.description : description as String?,
    ));
  }
}

class _$NewsArticleImpl implements _NewsArticle {
  const _$NewsArticleImpl({
    required this.id,
    required this.title,
    required this.source,
    required this.publishedAt,
    this.imageUrl,
    this.description,
  });

  @override
  final String id;
  @override
  final String title;
  @override
  final String source;
  @override
  final DateTime publishedAt;
  @override
  final String? imageUrl;
  @override
  final String? description;

  @override
  String toString() {
    return 'NewsArticle(id: $id, title: $title, source: $source, publishedAt: $publishedAt, imageUrl: $imageUrl, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsArticleImpl &&
            other.id == id &&
            other.title == title &&
            other.source == source &&
            other.publishedAt == publishedAt &&
            other.imageUrl == imageUrl &&
            other.description == description);
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, source, publishedAt, imageUrl, description);

  @JsonKey(ignore: true)
  @override
  _$$NewsArticleImplCopyWith<_$NewsArticleImpl> get copyWith =>
      __$$NewsArticleImplCopyWithImpl<_$NewsArticleImpl>(this, _$identity);
}

abstract class _NewsArticle implements NewsArticle {
  const factory _NewsArticle({
    required String id,
    required String title,
    required String source,
    required DateTime publishedAt,
    String? imageUrl,
    String? description,
  }) = _$NewsArticleImpl;

  @override
  String get id;
  @override
  String get title;
  @override
  String get source;
  @override
  DateTime get publishedAt;
  @override
  String? get imageUrl;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$NewsArticleImplCopyWith<_$NewsArticleImpl> get copyWith;
}
