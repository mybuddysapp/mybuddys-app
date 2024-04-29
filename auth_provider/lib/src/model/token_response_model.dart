

import 'package:json_annotation/json_annotation.dart';

part 'token_response_model.g.dart';

@JsonSerializable()
class TokenResponseModel {
  TokenResponseModel({
    required this.access,
    required this.refresh,
  });

  factory TokenResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseModelFromJson(json);

  final String access;
  final String refresh;

  Map<String, dynamic> toJson() => _$TokenResponseModelToJson(this);
}