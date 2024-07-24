import 'package:auth_provider/auth_provider.dart';
import 'package:get/get.dart';
import 'package:mybuddys/app/data/models/player/player.dart';
import 'package:mybuddys/app/data/providers/profile_provider.dart';
import 'package:mybuddys/infrastructure/navigation/routes.dart';
import 'package:mybuddys/presentation/screens/profile/controllers/create_profile.controller.dart';

class ProfileController extends GetxController with StateMixin<Player> {
  ProfileProvider profileProvider = ProfileProvider();

  @override
  void onInit() {
    super.onInit();
    getPlayerProfile();
  }

  @override
  void onReady() {
    super.onReady();
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

  void onLogout() {
    Get.find<AuthAPI>().logOut();
    Get.deleteAll();
    Get.toNamed(Routes.ROOT);
  }

  void initCreateProfileController() {
    Get.lazyPut<CreateProfileController>(
      () => CreateProfileController(),
    );
  }
}
