import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:mybuddys/algo/model/activity/activity.dart';
import 'package:mybuddys/algo/provider/activity/activity_provider.dart';

import '../player/player.dart';

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
    required String location,
    required Activity activity,
    required List<String> players,
    String? picture,
     // Player? creator,
  }) = _Event;

  // factory Event.fromJson(Map<String, dynamic> json) {
  //   final activityId = json['activity_id'] as String; // Extract activity_id from JSON
  //   final activity = activityProvider(activityId); // Fetch the corresponding Activity object
  //   return _$EventFromJson(json).copyWith(activity: activity); // Update the activity property
  // }


  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}
