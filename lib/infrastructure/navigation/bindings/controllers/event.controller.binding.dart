import 'package:get/get.dart';

import 'package:mybuddys/presentation/screens/event/controllers/event.controller.dart';

class EventControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventController>(
      () => EventController(),
    );
  }
}
