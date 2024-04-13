// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      id: json['id'] as String,
      number: json['number'] as String,
      street: json['street'] as String,
      city: json['city'] as String,
      state: json['state'] as String?,
      zip: json['zip'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'street': instance.street,
      'city': instance.city,
      'state': instance.state,
      'zip': instance.zip,
      'country': instance.country,
    };
