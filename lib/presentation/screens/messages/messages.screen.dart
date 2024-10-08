import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/messages.controller.dart';

class MessagesScreen extends GetView<MessagesController> {
  const MessagesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MessagesScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MessagesScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
