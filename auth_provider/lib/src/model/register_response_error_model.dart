
import 'package:json_annotation/json_annotation.dart';

part 'register_response_error_model.g.dart';

@JsonSerializable()
class RegisterResponseErrorModel{
  List<String>? password;
  List<String>? email;

  RegisterResponseErrorModel({this.password, this.email});

  factory RegisterResponseErrorModel.fromJson(Map<String, dynamic> json) => _$RegisterResponseErrorModelFromJson(json);

}