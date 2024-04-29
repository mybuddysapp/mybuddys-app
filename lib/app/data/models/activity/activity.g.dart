// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActivityImpl _$$ActivityImplFromJson(Map<String, dynamic> json) =>
    _$ActivityImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      type: json['type'] as String,
      no_of_players: (json['no_of_players'] as num).toInt(),
    );

Map<String, dynamic> _$$ActivityImplToJson(_$ActivityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'type': instance.type,
      'no_of_players': instance.no_of_players,
    };
