import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mybuddys/infrastructure/navigation/routes.dart';

class HomeController extends GetxController {
  var tabIndex = 0.obs;
  final PageController pageController = PageController(initialPage: 0);

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

}

