// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_snapshot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WeatherSnapshot {
  double get currentTemp => throw _privateConstructorUsedError;
  double get highTemp => throw _privateConstructorUsedError;
  double get lowTemp => throw _privateConstructorUsedError;
  String get condition => throw _privateConstructorUsedError;
  List<double> get hourlyTemps => throw _privateConstructorUsedError;
  List<double> get dailyHighs => throw _privateConstructorUsedError;
  List<double> get dailyLows => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of WeatherSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherSnapshotCopyWith<WeatherSnapshot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherSnapshotCopyWith<$Res> {
  factory $WeatherSnapshotCopyWith(
          WeatherSnapshot value, $Res Function(WeatherSnapshot) then) =
      _$WeatherSnapshotCopyWithImpl<$Res, WeatherSnapshot>;
  @useResult
  $Res call(
      {double currentTemp,
      double highTemp,
      double lowTemp,
      String condition,
      List<double> hourlyTemps,
      List<double> dailyHighs,
      List<double> dailyLows,
      DateTime updatedAt});
}

/// @nodoc
class _$WeatherSnapshotCopyWithImpl<$Res, $Val extends WeatherSnapshot>
    implements $WeatherSnapshotCopyWith<$Res> {
  _$WeatherSnapshotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTemp = null,
    Object? highTemp = null,
    Object? lowTemp = null,
    Object? condition = null,
    Object? hourlyTemps = null,
    Object? dailyHighs = null,
    Object? dailyLows = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      currentTemp: null == currentTemp
          ? _value.currentTemp
          : currentTemp // ignore: cast_nullable_to_non_nullable
              as double,
      highTemp: null == highTemp
          ? _value.highTemp
          : highTemp // ignore: cast_nullable_to_non_nullable
              as double,
      lowTemp: null == lowTemp
          ? _value.lowTemp
          : lowTemp // ignore: cast_nullable_to_non_nullable
              as double,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
      hourlyTemps: null == hourlyTemps
          ? _value.hourlyTemps
          : hourlyTemps // ignore: cast_nullable_to_non_nullable
              as List<double>,
      dailyHighs: null == dailyHighs
          ? _value.dailyHighs
          : dailyHighs // ignore: cast_nullable_to_non_nullable
              as List<double>,
      dailyLows: null == dailyLows
          ? _value.dailyLows
          : dailyLows // ignore: cast_nullable_to_non_nullable
              as List<double>,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherSnapshotImplCopyWith<$Res>
    implements $WeatherSnapshotCopyWith<$Res> {
  factory _$$WeatherSnapshotImplCopyWith(_$WeatherSnapshotImpl value,
          $Res Function(_$WeatherSnapshotImpl) then) =
      __$$WeatherSnapshotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double currentTemp,
      double highTemp,
      double lowTemp,
      String condition,
      List<double> hourlyTemps,
      List<double> dailyHighs,
      List<double> dailyLows,
      DateTime updatedAt});
}

