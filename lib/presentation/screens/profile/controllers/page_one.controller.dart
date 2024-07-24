// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mybuddys/app/data/providers/profile_provider.dart';
// import 'package:mybuddys/presentation/screens/profile/controllers/create_profile.controller.dart';
// import 'package:mybuddys/presentation/screens/profile/controllers/page_two.controller.dart';
// import 'package:mybuddys/presentation/screens/profile/controllers/profile.controller.dart';
//
// class PageOneController extends GetxController {
//   final profileController = Get.find<ProfileController>();
//   final profileProvider = ProfileProvider();
//   final createProfileController = Get.find<CreateProfileController>();
//   final pageTwoController = Get.find<PageTwoController>();
//
//   get pseudonymController => createProfileController.pseudonym;
//
//   get isPseudoAvailable => createProfileController.isPseudoAvailable;
//
//   Future<void> handlePseudonymSearch() async {
//     final errorText = validatePseudonym(pseudonymController.text);
//     if (errorText == null) {
//       createProfileController.isPseudoAvailable.value = await profileProvider
//           .checkPseudonym(createProfileController.pseudonym.text);
//       update();
//     } else {
//       Get.snackbar('Error', errorText,
//           backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);
//     }
//   }
//
//   String? validatePseudonym(String value) {
//     final trimmedValue = value.trim();
//     // Regex to match a username that starts with a letter, followed by letters, numbers, underscores, or dots
//     final regex = RegExp(r'^[a-zA-Z][a-zA-Z0-9_.]*$');
//     if (trimmedValue.isEmpty) {
//       return 'Pseudonym cannot be empty';
//     } else if (!regex.hasMatch(value)) {
//       return 'Invalid pseudonym: must start with a letter, no spaces, only letters, numbers, underscores, or dots';
//     }
//     return null;
//   }
//
//   void handlePseudoSubmit() async {
//     final errorText = validatePseudonym(pseudonymController.text);
//     if (errorText != null) {
//       Get.snackbar('Error', errorText,
//           backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);
//       return;
//     }
//     await handlePseudonymSearch();
//     if (createProfileController.isPseudoAvailable.value == false) {
//       Get.snackbar('Pseudonym already taken', 'Please choose another pseudonym',
//           backgroundColor: Colors.red, snackPosition: SnackPosition.TOP);
//     } else {
//       Get.snackbar('Pseudonym available', 'You can proceed',
//           backgroundColor: Colors.green, snackPosition: SnackPosition.TOP);
//       pageTwoController.pseudo.value =
//           createProfileController.pseudonym.text.replaceAll(' ', "");
//       createProfileController.secondPage();
//     }
//   }
//
//   String? getErrorText() {
//     if (createProfileController.isPseudoAvailable.value == null) {
//       return null;
//     } else if (createProfileController.isPseudoAvailable.value == false) {
//       return 'Username is not available, please try another one.';
//     }
//     return validatePseudonym(pseudonymController.text);
//   }
//
//   Icon? getSuffixIcon() {
//     if (createProfileController.isPseudoAvailable.value == null) {
//       return null;
//     } else if (createProfileController.isPseudoAvailable.value == true) {
//       return const Icon(
//         CupertinoIcons.check_mark,
//         color: Colors.green,
//       );
//     } else {
//       return const Icon(
//         CupertinoIcons.nosign,
//         color: Colors.red,
//       );
//     }
//   }
//
//   InputDecoration? buildInputDecoration() {
//     return InputDecoration(
//       errorText: getErrorText(),
//       hintText: 'Try your best pseudonyme here ... ex: TheBadassPlayer',
//       suffixIcon: getSuffixIcon(),
//     );
//   }
//
//   Widget? stickyActionBar() {
//     return GetBuilder(
//       builder: (PageOneController controller) {
//         final isAvailable = controller.isPseudoAvailable;
//         if (isAvailable.value == null) return const SizedBox();
//         return isAvailable.value == true
//             ? Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     controller.handlePseudoSubmit();
//                   },
//                   child: const Text('Let\'s get started!'),
//                 ),
//               )
//             : const SizedBox();
//       },
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybuddys/app/data/providers/profile_provider.dart';
import 'package:mybuddys/presentation/components/player_profile_form/controllers/player_profile_form.controller.dart';
import 'package:mybuddys/presentation/screens/profile/controllers/create_profile.controller.dart';
import 'package:mybuddys/presentation/screens/profile/controllers/page_two.controller.dart';
import 'package:mybuddys/presentation/screens/profile/controllers/profile.controller.dart';

