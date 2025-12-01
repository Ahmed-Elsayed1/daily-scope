part of 'weather_snapshot.dart';

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()` which is reserved for Freezed.');

mixin _$WeatherSnapshot {
  double get currentTemp => throw _privateConstructorUsedError;
  double get highTemp => throw _privateConstructorUsedError;
  double get lowTemp => throw _privateConstructorUsedError;
  String get condition => throw _privateConstructorUsedError;
  List<double> get hourlyTemps => throw _privateConstructorUsedError;
  List<double> get dailyHighs => throw _privateConstructorUsedError;
  List<double> get dailyLows => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeatherSnapshotCopyWith<WeatherSnapshot> get copyWith =>
      throw _privateConstructorUsedError;
}

abstract class $WeatherSnapshotCopyWith<$Res> {
  factory $WeatherSnapshotCopyWith(
          WeatherSnapshot value, $Res Function(WeatherSnapshot) then) =
      _$WeatherSnapshotCopyWithImpl<$Res, WeatherSnapshot>;
  $Res call({
    double currentTemp,
    double highTemp,
    double lowTemp,
    String condition,
    List<double> hourlyTemps,
    List<double> dailyHighs,
    List<double> dailyLows,
    DateTime updatedAt,
  });
}

class _$WeatherSnapshotCopyWithImpl<$Res, $Val extends WeatherSnapshot>
    implements $WeatherSnapshotCopyWith<$Res> {
  _$WeatherSnapshotCopyWithImpl(this._value, this._then);

  final $Val _value;
  final $Res Function($Val) _then;

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
      currentTemp:
          currentTemp == null ? _value.currentTemp : currentTemp as double,
      highTemp: highTemp == null ? _value.highTemp : highTemp as double,
      lowTemp: lowTemp == null ? _value.lowTemp : lowTemp as double,
      condition: condition == null ? _value.condition : condition as String,
      hourlyTemps: hourlyTemps == null
          ? _value.hourlyTemps
          : hourlyTemps as List<double>,
      dailyHighs:
          dailyHighs == null ? _value.dailyHighs : dailyHighs as List<double>,
      dailyLows:
          dailyLows == null ? _value.dailyLows : dailyLows as List<double>,
      updatedAt: updatedAt == null ? _value.updatedAt : updatedAt as DateTime,
    ) as $Val);
  }
}

abstract class _$$WeatherSnapshotImplCopyWith<$Res>
    implements $WeatherSnapshotCopyWith<$Res> {
  factory _$$WeatherSnapshotImplCopyWith(_$WeatherSnapshotImpl value,
          $Res Function(_$WeatherSnapshotImpl) then) =
      __$$WeatherSnapshotImplCopyWithImpl<$Res>;
  @override
  $Res call({
    double currentTemp,
    double highTemp,
    double lowTemp,
    String condition,
    List<double> hourlyTemps,
    List<double> dailyHighs,
    List<double> dailyLows,
    DateTime updatedAt,
  });
}

class __$$WeatherSnapshotImplCopyWithImpl<$Res>
    extends _$WeatherSnapshotCopyWithImpl<$Res, _$WeatherSnapshotImpl>
    implements _$$WeatherSnapshotImplCopyWith<$Res> {
  __$$WeatherSnapshotImplCopyWithImpl(
      _$WeatherSnapshotImpl _value, $Res Function(_$WeatherSnapshotImpl) _then)
      : super(_value, _then);

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
      currentTemp:
          currentTemp == null ? _value.currentTemp : currentTemp as double,
      highTemp: highTemp == null ? _value.highTemp : highTemp as double,
      lowTemp: lowTemp == null ? _value.lowTemp : lowTemp as double,
      condition: condition == null ? _value.condition : condition as String,
      hourlyTemps: hourlyTemps == null
          ? _value._hourlyTemps
          : hourlyTemps as List<double>,
      dailyHighs:
          dailyHighs == null ? _value._dailyHighs : dailyHighs as List<double>,
      dailyLows:
          dailyLows == null ? _value._dailyLows : dailyLows as List<double>,
      updatedAt: updatedAt == null ? _value.updatedAt : updatedAt as DateTime,
    ));
  }
}

class _$WeatherSnapshotImpl implements _WeatherSnapshot {
  const _$WeatherSnapshotImpl({
    required this.currentTemp,
    required this.highTemp,
    required this.lowTemp,
    required this.condition,
    required final List<double> hourlyTemps,
    required final List<double> dailyHighs,
    required final List<double> dailyLows,
    required this.updatedAt,
  })  : _hourlyTemps = hourlyTemps,
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
  List<double> get hourlyTemps => List.unmodifiable(_hourlyTemps);
  final List<double> _dailyHighs;
  @override
  List<double> get dailyHighs => List.unmodifiable(_dailyHighs);
  final List<double> _dailyLows;
  @override
  List<double> get dailyLows => List.unmodifiable(_dailyLows);
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
            other.currentTemp == currentTemp &&
            other.highTemp == highTemp &&
            other.lowTemp == lowTemp &&
            other.condition == condition &&
            const DeepCollectionEquality()
                .equals(other._hourlyTemps, _hourlyTemps) &&
            const DeepCollectionEquality()
                .equals(other._dailyHighs, _dailyHighs) &&
            const DeepCollectionEquality()
                .equals(other._dailyLows, _dailyLows) &&
            other.updatedAt == updatedAt);
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
        updatedAt,
      );

  @JsonKey(ignore: true)
  @override
  _$$WeatherSnapshotImplCopyWith<_$WeatherSnapshotImpl> get copyWith =>
      __$$WeatherSnapshotImplCopyWithImpl<_$WeatherSnapshotImpl>(
          this, _$identity);
}

abstract class _WeatherSnapshot implements WeatherSnapshot {
  const factory _WeatherSnapshot({
    required double currentTemp,
    required double highTemp,
    required double lowTemp,
    required String condition,
    required List<double> hourlyTemps,
    required List<double> dailyHighs,
    required List<double> dailyLows,
    required DateTime updatedAt,
  }) = _$WeatherSnapshotImpl;

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
  @override
  @JsonKey(ignore: true)
  _$$WeatherSnapshotImplCopyWith<_$WeatherSnapshotImpl> get copyWith;
}
