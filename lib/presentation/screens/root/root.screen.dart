import 'package:auth_provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybuddys/presentation/screens.dart';

import 'controllers/root.controller.dart';

class RootScreen extends GetView<RootController> {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.status == AuthStatus.uninitialized
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
          )
        : controller.status == AuthStatus.authenticated
            ?  HomeScreen()
            :  AuthScreen());
  }
}
