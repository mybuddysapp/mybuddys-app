import 'package:auth_provider/auth_provider.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mybuddys/app/data/models/player/player.dart';
import 'package:mybuddys/config.dart';

import '../../../infrastructure/utils/const.dart';

class ProfileProvider extends GetConnect {
  final String url = ConfigEnvironments.getEnvironments()['url']!;

  @override
  void onInit() {
    httpClient.baseUrl = url;
    httpClient.defaultContentType = "application/json";
    // httpClient.defaultDecoder = (map) => Player.fromJson(map);
  }

  @override
  void onReady() {
    super.onReady();
    getPlayerProfile();
  }

  Future<Either<String, Player>> getPlayerProfile() async {
    final currentUser = Get.find<AuthAPI>();
    debugPrint("----->${currentUser.userId!}");
    final playerProfileUrl = '$url/player/${currentUser.userId!}';

    //if response has the player data then return it
    // if not the player profile is not yet created, should ask the user to create a new profile.
    final response = await get(playerProfileUrl);
    return response.isOk
        ? Right(Player.fromJson(response.body))
        : Left(response.statusText ?? 'Error fetching player profile');
  }

  Future<Player?> getProfile() async {
    final res =
        await get('${Consts.API_URL}/player/${Get.find<AuthAPI>().userId!}');
    if (res.hasError) {
      if (res.statusCode == 404) {
        return null;
      } else {
        throw Exception(res.statusText);
      }
    } else {
      return Player.fromJson(res.body);
    }
  }

  Future<bool> checkPseudonym(String pseudo) async {
    final response = await post(
      '${Consts.API_URL}/player/pseudonym',
      {'pseudonym': pseudo},
    );
    return response.statusCode == 200 && response.body['isAvailable'] == "true";
  }
}
