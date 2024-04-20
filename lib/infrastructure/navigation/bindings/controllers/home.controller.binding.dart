import 'package:get/get.dart';
import 'package:mybuddys/presentation/screens/home/controllers/home.controller.dart';
import 'package:mybuddys/presentation/screens/profile/controllers/profile.controller.dart';



class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut(
      () => ProfileController(),
      fenix: true,
    );
  }
}
