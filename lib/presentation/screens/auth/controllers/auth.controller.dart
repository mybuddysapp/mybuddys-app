import 'package:auth_provider/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthScreenController extends GetxController {
  var isLogin = true.obs;

  var title = 'login'.tr.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String get email => emailController.text.trim();

  String get password => passwordController.text.trim();

  var authController = Get.find<AuthController>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onRegisterClick() {
    isLogin.value = false;
    title.value = 'register'.tr;
  }

  void onLoginClick() {
    isLogin.value = true;
    title.value = 'login'.tr;
  }

  void onLogin() {
    print('Login');
    authController.login(email, password);
  }

  void onRegister() {
    print('Register');
    authController.register(email, password);
  }

  void onForgetPassword() {
    print('Forget Password');
    authController.forgetPassword(email);
  }

  void onGoogleSignIn() {
    print('Google Sign In');
    authController.googleSignIn();
  }
}
