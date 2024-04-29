import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mybuddys/infrastructure/navigation/routes.dart';

class HomeController extends GetxController {
  var tabIndex = 0.obs;
  final PageController pageController = PageController(initialPage: 0);

  void changeTabIndex(int index) {
    tabIndex.value = index;



    // switch(index) {
    //   case 0:
    //     Get.toNamed(Routes.EVENTS);
    //     break;
    //   case 1:
    //     Get.toNamed(Routes.TEAMS);
    //     break;
    //   case 2:
    //     Get.toNamed(Routes.MESSAGES);
    //     break;
    //   case 3:
    //     Get.toNamed(Routes.PROFILE);
    //     break;
    // }
  }

}
