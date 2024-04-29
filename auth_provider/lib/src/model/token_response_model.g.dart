// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenResponseModel _$TokenResponseModelFromJson(Map<String, dynamic> json) =>
    TokenResponseModel(
      access: json['access'] as String,
      refresh: json['refresh'] as String,
    );

Map<String, dynamic> _$TokenResponseModelToJson(TokenResponseModel instance) =>
    <String, dynamic>{
      'access': instance.access,
      'refresh': instance.refresh,
    };
