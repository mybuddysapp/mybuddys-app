import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/teams.controller.dart';

class TeamsScreen extends GetView<TeamsController> {
  TeamsScreen({super.key}) {
    Get.lazyPut(() => TeamsController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TeamsScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TeamsScreen is working' + controller.toString(),
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
