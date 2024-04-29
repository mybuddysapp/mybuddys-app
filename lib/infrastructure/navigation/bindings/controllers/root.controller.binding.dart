import 'package:auth_provider/auth_provider.dart';
import 'package:get/get.dart';
import 'package:mybuddys/presentation/screens/auth/controllers/auth.controller.dart';
import 'package:mybuddys/presentation/screens/home/controllers/home.controller.dart';
import 'package:mybuddys/presentation/screens/profile/controllers/profile.controller.dart';
import 'package:mybuddys/presentation/screens/root/controllers/root.controller.dart';

class RootControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AuthAPI(),
      // permanent: true,
    );
    Get.lazyPut<RootController>(
      () => RootController(),
    );
    Get.lazyPut<AuthScreenController>(() => AuthScreenController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
      fenix: true,
    );
  }
}
