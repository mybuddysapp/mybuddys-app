import 'package:get/get.dart';



class ProfileControllerBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<ProfileController>(
    //   () => ProfileController(),
    // );
    // Get.put(ProfileController(), permanent: false);
    //put ProfileController into if the controller is not already created
    // Get.putAsync(() => null)<ProfileController>(() => ProfileController());
  }
}
