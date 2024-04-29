import 'package:json_annotation/json_annotation.dart';

part 'uid_token_model.g.dart';

@JsonSerializable()
class UIDTokenModel {
  String uid;
  String token;

  UIDTokenModel({
    required this.uid,
    required this.token,
  });

  factory UIDTokenModel.fromJson(Map<String, dynamic> json) =>
      _$UIDTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$UIDTokenModelToJson(this);
}
