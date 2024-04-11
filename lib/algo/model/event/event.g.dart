// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventImpl _$$EventImplFromJson(Map<String, dynamic> json) => _$EventImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      created_at: DateTime.parse(json['created_at'] as String),
      modified_at: DateTime.parse(json['modified_at'] as String),
      datetime: DateTime.parse(json['datetime'] as String),
      location: json['location'] as String,
      activity: Activity.fromJson(json['activity'] as Map<String, dynamic>),
      players:
          (json['players'] as List<dynamic>).map((e) => e as String).toList(),
      picture: json['picture'] as String?,
    );

Map<String, dynamic> _$$EventImplToJson(_$EventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'created_at': instance.created_at.toIso8601String(),
      'modified_at': instance.modified_at.toIso8601String(),
      'datetime': instance.datetime.toIso8601String(),
      'location': instance.location,
      'activity': instance.activity,
      'players': instance.players,
      'picture': instance.picture,
    };
