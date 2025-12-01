// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Weather {
  double get temperature => throw _privateConstructorUsedError;
  double get feelsLike => throw _privateConstructorUsedError;
  double get tempMin => throw _privateConstructorUsedError;
  double get tempMax => throw _privateConstructorUsedError;
  int get humidity => throw _privateConstructorUsedError;
  double get windSpeed => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get iconCode => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String? get cityName => throw _privateConstructorUsedError;

  /// Create a copy of Weather
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherCopyWith<Weather> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherCopyWith<$Res> {
  factory $WeatherCopyWith(Weather value, $Res Function(Weather) then) =
      _$WeatherCopyWithImpl<$Res, Weather>;
  @useResult
  $Res call(
      {double temperature,
      double feelsLike,
      double tempMin,
      double tempMax,
      int humidity,
      double windSpeed,
      String description,
      String iconCode,
      DateTime timestamp,
      String? cityName});
}

/// @nodoc
class _$WeatherCopyWithImpl<$Res, $Val extends Weather>
    implements $WeatherCopyWith<$Res> {
  _$WeatherCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Weather
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperature = null,
    Object? feelsLike = null,
    Object? tempMin = null,
    Object? tempMax = null,
    Object? humidity = null,
    Object? windSpeed = null,
    Object? description = null,
    Object? iconCode = null,
    Object? timestamp = null,
    Object? cityName = freezed,
  }) {
    return _then(_value.copyWith(
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      feelsLike: null == feelsLike
          ? _value.feelsLike
          : feelsLike // ignore: cast_nullable_to_non_nullable
              as double,
      tempMin: null == tempMin
          ? _value.tempMin
          : tempMin // ignore: cast_nullable_to_non_nullable
              as double,
      tempMax: null == tempMax
          ? _value.tempMax
          : tempMax // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int,
      windSpeed: null == windSpeed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      iconCode: null == iconCode
          ? _value.iconCode
          : iconCode // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cityName: freezed == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherImplCopyWith<$Res> implements $WeatherCopyWith<$Res> {
  factory _$$WeatherImplCopyWith(
          _$WeatherImpl value, $Res Function(_$WeatherImpl) then) =
      __$$WeatherImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double temperature,
      double feelsLike,
      double tempMin,
      double tempMax,
      int humidity,
      double windSpeed,
      String description,
      String iconCode,
      DateTime timestamp,
      String? cityName});
}

/// @nodoc
class __$$WeatherImplCopyWithImpl<$Res>
    extends _$WeatherCopyWithImpl<$Res, _$WeatherImpl>
    implements _$$WeatherImplCopyWith<$Res> {
  __$$WeatherImplCopyWithImpl(
      _$WeatherImpl _value, $Res Function(_$WeatherImpl) _then)
      : super(_value, _then);

  /// Create a copy of Weather
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperature = null,
    Object? feelsLike = null,
    Object? tempMin = null,
    Object? tempMax = null,
    Object? humidity = null,
    Object? windSpeed = null,
    Object? description = null,
    Object? iconCode = null,
    Object? timestamp = null,
    Object? cityName = freezed,
  }) {
    return _then(_$WeatherImpl(
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      feelsLike: null == feelsLike
          ? _value.feelsLike
          : feelsLike // ignore: cast_nullable_to_non_nullable
              as double,
      tempMin: null == tempMin
          ? _value.tempMin
          : tempMin // ignore: cast_nullable_to_non_nullable
              as double,
      tempMax: null == tempMax
          ? _value.tempMax
          : tempMax // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int,
      windSpeed: null == windSpeed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      iconCode: null == iconCode
          ? _value.iconCode
          : iconCode // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cityName: freezed == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$WeatherImpl implements _Weather {
  const _$WeatherImpl(
      {required this.temperature,
      required this.feelsLike,
      required this.tempMin,
      required this.tempMax,
      required this.humidity,
      required this.windSpeed,
      required this.description,
      required this.iconCode,
      required this.timestamp,
      this.cityName});

  @override
  final double temperature;
  @override
  final double feelsLike;
  @override
  final double tempMin;
  @override
  final double tempMax;
  @override
  final int humidity;
  @override
  final double windSpeed;
  @override
  final String description;
  @override
  final String iconCode;
  @override
  final DateTime timestamp;
  @override
  final String? cityName;

  @override
  String toString() {
    return 'Weather(temperature: $temperature, feelsLike: $feelsLike, tempMin: $tempMin, tempMax: $tempMax, humidity: $humidity, windSpeed: $windSpeed, description: $description, iconCode: $iconCode, timestamp: $timestamp, cityName: $cityName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherImpl &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.feelsLike, feelsLike) ||
                other.feelsLike == feelsLike) &&
            (identical(other.tempMin, tempMin) || other.tempMin == tempMin) &&
            (identical(other.tempMax, tempMax) || other.tempMax == tempMax) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.windSpeed, windSpeed) ||
                other.windSpeed == windSpeed) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.iconCode, iconCode) ||
                other.iconCode == iconCode) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.cityName, cityName) ||
                other.cityName == cityName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, temperature, feelsLike, tempMin,
      tempMax, humidity, windSpeed, description, iconCode, timestamp, cityName);

  /// Create a copy of Weather
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherImplCopyWith<_$WeatherImpl> get copyWith =>
      __$$WeatherImplCopyWithImpl<_$WeatherImpl>(this, _$identity);
}

abstract class _Weather implements Weather {
  const factory _Weather(
      {required final double temperature,
      required final double feelsLike,
      required final double tempMin,
      required final double tempMax,
      required final int humidity,
      required final double windSpeed,
      required final String description,
      required final String iconCode,
      required final DateTime timestamp,
      final String? cityName}) = _$WeatherImpl;

  @override
  double get temperature;
  @override
  double get feelsLike;
  @override
  double get tempMin;
  @override
  double get tempMax;
  @override
  int get humidity;
  @override
  double get windSpeed;
  @override
  String get description;
  @override
  String get iconCode;
  @override
  DateTime get timestamp;
  @override
  String? get cityName;

  /// Create a copy of Weather
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherImplCopyWith<_$WeatherImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
