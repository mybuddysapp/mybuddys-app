import 'package:get/get.dart';
import 'package:mybuddys/presentation/screens/home/controllers/home.controller.dart';
import 'package:mybuddys/presentation/screens/profile/controllers/profile.controller.dart';



class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<ProfileController>(
    //   () => ProfileController(),
    //   // fenix: true,
    // );
    // Get.lazyPut<HomeController>(
    //   () => HomeController(),
    // );
  }
}
