import 'package:get/get.dart';

import 'package:mybuddys/presentation/screens/settings/controllers/settings.controller.dart';

class SettingsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(
      () => SettingsController(),
    );
  }
}
