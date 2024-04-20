import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/events.controller.dart';

class EventsScreen extends GetView<EventsController> {
  const EventsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EventsScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EventsScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
