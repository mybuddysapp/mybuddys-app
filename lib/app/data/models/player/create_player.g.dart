// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreatePlayerImpl _$$CreatePlayerImplFromJson(Map<String, dynamic> json) =>
    _$CreatePlayerImpl(
      id: json['id'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      pseudonym: json['pseudonym'] as String,
      dob: json['dob'] as String,
      gender: json['gender'] as String,
      bio: json['bio'] as String?,
      phone: json['phone'] as String,
      address: json['address'] as String?,
      available: json['available'] as bool,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$$CreatePlayerImplToJson(_$CreatePlayerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'pseudonym': instance.pseudonym,
      'dob': instance.dob,
      'gender': instance.gender,
      'bio': instance.bio,
      'phone': instance.phone,
      'address': instance.address,
      'available': instance.available,
      'avatar': instance.avatar,
    };
