import 'package:get/get.dart';

import 'package:mybuddys/presentation/screens/auth/controllers/auth.controller.dart';


class AuthControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthScreenController>(
      () => AuthScreenController(),
    );
  }
}