/// @nodoc
class __$$WeatherSnapshotImplCopyWithImpl<$Res>
    extends _$WeatherSnapshotCopyWithImpl<$Res, _$WeatherSnapshotImpl>
    implements _$$WeatherSnapshotImplCopyWith<$Res> {
  __$$WeatherSnapshotImplCopyWithImpl(
      _$WeatherSnapshotImpl _value, $Res Function(_$WeatherSnapshotImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeatherSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTemp = null,
    Object? highTemp = null,
    Object? lowTemp = null,
    Object? condition = null,
    Object? hourlyTemps = null,
    Object? dailyHighs = null,
    Object? dailyLows = null,
    Object? updatedAt = null,
  }) {
    return _then(_$WeatherSnapshotImpl(
      currentTemp: null == currentTemp
          ? _value.currentTemp
          : currentTemp // ignore: cast_nullable_to_non_nullable
              as double,
      highTemp: null == highTemp
          ? _value.highTemp
          : highTemp // ignore: cast_nullable_to_non_nullable
              as double,
      lowTemp: null == lowTemp
          ? _value.lowTemp
          : lowTemp // ignore: cast_nullable_to_non_nullable
              as double,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
      hourlyTemps: null == hourlyTemps
          ? _value._hourlyTemps
          : hourlyTemps // ignore: cast_nullable_to_non_nullable
              as List<double>,
      dailyHighs: null == dailyHighs
          ? _value._dailyHighs
          : dailyHighs // ignore: cast_nullable_to_non_nullable
              as List<double>,
      dailyLows: null == dailyLows
          ? _value._dailyLows
          : dailyLows // ignore: cast_nullable_to_non_nullable
              as List<double>,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$WeatherSnapshotImpl implements _WeatherSnapshot {
  const _$WeatherSnapshotImpl(
      {required this.currentTemp,
      required this.highTemp,
      required this.lowTemp,
      required this.condition,
      required final List<double> hourlyTemps,
      required final List<double> dailyHighs,
      required final List<double> dailyLows,
      required this.updatedAt})
      : _hourlyTemps = hourlyTemps,
        _dailyHighs = dailyHighs,
        _dailyLows = dailyLows;

  @override
  final double currentTemp;
  @override
  final double highTemp;
  @override
  final double lowTemp;
  @override
  final String condition;
  final List<double> _hourlyTemps;
  @override
  List<double> get hourlyTemps {
    if (_hourlyTemps is EqualUnmodifiableListView) return _hourlyTemps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hourlyTemps);
  }

  final List<double> _dailyHighs;
  @override
  List<double> get dailyHighs {
    if (_dailyHighs is EqualUnmodifiableListView) return _dailyHighs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyHighs);
  }

  final List<double> _dailyLows;
  @override
  List<double> get dailyLows {
    if (_dailyLows is EqualUnmodifiableListView) return _dailyLows;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyLows);
  }

  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'WeatherSnapshot(currentTemp: $currentTemp, highTemp: $highTemp, lowTemp: $lowTemp, condition: $condition, hourlyTemps: $hourlyTemps, dailyHighs: $dailyHighs, dailyLows: $dailyLows, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherSnapshotImpl &&
            (identical(other.currentTemp, currentTemp) ||
                other.currentTemp == currentTemp) &&
            (identical(other.highTemp, highTemp) ||
                other.highTemp == highTemp) &&
            (identical(other.lowTemp, lowTemp) || other.lowTemp == lowTemp) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            const DeepCollectionEquality()
                .equals(other._hourlyTemps, _hourlyTemps) &&
            const DeepCollectionEquality()
                .equals(other._dailyHighs, _dailyHighs) &&
            const DeepCollectionEquality()
                .equals(other._dailyLows, _dailyLows) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentTemp,
      highTemp,
      lowTemp,
      condition,
      const DeepCollectionEquality().hash(_hourlyTemps),
      const DeepCollectionEquality().hash(_dailyHighs),
      const DeepCollectionEquality().hash(_dailyLows),
      updatedAt);

  /// Create a copy of WeatherSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherSnapshotImplCopyWith<_$WeatherSnapshotImpl> get copyWith =>
      __$$WeatherSnapshotImplCopyWithImpl<_$WeatherSnapshotImpl>(
          this, _$identity);
}

abstract class _WeatherSnapshot implements WeatherSnapshot {
  const factory _WeatherSnapshot(
      {required final double currentTemp,
      required final double highTemp,
      required final double lowTemp,
      required final String condition,
      required final List<double> hourlyTemps,
      required final List<double> dailyHighs,
      required final List<double> dailyLows,
      required final DateTime updatedAt}) = _$WeatherSnapshotImpl;

  @override
  double get currentTemp;
  @override
  double get highTemp;
  @override
  double get lowTemp;
  @override
  String get condition;
  @override
  List<double> get hourlyTemps;
  @override
  List<double> get dailyHighs;
  @override
  List<double> get dailyLows;
  @override
  DateTime get updatedAt;

  /// Create a copy of WeatherSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherSnapshotImplCopyWith<_$WeatherSnapshotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
