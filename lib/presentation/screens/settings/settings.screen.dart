import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/settings.controller.dart';

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SettingsScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SettingsScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
