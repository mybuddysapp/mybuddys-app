import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/calendar.controller.dart';

class CalendarScreen extends GetView<CalendarController> {
  const CalendarScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CalendarScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CalendarScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
