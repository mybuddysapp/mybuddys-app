

import 'package:json_annotation/json_annotation.dart';

part 'change_email_model.g.dart';

@JsonSerializable()
class ChangeEmailModel {
  String new_email;
  String re_new_email;
  String current_password;

  ChangeEmailModel({
    required this.new_email,
    required this.re_new_email,
    required this.current_password,
  });

  factory ChangeEmailModel.fromJson(Map<String, dynamic> json) =>
      _$ChangeEmailModelFromJson(json);
  Map<String, dynamic> toJson() => _$ChangeEmailModelToJson(this);
}
