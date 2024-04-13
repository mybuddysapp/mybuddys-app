import 'package:flutter/cupertino.dart';
import 'package:mybuddys/algo/api/api.dart';
import 'package:mybuddys/algo/model/event/event.dart';
import 'package:mybuddys/algo/provider/player/player_provider.dart';
import 'package:mybuddys/extensions/ref_ext.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'event_provider.g.dart';

@riverpod
Future<List<Event>> eventList(EventListRef ref) async {
  final client = await ref.getDebouncedDio();

  // final response = await client.get("http://192.168.1.202:8080/api/v1/event");

  final playerList = await ref.read(playerListProvider.future);
  final response = await getResponseListData(client, "events");

  debugPrint("response: " + response.toString());

  final List<Event> events =
      (response).map((e) => Event.fromJson(e as Map<String, dynamic>)).toList();

  return events;
}
