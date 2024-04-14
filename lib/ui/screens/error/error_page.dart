import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mybuddys/algo/routes/route_config.dart';

class ErrorScreen extends StatelessWidget {
  final String message;

  const ErrorScreen({super.key, required this.message});

  onPressed(BuildContext context) {
    // Go to home screen
    context.push(APP.home.toPath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Error Screen"),
            ElevatedButton(
              // Go to home screen
              child: const Text("HOME"),
              onPressed: () {
                onPressed(context);
              },
            ),
            ElevatedButton(
                onPressed: () {
                  context.go(APP.splash.toPath);
                },
                child: const Text("Splash Screen")),
          ],
        ),
      ),
    );
  }
}
