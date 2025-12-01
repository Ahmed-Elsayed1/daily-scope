part of 'weather_cubit.dart';

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()` which is reserved for Freezed.');

mixin _$WeatherState {
  WeatherStatus get status => throw _privateConstructorUsedError;
  WeatherSnapshot? get snapshot => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  DateTime? get lastUpdated => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeatherStateCopyWith<WeatherState> get copyWith =>
      throw _privateConstructorUsedError;
}

abstract class $WeatherStateCopyWith<$Res> {
  factory $WeatherStateCopyWith(
          WeatherState value, $Res Function(WeatherState) then) =
      _$WeatherStateCopyWithImpl<$Res, WeatherState>;
  $Res call({
    WeatherStatus status,
    WeatherSnapshot? snapshot,
    String? errorMessage,
    DateTime? lastUpdated,
  });

  $WeatherSnapshotCopyWith<$Res>? get snapshot;
}

class _$WeatherStateCopyWithImpl<$Res, $Val extends WeatherState>
    implements $WeatherStateCopyWith<$Res> {
  _$WeatherStateCopyWithImpl(this._value, this._then);

  final $Val _value;
  final $Res Function($Val) _then;

  @override
  $Res call({
    Object? status = null,
    Object? snapshot = freezed,
    Object? errorMessage = freezed,
    Object? lastUpdated = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == null ? _value.status : status as WeatherStatus,
      snapshot:
          snapshot == freezed ? _value.snapshot : snapshot as WeatherSnapshot?,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage as String?,
      lastUpdated: lastUpdated == freezed
          ? _value.lastUpdated
          : lastUpdated as DateTime?,
    ) as $Val);
  }

  @override
  $WeatherSnapshotCopyWith<$Res>? get snapshot {
    if (_value.snapshot == null) {
      return null;
    }

    return $WeatherSnapshotCopyWith<$Res>(_value.snapshot!, (value) {
      return _then(_value.copyWith(snapshot: value) as $Val);
    });
  }
}

abstract class _$$WeatherStateImplCopyWith<$Res>
    implements $WeatherStateCopyWith<$Res> {
  factory _$$WeatherStateImplCopyWith(
          _$WeatherStateImpl value, $Res Function(_$WeatherStateImpl) then) =
      __$$WeatherStateImplCopyWithImpl<$Res>;
  @override
  $Res call({
    WeatherStatus status,
    WeatherSnapshot? snapshot,
    String? errorMessage,
    DateTime? lastUpdated,
  });

  @override
  $WeatherSnapshotCopyWith<$Res>? get snapshot;
}

class __$$WeatherStateImplCopyWithImpl<$Res>
    extends _$WeatherStateCopyWithImpl<$Res, _$WeatherStateImpl>
    implements _$$WeatherStateImplCopyWith<$Res> {
  __$$WeatherStateImplCopyWithImpl(
      _$WeatherStateImpl _value, $Res Function(_$WeatherStateImpl) _then)
      : super(_value, _then);

  @override
  $Res call({
    Object? status = null,
    Object? snapshot = freezed,
    Object? errorMessage = freezed,
    Object? lastUpdated = freezed,
  }) {
    return _then(_$WeatherStateImpl(
      status: status == null ? _value.status : status as WeatherStatus,
      snapshot:
          snapshot == freezed ? _value.snapshot : snapshot as WeatherSnapshot?,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage as String?,
      lastUpdated: lastUpdated == freezed
          ? _value.lastUpdated
          : lastUpdated as DateTime?,
    ));
  }
}

class _$WeatherStateImpl implements _WeatherState {
  const _$WeatherStateImpl({
    this.status = WeatherStatus.initial,
    this.snapshot,
    this.errorMessage,
    this.lastUpdated,
  });

  @override
  @JsonKey()
  final WeatherStatus status;
  @override
  final WeatherSnapshot? snapshot;
  @override
  final String? errorMessage;
  @override
  final DateTime? lastUpdated;

  @override
  String toString() {
    return 'WeatherState(status: $status, snapshot: $snapshot, errorMessage: $errorMessage, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherStateImpl &&
            other.status == status &&
            other.snapshot == snapshot &&
            other.errorMessage == errorMessage &&
            other.lastUpdated == lastUpdated);
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, snapshot, errorMessage, lastUpdated);

  @JsonKey(ignore: true)
  @override
  _$$WeatherStateImplCopyWith<_$WeatherStateImpl> get copyWith =>
      __$$WeatherStateImplCopyWithImpl<_$WeatherStateImpl>(this, _$identity);
}

abstract class _WeatherState implements WeatherState {
  const factory _WeatherState({
    WeatherStatus status,
    WeatherSnapshot? snapshot,
    String? errorMessage,
    DateTime? lastUpdated,
  }) = _$WeatherStateImpl;

  @override
  WeatherStatus get status;
  @override
  WeatherSnapshot? get snapshot;
  @override
  String? get errorMessage;
  @override
  DateTime? get lastUpdated;
  @override
  @JsonKey(ignore: true)
  _$$WeatherStateImplCopyWith<_$WeatherStateImpl> get copyWith;
}
