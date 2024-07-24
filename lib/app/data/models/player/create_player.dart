import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_player.freezed.dart';
part 'create_player.g.dart';

@freezed
class CreatePlayer with _$CreatePlayer {
  factory CreatePlayer({
    required String id,
    required String firstname,
    required String lastname,
    required String pseudonym,
    required String dob,
    required String gender,
    String? bio,
    required String phone,
    String? address,
    required bool available,
    String? avatar,
  }) = _CreatePlayer;

  factory CreatePlayer.fromJson(Map<String, dynamic> json) =>
      _$CreatePlayerFromJson(json);
}
