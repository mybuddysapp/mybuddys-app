// import 'package:auth_provider/auth_provider.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lo_form/core.dart';
// import 'package:mybuddys/infrastructure/navigation/routes.dart';
//
// class AuthScreenController extends GetxController {
//   ValueChanged<LoFormState<String>>? loginFormState;
//   ValueChanged<LoFormState<String>>? registerFormState;
//
//   var loginFormKey = UniqueKey();
//   var registerFormKey = UniqueKey();
//
//
//   var isLogin = true.obs;
//
//   var errorMessage = ''.obs;
//
//   var title = 'login'.tr.obs;
//
//   var authController = Get.find<AuthAPI>();
//
//   bool get isError => errorMessage.value.isNotEmpty;
//
//   //Keys for the form fields
//
//   final String emailKey = "Email Address";
//   final String passwordKey = "Password";
//   final String confirmPasswordKey = "Confirm Password";
//   final String agreementKey = "Agreement";
//
//   Icon appBarIcon() {
//     return isLogin.value
//         ? const Icon(CupertinoIcons.person_add)
//         : const Icon(CupertinoIcons.person);
//   }
//
//   IconData appBarAvatarIcon() =>
//       isLogin.value ? CupertinoIcons.person : CupertinoIcons.person_add;
//
//   void handleOnClick() {
//     isLogin.value = !isLogin.value;
//     title.value = isLogin.value ? 'login'.tr : 'register'.tr;
//   }
//
//
//   Future<bool> onLoginSubmit(Map<String, dynamic> values,
//       void Function(Map<String, String?>) setErrors) async {
//     try {
//       await authController.login(values[emailKey], values[passwordKey]);
//       Get.offAllNamed(Routes.HOME);
//       Get.snackbar(
//         'Success',
//         'Login Successful',
//         backgroundColor: Colors.green,
//         snackPosition: SnackPosition.BOTTOM,
//         // colorText: Colors.white,
//       );
//       return true;
//     } on DioException catch (e) {
//       print(e);
//       Get.snackbar(
//         'Error',
//         ExceptionService.errorDecoder(e.type),
//         backgroundColor: Colors.red,
//         snackPosition: SnackPosition.BOTTOM,
//         // colorText: Colors.white,
//       );
//       return false;
//     } catch (e) {
//       print(e);
//       Get.snackbar(
//         'Error',
//         e.toString(),
//         backgroundColor: Colors.red,
//         snackPosition: SnackPosition.BOTTOM,
//         // colorText: Colors.white,
//       );
//       return false;
//     }
//   }
//
//   Future<bool?> onRegisterSubmit(Map<String, dynamic> values,
//       void Function(Map<String, String?>) setErrors) async {
//     try {
//       await authController.register(values[emailKey], values[passwordKey]);
//       Get.offAllNamed(Routes.HOME);
//       Get.snackbar(
//         'Success',
//         'Registration Successful',
//         backgroundColor: Colors.green,
//         snackPosition: SnackPosition.BOTTOM,
//         // colorText: Colors.white,
//       );
//       return true;
//     } on AuthException catch (e) {
//
//       // switch(e){
//       //   case :
//       //     setErrors({emailKey: 'Email already exists'});
//       //     break;
//       // }
//       Get.snackbar(
//         'Error',
//         e.message,
//         backgroundColor: Colors.red,
//         snackPosition: SnackPosition.BOTTOM,
//         // colorText: Colors.white,
//       );
//       return false;
//     } on DioException catch (e) {
//       Get.snackbar(
//         'Error',
//         ExceptionService.errorDecoder(e.type),
//         backgroundColor: Colors.red,
//         snackPosition: SnackPosition.BOTTOM,
//         // colorText: Colors.white,
//       );
//       return false;
//
//     } catch (e) {
//
//
//       Get.snackbar(
//         'Error',
//         e.toString(),
//         backgroundColor: Colors.red,
//         snackPosition: SnackPosition.BOTTOM,
//         // colorText: Colors.white,
//       );
//       return false;
//     }
//   }
//
//   void onForgetPassword(String email) {
//     print('Forget Password');
//     // authController.forgetPassword(email);
//   }
//
//   void onGoogleSignIn() {
//     print('Google Sign In');
//     // authController.googleSignIn();
//   }
// }


import 'package:auth_provider/auth_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybuddys/infrastructure/navigation/routes.dart';

class AuthScreenController extends GetxController {
  // Form keys
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  // Text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // State variables
  var isLogin = true.obs;
  var errorMessage = ''.obs;
  var title = 'login'.tr.obs;

  // Auth API controller
  var authController = Get.find<AuthAPI>();

  bool get isError => errorMessage.value.isNotEmpty;

  Icon appBarIcon() {
    return isLogin.value
        ? const Icon(CupertinoIcons.person_add)
        : const Icon(CupertinoIcons.person);
  }

  IconData appBarAvatarIcon() =>
      isLogin.value ? CupertinoIcons.person : CupertinoIcons.person_add;

  void handleOnClick() {
    isLogin.value = !isLogin.value;
    title.value = isLogin.value ? 'login'.tr : 'register'.tr;
    // Clear fields and errors when switching forms
    clearFormFields();
  }

  void clearFormFields() {
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  Future<bool> onLoginSubmit() async {
    if (!loginFormKey.currentState!.validate()) {
      return false;
    }
    try {
      await authController.login(emailController.text, passwordController.text);
      Get.offAllNamed(Routes.HOME);
      Get.snackbar(
        'Success',
        'Login Successful',
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
      );
      return true;
    } on DioException catch (e) {
      Get.snackbar(
        'Error',
        ExceptionService.errorDecoder(e.type),
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }

  Future<bool> onRegisterSubmit() async {
    if (!registerFormKey.currentState!.validate()) {
      return false;
    }
    try {
      await authController.register(emailController.text, passwordController.text);
      Get.offAllNamed(Routes.HOME);
      Get.snackbar(
        'Success',
        'Registration Successful',
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
      );
      return true;
    } on AuthException catch (e) {
      Get.snackbar(
        'Error',
        e.message,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } on DioException catch (e) {
      Get.snackbar(
        'Error',
        ExceptionService.errorDecoder(e.type),
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }

  void onForgetPassword(String email) {
    print('Forget Password');
    // Implement forget password functionality
  }

  void onGoogleSignIn() {
    print('Google Sign In');
    // Implement Google sign-in functionality
  }
}
