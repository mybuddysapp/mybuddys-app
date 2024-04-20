import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'player.g.dart';

part 'player.freezed.dart';

@freezed
class Player with _$Player {
  factory Player({
    required String id,
    required String firstname,
    required String lastname,
    required String pseudonym,
    required String dob,
    required DateTime created_at,
    required DateTime modified_at,
    String? bio,
    String? phone,
    String? address,
    DateTime? banned_until,
    String? banned_reason,
    String? banned_by,
    bool? available,
    String? avatar, // Change type from Image to String
  }) = _Player;

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
}
