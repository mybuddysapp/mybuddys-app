import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/activity.controller.dart';

class ActivityScreen extends GetView<ActivityController> {
  const ActivityScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ActivityScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ActivityScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
