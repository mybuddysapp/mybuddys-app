import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mybuddys/algo/routes/route_config.dart';
import 'package:mybuddys/ui/components/MyScaffold.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          ElevatedButton(
            onPressed: () {
              context.goNamed(APP.home.toName);
            },
            child: const Text('Go to Home'),
          ),
        ],
      ),
    );
  }
}
