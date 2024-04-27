import 'package:auth_provider/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lo_form/core.dart';
import 'package:mybuddys/infrastructure/navigation/routes.dart';

class AuthScreenController extends GetxController {
  ValueChanged<LoFormState<String>>? loginFormState;
  ValueChanged<LoFormState<String>>? registerFormState;

  var loginFormKey = UniqueKey();
  var registerFormKey = UniqueKey();

  // var isLoggedIn = Get.find<AppwriteAuthProvider>().isAuthenticated.value;

  var isLogin = true.obs;

  var errorMessage = ''.obs;

  var title = 'login'.tr.obs;

  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();

  // String get email => emailController.text.trim();
  //
  // String get password => passwordController.text.trim();

  // var authController = Get.find<AppwriteAuthProvider>();
  var authController = Get.find<AuthAPI>();

  bool get isError => errorMessage.value.isNotEmpty;

  //Keys for the form fields

  final String emailKey = "Email Address";
  final String passwordKey = "Password";
  final String confirmPasswordKey = "Confirm Password";
  final String agreementKey = "Agreement";

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
  }

  // void _onLogin(String email, String password) async {
  //   print('Login');
  //   // var error = await authController.login(email, password);
  //   if (error != null) {
  //     print(error);
  //     errorMessage.value = error;
  //   }
  // }

  Future<bool> onLoginSubmit(Map<String, dynamic> values,
      void Function(Map<String, String?>) setErrors) async {
    try {
      await authController.createEmailSession(
          email: values[emailKey], password: values[passwordKey]);
      Get.offAllNamed(Routes.HOME);
      Get.snackbar(
        'Success',
        'Login Successful',
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
        // colorText: Colors.white,
      );
      return true;
    } catch (e) {
      print(e);
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        // colorText: Colors.white,
      );
      return false;
    }

    // _onLogin(values[emailKey], values[passwordKey]);
    // if (isError) {
    //   if (errorMessage.contains("email")) {
    //     setErrors({emailKey: 'Invalid email'});
    //   } else if (errorMessage.contains("password")) {
    //     setErrors({passwordKey: 'Invalid  password'});
    //   } else {
    //     setErrors({
    //       'Email Address': 'Invalid login credentials',
    //       'Password': 'Invalid login credentials'
    //     });
    //   }
    //   Get.snackbar(
    //     'Error',
    //     errorMessage.value,
    //     backgroundColor: Colors.red,
    //     snackPosition: SnackPosition.BOTTOM,
    //     // colorText: Colors.white,
    //   );
    //   values.clear();
    //   return false;
    // }
    // Get.snackbar(
    //   'Success',
    //   'Login Successful',
    //   backgroundColor: Colors.green,
    //   snackPosition: SnackPosition.BOTTOM,
    //   // colorText: Colors.white,
    // );
    // Get.offAllNamed(Routes.HOME);
    // return true;
  }

  // void _onRegister(String email, String password) async {
  //   var error = await authController.register(email, password);
  //   if (error != null) {
  //     print(error);
  //     errorMessage.value = error;
  //   }
  // }

  Future<bool?> onRegisterSubmit(Map<String, dynamic> values,
      void Function(Map<String, String?>) setErrors) async {
    // print('Register');
    // _onRegister(values[emailKey], values[passwordKey]);
    //
    // if (isError) {
    //   if (errorMessage.contains("email")) {
    //     setErrors({emailKey: 'Invalid email'});
    //   } else if (errorMessage.contains("password")) {
    //     setErrors({passwordKey: 'Invalid  password'});
    //   } else {
    //     setErrors({
    //       'Email Address': 'Invalid credentials',
    //       'Password': 'Invalid credentials'
    //     });
    //   }
    //   Get.snackbar(
    //     'Error',
    //     errorMessage.value,
    //     backgroundColor: Colors.red,
    //     snackPosition: SnackPosition.BOTTOM,
    //     // colorText: Colors.white,
    //   );
    //   values.clear();
    //   return false;
    // }
    // // isLogin.value = true;
    // Get.offAllNamed(Routes.HOME);
    // Get.snackbar(
    //   'Success',
    //   'Registration Successful',
    //   backgroundColor: Colors.green,
    //   snackPosition: SnackPosition.BOTTOM,
    //   // colorText: Colors.white,
    // );
    return true;
  }

  void onForgetPassword(String email) {
    print('Forget Password');
    // authController.forgetPassword(email);
  }

  void onGoogleSignIn() {
    print('Google Sign In');
    // authController.googleSignIn();
  }
}