class PageOneController extends GetxController {
  final ProfileController profileController = Get.find<ProfileController>();
  final ProfileProvider profileProvider = ProfileProvider();
  final CreateProfileController createProfileController =
      Get.find<CreateProfileController>();
  final PageTwoController pageTwoController = Get.find<PageTwoController>();

  final pseudoKey = "pseudo";

  final formKey = GlobalKey<FormState>();

  final error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // error.listen((value) {
    //   if (value.isNotEmpty) {
    //     _showErrorSnackbar(value);
    //   }
    // });
    createProfileController.isPseudoAvailable.listen((value) {
      if (value == false) {
        error.value = 'Pseudonym already taken, please choose another one';
        // _showErrorSnackbar(
        //     'Pseudonym already taken, please choose another one');
      } else {
        _showSuccessSnackbar('Pseudonym available, you can proceed');
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    error.close();
  }

  TextEditingController get pseudonymController =>
      createProfileController.pseudonym;

  RxnBool get isPseudoAvailable => createProfileController.isPseudoAvailable;

  void _validatePseudonym() {
    pseudonymController.text = pseudonymController.text.trim();
    final regex = RegExp(r'^[a-zA-Z][a-zA-Z0-9_.]*$');
    if (pseudonymController.text.isEmpty) {
      error.value = 'Pseudonym cannot be empty';
    } else if (!regex.hasMatch(pseudonymController.text)) {
      error.value =
          'Invalid pseudonym: must start with a letter, no spaces, only letters, numbers, underscores, or dots';
    } else if (pseudonymController.text.length > 50) {
      error.value = 'Pseudonym cannot be more than 50 characters';
    } else {
      error.value = '';
    }
  }

  Future<void> handlePseudoSearch() async {
    _validatePseudonym();

    // logger.d("error --- " + formKey.currentState!.validate().toString());
    // if (!formKey.currentState!.validate()) {
    //   Get.snackbar("title", "message");
    // }

    if (error.isEmpty) {
      createProfileController.isPseudoAvailable.value = await profileProvider
          .checkPseudonym(createProfileController.pseudonym.text);
      update();
    }
  }

  void handlePseudoSubmit() async {
    await handlePseudoSearch();

    // if (!formKey.currentState!.validate()) {
    //   Get.snackbar("title", "message");
    // }

    if (error.isEmpty) {
      // if (isPseudoAvailable.value == false) {
      //   _showErrorSnackbar(
      //       'Pseudonym already taken, please choose another one');
      // } else {
      // _showSuccessSnackbar('Pseudonym available, you can proceed');
      pageTwoController.pseudo.value = createProfileController.pseudonym.text;
      createProfileController.secondPage();
      Get.lazyPut(() => PlayerProfileFormController(null));

      // }
    }
  }

  Icon? _getSuffixIcon() {
    if (isPseudoAvailable.value == null) {
      return null;
    } else if (isPseudoAvailable.value == true) {
      return const Icon(
        CupertinoIcons.check_mark,
        color: Colors.green,
      );
    } else if (error.value.isNotEmpty) {
      return const Icon(
        CupertinoIcons.info_circle,
        color: Colors.red,
      );
    } else {
      return const Icon(
        CupertinoIcons.nosign,
        color: Colors.yellow,
      );
    }
  }

  InputDecoration buildInputDecoration() {
    return InputDecoration(
      errorText: error.value.isNotEmpty ? error.value : null,
      // border: InputBorder.none,
      errorMaxLines: 3,
      hintText: 'Try your best pseudonym here ... ex: TheBadassPlayer',
      suffixIcon: _getSuffixIcon(),
    );
  }

  void handleOnChanged(String? value) {
    isPseudoAvailable.value = null;
    error.value = '';
  }

  void _showErrorSnackbar(String message) {
    Get.snackbar(
      'Error',
      message,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void _showSuccessSnackbar(String message) {
    // Get.snackbar(
    //   'Success',
    //   message,
    //   backgroundColor: Colors.green,
    //   snackPosition: SnackPosition.TOP,
    // );
  }

  // void clearPseudonymError() {
  //   createProfileController.isPseudoAvailable.value = null;
  // }

  // String? getErrorText() {
  //   final isAvailable = isPseudoAvailable?.value;
  //   if (isAvailable == null) {
  //     return null;
  //   } else if (isAvailable == false) {
  //     return 'Username is not available, please try another one.';
  //   }
  //   return _validatePseudonym(pseudonymController.text);
  // }

  Widget? stickyActionBar() {
    if (isPseudoAvailable.value == true && error.value.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: handlePseudoSubmit,
          child: const Text('Let\'s get started!'),
        ),
      );
    }
    return null;
  }
}
