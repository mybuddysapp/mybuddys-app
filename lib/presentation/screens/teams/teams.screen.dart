import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/teams.controller.dart';

class TeamsScreen extends GetView<TeamsController> {
  const TeamsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TeamsScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TeamsScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
