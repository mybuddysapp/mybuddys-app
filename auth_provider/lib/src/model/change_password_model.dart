
import 'package:json_annotation/json_annotation.dart';

part 'change_password_model.g.dart';

@JsonSerializable()
class ChangePasswordModel {
  String new_password;
  String re_new_password;
  String current_password;

  ChangePasswordModel({
    required this.new_password,
    required this.re_new_password,
    required this.current_password,
  });

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordModelFromJson(json);
  Map<String, dynamic> toJson() => _$ChangePasswordModelToJson(this);
}