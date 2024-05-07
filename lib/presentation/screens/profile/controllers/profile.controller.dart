import 'package:auth_provider/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mybuddys/app/data/models/player/player.dart';
import 'package:mybuddys/app/data/providers/profile_provider.dart';
import 'package:mybuddys/infrastructure/navigation/routes.dart';
import 'package:mybuddys/presentation/screens/profile/controllers/create_profile.controller.dart';

class ProfileController extends GetxController with StateMixin<Player> {
  ProfileProvider profileProvider = ProfileProvider();

  late final Rx<Player> playerProfile;

  final TextEditingController pseudonymController = TextEditingController();
  var isPseudoAvailable = false.obs;

  @override
  void onInit() {
    super.onInit();
    getPlayerProfile();
  }

  //method to get current user player profile
  void getPlayerProfile() {
    profileProvider.getProfile().then((value) {
      value != null
          ? change(value, status: RxStatus.success())
          : {
              initCreateProfileController(),
              change(null, status: RxStatus.empty())
            };
    }).catchError((error) {
      logger.e("Error fetching player profile: $error");
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  void handlePseudonymSubmit() async {
    isPseudoAvailable.value =
        await profileProvider.checkPseudonym(pseudonymController.text);
    update();
  }

  void onLogout() {
    Get.find<AuthAPI>().logOut();
    Get.offAllNamed(Routes.ROOT);
  }

  void initCreateProfileController() {
    Get.lazyPut<CreateProfileController>(() => CreateProfileController(
          pseudonym: pseudonymController.text,
        ));
  }

  void handlePseudoConfirm() {}
}
