import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybuddys/presentation/screens.dart';


import 'controllers/event.controller.dart';

class EventScreen extends GetView<EventController> {
  const EventScreen({Key? key}) : super(key: key);

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
                Get.to(() => ProfileScreen());
              },
              child: const Text("Home"),
            ),
          ],
        ),
      ),
    );
  }
}
