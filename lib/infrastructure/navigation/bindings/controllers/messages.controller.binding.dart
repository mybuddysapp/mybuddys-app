import 'package:get/get.dart';

import 'package:mybuddys/presentation/screens/messages/controllers/messages.controller.dart';

class MessagesControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessagesController>(
      () => MessagesController(),
    );
  }
}
