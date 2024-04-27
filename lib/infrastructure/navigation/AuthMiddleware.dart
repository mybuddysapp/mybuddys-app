import 'package:auth_provider/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mybuddys/infrastructure/navigation/routes.dart';

class MyMiddleware extends GetMiddleware {
  // final authController = Get.find<AppwriteAuthProvider>();

  //
  @override
  RouteSettings? redirect(String? route) {
    final authProvider = Get.find<AppwriteAuthProvider>();
    // // while (!authProvider.initialized) {
    //   print('>>> Preloading');
    //
    //   print('>>> whoami  -- ${authProvider.user.value}');
    //   print('>>> amIOK  -- ${authProvider.isAuthenticated.value}');

    //authProvider.onInit();

    bool isAuthenticated = authProvider.isAuthenticated.value;
    //
    if (!isAuthenticated) {
      return const RouteSettings(name: Routes.AUTH);
    } else {
      if (route == Routes.AUTH) {
        return const RouteSettings(name: Routes.HOME);
      }
      return null;
    }
    // }
// return null;
// var authController = Get.find<AuthController>();
// print("################");
// print(authController.test);
// return authController.isAuthenticated
//     ? const RouteSettings(name: Routes.HOME)
//     : const RouteSettings(name: Routes.AUTH);
  }

// @override
// GetPage? onPageCalled(GetPage? page) {
//   print('>>> Page ${page?.name} called');
//   print('>>> User ${authController.username} logged');
//   return authController.username != null
//       ? page?.copy(parameters: {'user': authController.username!})
//       : page;
// }
}
