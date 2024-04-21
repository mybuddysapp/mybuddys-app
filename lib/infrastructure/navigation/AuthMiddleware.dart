import 'package:auth_provider/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mybuddys/infrastructure/navigation/routes.dart';

class MyMiddleware extends GetMiddleware {
  final authController = Get.find<AuthController>();
  //
  @override
  RouteSettings? redirect(String? route) {
    print('>>> Route $route called  -- '+authController.isAuthenticated.toString());
    return authController.isAuthenticated
        ? const RouteSettings(name: Routes.HOME)
        : const RouteSettings(name: Routes.AUTH);
  }

  @override
  GetPage? onPageCalled(GetPage? page) {
    print('>>> Page ${page?.name} called');
    print('>>> User ${authController.username} logged');
    return authController.username != null
        ? page?.copy(parameters: {'user': authController.username!})
        : page;
  }
}
