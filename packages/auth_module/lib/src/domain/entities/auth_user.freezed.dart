part of 'auth_user.dart';

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by Freezed and you are not supposed to need it nor use it.');

mixin _$AuthUser {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthUserCopyWith<AuthUser> get copyWith =>
      throw _privateConstructorUsedError;
}

abstract class $AuthUserCopyWith<$Res> {
  factory $AuthUserCopyWith(AuthUser value, $Res Function(AuthUser) then) =
      _$AuthUserCopyWithImpl<$Res, AuthUser>;
  $Res call({String id, String email, String displayName});
}

class _$AuthUserCopyWithImpl<$Res, $Val extends AuthUser>
    implements $AuthUserCopyWith<$Res> {
  _$AuthUserCopyWithImpl(this._value, this._then);

  final $Val _value;
  final $Res Function($Val) _then;

  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? displayName = null,
  }) {
    return _then(_value.copyWith(
      id: id == null ? _value.id : id as String,
      email: email == null ? _value.email : email as String,
      displayName:
          displayName == null ? _value.displayName : displayName as String,
    ) as $Val);
  }
}

abstract class _$$AuthUserImplCopyWith<$Res>
    implements $AuthUserCopyWith<$Res> {
  factory _$$AuthUserImplCopyWith(
          _$AuthUserImpl value, $Res Function(_$AuthUserImpl) then) =
      __$$AuthUserImplCopyWithImpl<$Res>;
  @override
  $Res call({String id, String email, String displayName});
}

class __$$AuthUserImplCopyWithImpl<$Res>
    extends _$AuthUserCopyWithImpl<$Res, _$AuthUserImpl>
    implements _$$AuthUserImplCopyWith<$Res> {
  __$$AuthUserImplCopyWithImpl(
      _$AuthUserImpl _value, $Res Function(_$AuthUserImpl) _then)
      : super(_value, _then);

  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? displayName = null,
  }) {
    return _then(_$AuthUserImpl(
      id: id == null ? _value.id : id as String,
      email: email == null ? _value.email : email as String,
      displayName:
          displayName == null ? _value.displayName : displayName as String,
    ));
  }
}

class _$AuthUserImpl implements _AuthUser {
  const _$AuthUserImpl(
      {required this.id, required this.email, required this.displayName});

  @override
  final String id;
  @override
  final String email;
  @override
  final String displayName;

  @override
  String toString() {
    return 'AuthUser(id: $id, email: $email, displayName: $displayName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthUserImpl &&
            other.id == id &&
            other.email == email &&
            other.displayName == displayName);
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, email, displayName);

  @JsonKey(ignore: true)
  @override
  _$$AuthUserImplCopyWith<_$AuthUserImpl> get copyWith =>
      __$$AuthUserImplCopyWithImpl<_$AuthUserImpl>(this, _$identity);
}

abstract class _AuthUser implements AuthUser {
  const factory _AuthUser({
    required String id,
    required String email,
    required String displayName,
  }) = _$AuthUserImpl;

  @override
  String get id;
  @override
  String get email;
  @override
  String get displayName;
  @override
  @JsonKey(ignore: true)
  _$$AuthUserImplCopyWith<_$AuthUserImpl> get copyWith;
}
