import 'package:get/get.dart';

import 'package:mybuddys/presentation/screens/events/controllers/events.controller.dart';

class EventsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventsController>(
      () => EventsController(),
    );
  }
}
