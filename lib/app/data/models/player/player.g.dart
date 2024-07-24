// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerImpl _$$PlayerImplFromJson(Map<String, dynamic> json) => _$PlayerImpl(
      id: json['id'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      pseudonym: json['pseudonym'] as String,
      dob: json['dob'] as String,
      created_at: DateTime.parse(json['created_at'] as String),
      modified_at: DateTime.parse(json['modified_at'] as String),
      gender: json['gender'] as String,
      bio: json['bio'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      banned_until: json['banned_until'] == null
          ? null
          : DateTime.parse(json['banned_until'] as String),
      banned_reason: json['banned_reason'] as String?,
      banned_by: json['banned_by'] as String?,
      available: json['available'] as bool?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$$PlayerImplToJson(_$PlayerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'pseudonym': instance.pseudonym,
      'dob': instance.dob,
      'created_at': instance.created_at.toIso8601String(),
      'modified_at': instance.modified_at.toIso8601String(),
      'gender': instance.gender,
      'bio': instance.bio,
      'phone': instance.phone,
      'address': instance.address,
      'banned_until': instance.banned_until?.toIso8601String(),
      'banned_reason': instance.banned_reason,
      'banned_by': instance.banned_by,
      'available': instance.available,
      'avatar': instance.avatar,
    };
