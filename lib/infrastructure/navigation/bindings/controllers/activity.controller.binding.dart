import 'package:get/get.dart';
import 'package:mybuddys/presentation/screens/activity/controllers/activity.controller.dart';


class ActivityControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActivityController>(
      () => ActivityController(),
    );
  }
}
