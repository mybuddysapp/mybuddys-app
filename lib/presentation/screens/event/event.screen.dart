import 'package:auth_provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/event.controller.dart';

class EventScreen extends GetView<EventController> {
  EventScreen({super.key}) {
    Get.lazyPut(() => EventController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EventScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'EventScreen is working',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                // Get.to(() => ProfileScreen());
                var aaa = Get.find<AuthAPI>();
                aaa.getMe();
                logger.t(aaa.userEmail);
              },
              child: const Text("Home"),
            ),
          ],
        ),
      ),
    );
  }
}
