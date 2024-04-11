// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_auth_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyAuthUser _$MyAuthUserFromJson(Map<String, dynamic> json) {
  return _MyAuthUser.fromJson(json);
}

/// @nodoc
mixin _$MyAuthUser {
  String get uid => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyAuthUserCopyWith<MyAuthUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyAuthUserCopyWith<$Res> {
  factory $MyAuthUserCopyWith(
          MyAuthUser value, $Res Function(MyAuthUser) then) =
      _$MyAuthUserCopyWithImpl<$Res, MyAuthUser>;
  @useResult
  $Res call({String uid, String email, String? displayName, String? photoUrl});
}

/// @nodoc
class _$MyAuthUserCopyWithImpl<$Res, $Val extends MyAuthUser>
    implements $MyAuthUserCopyWith<$Res> {
  _$MyAuthUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? displayName = freezed,
    Object? photoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyAuthUserImplCopyWith<$Res>
    implements $MyAuthUserCopyWith<$Res> {
  factory _$$MyAuthUserImplCopyWith(
          _$MyAuthUserImpl value, $Res Function(_$MyAuthUserImpl) then) =
      __$$MyAuthUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uid, String email, String? displayName, String? photoUrl});
}

/// @nodoc
class __$$MyAuthUserImplCopyWithImpl<$Res>
    extends _$MyAuthUserCopyWithImpl<$Res, _$MyAuthUserImpl>
    implements _$$MyAuthUserImplCopyWith<$Res> {
  __$$MyAuthUserImplCopyWithImpl(
      _$MyAuthUserImpl _value, $Res Function(_$MyAuthUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? displayName = freezed,
    Object? photoUrl = freezed,
  }) {
    return _then(_$MyAuthUserImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyAuthUserImpl with DiagnosticableTreeMixin implements _MyAuthUser {
  const _$MyAuthUserImpl(
      {required this.uid,
      required this.email,
      this.displayName,
      this.photoUrl});

  factory _$MyAuthUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyAuthUserImplFromJson(json);

  @override
  final String uid;
  @override
  final String email;
  @override
  final String? displayName;
  @override
  final String? photoUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MyAuthUser(uid: $uid, email: $email, displayName: $displayName, photoUrl: $photoUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MyAuthUser'))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('displayName', displayName))
      ..add(DiagnosticsProperty('photoUrl', photoUrl));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyAuthUserImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, uid, email, displayName, photoUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyAuthUserImplCopyWith<_$MyAuthUserImpl> get copyWith =>
      __$$MyAuthUserImplCopyWithImpl<_$MyAuthUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyAuthUserImplToJson(
      this,
    );
  }
}

abstract class _MyAuthUser implements MyAuthUser {
  const factory _MyAuthUser(
      {required final String uid,
      required final String email,
      final String? displayName,
      final String? photoUrl}) = _$MyAuthUserImpl;

  factory _MyAuthUser.fromJson(Map<String, dynamic> json) =
      _$MyAuthUserImpl.fromJson;

  @override
  String get uid;
  @override
  String get email;
  @override
  String? get displayName;
  @override
  String? get photoUrl;
  @override
  @JsonKey(ignore: true)
  _$$MyAuthUserImplCopyWith<_$MyAuthUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
