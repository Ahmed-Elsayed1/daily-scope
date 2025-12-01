// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WeatherState {
  WeatherStatus get status => throw _privateConstructorUsedError;
  Weather? get currentWeather => throw _privateConstructorUsedError;
  List<Weather> get forecast => throw _privateConstructorUsedError;
  List<City> get savedCities => throw _privateConstructorUsedError;
  List<City> get searchResults => throw _privateConstructorUsedError;
  City? get currentCity => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherStateCopyWith<WeatherState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherStateCopyWith<$Res> {
  factory $WeatherStateCopyWith(
          WeatherState value, $Res Function(WeatherState) then) =
      _$WeatherStateCopyWithImpl<$Res, WeatherState>;
  @useResult
  $Res call(
      {WeatherStatus status,
      Weather? currentWeather,
      List<Weather> forecast,
      List<City> savedCities,
      List<City> searchResults,
      City? currentCity,
      String? errorMessage});

  $WeatherCopyWith<$Res>? get currentWeather;
  $CityCopyWith<$Res>? get currentCity;
}

/// @nodoc
class _$WeatherStateCopyWithImpl<$Res, $Val extends WeatherState>
    implements $WeatherStateCopyWith<$Res> {
  _$WeatherStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? currentWeather = freezed,
    Object? forecast = null,
    Object? savedCities = null,
    Object? searchResults = null,
    Object? currentCity = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as WeatherStatus,
      currentWeather: freezed == currentWeather
          ? _value.currentWeather
          : currentWeather // ignore: cast_nullable_to_non_nullable
              as Weather?,
      forecast: null == forecast
          ? _value.forecast
          : forecast // ignore: cast_nullable_to_non_nullable
              as List<Weather>,
      savedCities: null == savedCities
          ? _value.savedCities
          : savedCities // ignore: cast_nullable_to_non_nullable
              as List<City>,
      searchResults: null == searchResults
          ? _value.searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<City>,
      currentCity: freezed == currentCity
          ? _value.currentCity
          : currentCity // ignore: cast_nullable_to_non_nullable
              as City?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherCopyWith<$Res>? get currentWeather {
    if (_value.currentWeather == null) {
      return null;
    }

    return $WeatherCopyWith<$Res>(_value.currentWeather!, (value) {
      return _then(_value.copyWith(currentWeather: value) as $Val);
    });
  }

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CityCopyWith<$Res>? get currentCity {
    if (_value.currentCity == null) {
      return null;
    }

    return $CityCopyWith<$Res>(_value.currentCity!, (value) {
      return _then(_value.copyWith(currentCity: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherStateImplCopyWith<$Res>
    implements $WeatherStateCopyWith<$Res> {
  factory _$$WeatherStateImplCopyWith(
          _$WeatherStateImpl value, $Res Function(_$WeatherStateImpl) then) =
      __$$WeatherStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {WeatherStatus status,
      Weather? currentWeather,
      List<Weather> forecast,
      List<City> savedCities,
      List<City> searchResults,
      City? currentCity,
      String? errorMessage});

  @override
  $WeatherCopyWith<$Res>? get currentWeather;
  @override
  $CityCopyWith<$Res>? get currentCity;
}

/// @nodoc
class __$$WeatherStateImplCopyWithImpl<$Res>
    extends _$WeatherStateCopyWithImpl<$Res, _$WeatherStateImpl>
    implements _$$WeatherStateImplCopyWith<$Res> {
  __$$WeatherStateImplCopyWithImpl(
      _$WeatherStateImpl _value, $Res Function(_$WeatherStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? currentWeather = freezed,
    Object? forecast = null,
    Object? savedCities = null,
    Object? searchResults = null,
    Object? currentCity = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$WeatherStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as WeatherStatus,
      currentWeather: freezed == currentWeather
          ? _value.currentWeather
          : currentWeather // ignore: cast_nullable_to_non_nullable
              as Weather?,
      forecast: null == forecast
          ? _value._forecast
          : forecast // ignore: cast_nullable_to_non_nullable
              as List<Weather>,
      savedCities: null == savedCities
          ? _value._savedCities
          : savedCities // ignore: cast_nullable_to_non_nullable
              as List<City>,
      searchResults: null == searchResults
          ? _value._searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<City>,
      currentCity: freezed == currentCity
          ? _value.currentCity
          : currentCity // ignore: cast_nullable_to_non_nullable
              as City?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$WeatherStateImpl implements _WeatherState {
  const _$WeatherStateImpl(
      {this.status = WeatherStatus.initial,
      this.currentWeather,
      final List<Weather> forecast = const [],
      final List<City> savedCities = const [],
      final List<City> searchResults = const [],
      this.currentCity,
      this.errorMessage})
      : _forecast = forecast,
        _savedCities = savedCities,
        _searchResults = searchResults;

  @override
  @JsonKey()
  final WeatherStatus status;
  @override
  final Weather? currentWeather;
  final List<Weather> _forecast;
  @override
  @JsonKey()
  List<Weather> get forecast {
    if (_forecast is EqualUnmodifiableListView) return _forecast;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_forecast);
  }

  final List<City> _savedCities;
  @override
  @JsonKey()
  List<City> get savedCities {
    if (_savedCities is EqualUnmodifiableListView) return _savedCities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_savedCities);
  }

  final List<City> _searchResults;
  @override
  @JsonKey()
  List<City> get searchResults {
    if (_searchResults is EqualUnmodifiableListView) return _searchResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchResults);
  }

  @override
  final City? currentCity;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'WeatherState(status: $status, currentWeather: $currentWeather, forecast: $forecast, savedCities: $savedCities, searchResults: $searchResults, currentCity: $currentCity, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.currentWeather, currentWeather) ||
                other.currentWeather == currentWeather) &&
            const DeepCollectionEquality().equals(other._forecast, _forecast) &&
            const DeepCollectionEquality()
                .equals(other._savedCities, _savedCities) &&
            const DeepCollectionEquality()
                .equals(other._searchResults, _searchResults) &&
            (identical(other.currentCity, currentCity) ||
                other.currentCity == currentCity) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      currentWeather,
      const DeepCollectionEquality().hash(_forecast),
      const DeepCollectionEquality().hash(_savedCities),
      const DeepCollectionEquality().hash(_searchResults),
      currentCity,
      errorMessage);

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherStateImplCopyWith<_$WeatherStateImpl> get copyWith =>
      __$$WeatherStateImplCopyWithImpl<_$WeatherStateImpl>(this, _$identity);
}

abstract class _WeatherState implements WeatherState {
  const factory _WeatherState(
      {final WeatherStatus status,
      final Weather? currentWeather,
      final List<Weather> forecast,
      final List<City> savedCities,
      final List<City> searchResults,
      final City? currentCity,
      final String? errorMessage}) = _$WeatherStateImpl;

  @override
  WeatherStatus get status;
  @override
  Weather? get currentWeather;
  @override
  List<Weather> get forecast;
  @override
  List<City> get savedCities;
  @override
  List<City> get searchResults;
  @override
  City? get currentCity;
  @override
  String? get errorMessage;

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherStateImplCopyWith<_$WeatherStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
