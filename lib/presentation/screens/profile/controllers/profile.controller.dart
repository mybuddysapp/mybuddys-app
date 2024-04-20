import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mybuddys/app/data/models/player/player.dart';
import 'package:mybuddys/app/data/providers/profile_provider.dart';

class ProfileController extends GetxController with StateMixin<Player> {
  // Define an observable list of players
  // final RxList<Player> players = <Player>[].obs;
  ProfileProvider profileProvider = ProfileProvider();
  late final Rx<Player> playerProfile;

  final TextEditingController pseudonymController = TextEditingController();
  var isPseudoAvailable = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Fetch player list when the controller is initialized
  }

  @override
  void onReady() {
    super.onReady();
    // You may not need to fetch player list again when the widget is ready
    getPlayerProfile();
  }

  //method to get current user player porfile
  void getPlayerProfile() {

    profileProvider.getPlayerProfile().then((value) {
      change(value, status: RxStatus.success());
    }).catchError((error) {
      debugPrint("Error fetching player profile: $error");
    });
  }

  void checkPseudonym() {
    var res = profileProvider
        .checkPseudonym(pseudonymController.text)
        .then((isOk) => isPseudoAvailable.value = isOk);
    update();
  }

// Instantiate PlayerProvider
// PlayerProvider playerProvider = PlayerProvider();
//
// // Getter for the playerList
// List<Player> get playerList => players;
//
// // Method to fetch player list
// void getPlayerList() {
//   debugPrint("Fetching Player List");
//   playerProvider.getPlayers().then((value) {
//     players.assignAll(value); // Replace the list with the new value
//     //set the state to success
//     // change(List.of(value), status: RxStatus.success());
//   }).catchError((error) {
//     debugPrint("Error fetching player list: $error");
//   });
// }
//
// @override
// void onInit() {
//   super.onInit();
//   // Fetch player list when the controller is initialized
// }
//
// @override
// void onReady() {
//   super.onReady();
//   // You may not need to fetch player list again when the widget is ready
//   getPlayerList();
// }
//
// // Method to delete a player by ID
// void deletePlayer(int id) {
//   playerProvider.deletePlayer(id).then((value) {
//     // After deleting, fetch the updated player list
//     getPlayerList();
//   }).catchError((error) {
//     debugPrint("Error deleting player: $error");
//   });
// }
//
// @override
// void onClose() {
//   super.onClose();
//   // Clean up resources here if needed
// }
}
