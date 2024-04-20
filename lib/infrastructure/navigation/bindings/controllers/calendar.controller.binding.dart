import 'package:get/get.dart';

import 'package:mybuddys/presentation/screens/calendar/controllers/calendar.controller.dart';

class CalendarControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalendarController>(
      () => CalendarController(),
    );
  }
}
