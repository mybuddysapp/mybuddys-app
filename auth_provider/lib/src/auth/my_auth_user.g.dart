// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_auth_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyAuthUserImpl _$$MyAuthUserImplFromJson(Map<String, dynamic> json) =>
    _$MyAuthUserImpl(
      uid: json['uid'] as String,
      email: json['email'] as String,
      displayName: json['displayName'] as String?,
      photoUrl: json['photoUrl'] as String?,
    );

Map<String, dynamic> _$$MyAuthUserImplToJson(_$MyAuthUserImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'displayName': instance.displayName,
      'photoUrl': instance.photoUrl,
    };
