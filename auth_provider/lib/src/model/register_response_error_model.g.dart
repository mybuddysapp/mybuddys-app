// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponseErrorModel _$RegisterResponseErrorModelFromJson(
        Map<String, dynamic> json) =>
    RegisterResponseErrorModel(
      password: (json['password'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      email:
          (json['email'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$RegisterResponseErrorModelToJson(
        RegisterResponseErrorModel instance) =>
    <String, dynamic>{
      'password': instance.password,
      'email': instance.email,
    };
