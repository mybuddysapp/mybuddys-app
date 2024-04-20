import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mybuddys/app/data/models/activity/activity.dart';
import 'package:mybuddys/app/data/models/address/address.dart';


part 'event.freezed.dart';

part 'event.g.dart';

@freezed
class Event with _$Event {
  factory Event({
    required String id,
    required String name,
    String? description,
    required DateTime created_at,
    required DateTime modified_at,
    required DateTime datetime,
    String? location,
    required Address address,
    required Activity activity,
    required List<String> players,
    String? picture,
    // Player? creator,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}
