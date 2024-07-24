import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mybuddys/presentation/screens/profile/controllers/page_one.controller.dart';
import 'package:mybuddys/presentation/screens/profile/controllers/page_two.controller.dart';
import 'package:mybuddys/presentation/screens/profile/controllers/profile.controller.dart';

class CreateProfileController extends GetxController {
  final profileController = Get.find<ProfileController>();
  final TextEditingController pseudonym = TextEditingController();
  var isPseudoAvailable = RxnBool(null);

  final pageIndexNotifier = ValueNotifier<int>(0);

  @override
  void onInit() {
    super.onInit();
    // profileController.pseudonymController.text = pseudonym;
    if (isPseudoAvailable.value != null) {
      if (isPseudoAvailable.value == true) {
        secondPage();
        // pseudonym = profileController.pseudonymController.text;
      }
    }

    // isPseudoAvailable.listen((value) {
    //   if (value != null) {
    //     if (value == true) {
    //       secondPage();
    //       // pseudonym = profileController.pseudonymController.text;
    //     }
    //   }
    // });

    Get.lazyPut<PageOneController>(() => PageOneController());
    Get.lazyPut<PageTwoController>(() => PageTwoController());
  }

  void nextPage() {
    pageIndexNotifier.value++;
  }

  void previousPage() {
    pageIndexNotifier.value--;
  }

  void firstPage() {
    pageIndexNotifier.value = 0;
  }

  void secondPage() {
    pageIndexNotifier.value = 1;
  }
}
