import 'package:auth_provider/auth_provider.dart';
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
    //2.
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = const Duration(seconds: 8);
  }

  @override
  void onReady() {
    super.onReady();
    getPlayerProfile();
  }

  Future<Player?> getPlayerProfile() async {
    // final client = await ref.getDebouncedDio();
    final currentUser = Get.find<AuthAPI>().currentUser;
    debugPrint("----->" + currentUser!.$id);
    final playerProfileUrl = '$url/player/${currentUser.$id}';

    // final response = await client.get('$API_URL/player/${currentUser.uid}');

    //if response has the player data then return the player
    // if not the player profile is not yet created, should ask the user to create a profile, so send null
    final response = await get(playerProfileUrl, decoder: (data) {
      return Player.fromJson(data);
    });
    return response.body;
  }

  Future<bool> checkPseudonym(String pseudo) async {
    final response = await post(
      '$Consts.API_URL/player/pseudonym',
      {'pseudonym': pseudo},
    );
    if (response.statusCode == 200 && response.body['isAvailable'] == "true") {
      return true;
    } else {
      return false;
    }
  }
}
