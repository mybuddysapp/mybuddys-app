// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordModel _$ChangePasswordModelFromJson(Map<String, dynamic> json) =>
    ChangePasswordModel(
      new_password: json['new_password'] as String,
      re_new_password: json['re_new_password'] as String,
      current_password: json['current_password'] as String,
    );

Map<String, dynamic> _$ChangePasswordModelToJson(
        ChangePasswordModel instance) =>
    <String, dynamic>{
      'new_password': instance.new_password,
      're_new_password': instance.re_new_password,
      'current_password': instance.current_password,
    };
