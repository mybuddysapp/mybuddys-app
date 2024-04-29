// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_email_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeEmailModel _$ChangeEmailModelFromJson(Map<String, dynamic> json) =>
    ChangeEmailModel(
      new_email: json['new_email'] as String,
      re_new_email: json['re_new_email'] as String,
      current_password: json['current_password'] as String,
    );

Map<String, dynamic> _$ChangeEmailModelToJson(ChangeEmailModel instance) =>
    <String, dynamic>{
      'new_email': instance.new_email,
      're_new_email': instance.re_new_email,
      'current_password': instance.current_password,
    };
