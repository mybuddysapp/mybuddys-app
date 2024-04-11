import 'dart:convert';

import 'package:auth_provider/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:mybuddys/algo/api/api.dart';
import 'package:mybuddys/algo/model/player/player.dart';
import 'package:mybuddys/extensions/ref_ext.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/consts.dart';

part 'player_provider.g.dart';

@riverpod
Future<List<Player>> playerList(PlayerListRef ref) async {
  final client = await ref.getDebouncedHttpClient();

  // final response = await client.get(Uri.https('boredapi.com', '/api/activity'));
  final response = await supabase.from('player').select('*');

  final List<Player> players = response.map((e) => Player.fromJson(e)).toList();

  return players;
}

@riverpod
Future<Player> player(PlayerRef ref, String id) async {
  final client = await ref.getDebouncedDio();

  final response = await client.get('$API_URL/player/$id');

  // Directly pass the response data to Player.fromJson
  final Player player = Player.fromJson(response.data);

  return player;
}
