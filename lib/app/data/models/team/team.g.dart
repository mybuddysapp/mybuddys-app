// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TeamImpl _$$TeamImplFromJson(Map<String, dynamic> json) => _$TeamImpl(
      name: json['name'] as String,
      bio: json['bio'] as String?,
      logo: json['logo'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      created_at: DateTime.parse(json['created_at'] as String),
      captain: Player.fromJson(json['captain'] as Map<String, dynamic>),
      players: (json['players'] as List<dynamic>?)
          ?.map((e) => Player.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TeamImplToJson(_$TeamImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'bio': instance.bio,
      'logo': instance.logo,
      'city': instance.city,
      'country': instance.country,
      'created_at': instance.created_at.toIso8601String(),
      'captain': instance.captain,
      'players': instance.players,
    };
