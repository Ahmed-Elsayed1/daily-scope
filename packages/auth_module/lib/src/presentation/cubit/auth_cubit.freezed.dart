part of 'auth_cubit.dart';

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by Freezed.');

mixin _$AuthState {
  AuthStatus get status => throw _privateConstructorUsedError;
  AuthUser? get user => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  $Res call({AuthStatus status, AuthUser? user, String? errorMessage});

  $AuthUserCopyWith<$Res>? get user;
}

class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final $Val _value;
  final $Res Function($Val) _then;

  @override
  $Res call({
    Object? status = null,
    Object? user = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == null ? _value.status : status as AuthStatus,
      user: user == freezed ? _value.user : user as AuthUser?,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage as String?,
    ) as $Val);
  }

  @override
  $AuthUserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $AuthUserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

abstract class _$$AuthStateImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  $Res call({AuthStatus status, AuthUser? user, String? errorMessage});

  @override
  $AuthUserCopyWith<$Res>? get user;
}

class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);

  @override
  $Res call({
    Object? status = null,
    Object? user = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$AuthStateImpl(
      status: status == null ? _value.status : status as AuthStatus,
      user: user == freezed ? _value.user : user as AuthUser?,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage as String?,
    ));
  }
}

class _$AuthStateImpl implements _AuthState {
  const _$AuthStateImpl({
    this.status = AuthStatus.unknown,
    this.user,
    this.errorMessage,
  });

  @override
  @JsonKey()
  final AuthStatus status;
  @override
  final AuthUser? user;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'AuthState(status: $status, user: $user, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            other.status == status &&
            other.user == user &&
            other.errorMessage == errorMessage);
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, user, errorMessage);

  @JsonKey(ignore: true)
  @override
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState({
    AuthStatus status,
    AuthUser? user,
    String? errorMessage,
  }) = _$AuthStateImpl;

  @override
  AuthStatus get status;
  @override
  AuthUser? get user;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith;
}
