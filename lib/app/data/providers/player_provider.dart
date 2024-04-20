import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mybuddys/app/data/models/player/player.dart';
import 'package:mybuddys/config.dart';

class PlayerProvider extends GetConnect {
  final String url = ConfigEnvironments.getEnvironments()['url']!;

  // Get the URL from the environments map
  @override
  void onInit() {
    super.onInit();

    // add your local storage here to load for every request
    // var token = LocalStorage.readToken();
    //1.base_url
    httpClient.baseUrl = url;
    //2.
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = const Duration(seconds: 8);
    // httpClient.addResponseModifier((request, response) async {
    //   print(response.body);
    // });
    // httpClient.addRequestModifier((request) async {
    //   // add request here
    //   return request;
    // });
    // // var headers = {'Authorization': "Bearer $token"};
    // httpClient.addAuthenticator((request) async {
    //   request.headers.addAll(headers);
    //   return request;
    // });

    // super.onInit();

    debugPrint("URL: $url");
    // httpClient.baseUrl = url;
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Player.fromJson(map);
      if (map is List) return map.map((item) => Player.fromJson(item)).toList();
    };
  }

  Future<List<Player>> getPlayers() async {
    final playerUrl = '$url/player';
    final Response<List<Player>> response = await get(
      playerUrl,
      decoder: (data) {
        return (data as List).map((e) => Player.fromJson(e)).toList();
      },
    );

    var rr = AsyncValue.data(response.body!);
    return response.body ?? [];
  }

  Future<Player?> getPlayer(int id) async {
    final response = await get('player/$id');
    return response.body;
  }

  Future<Response<Player>> postPlayer(Player player) async =>
      await post('player', player);

  Future<Response> deletePlayer(int id) async => await delete('player/$id');
}
