import 'package:flutter/material.dart';
import 'package:mybuddys/ui/components/MyBottomNavigationBar.dart';

class MyScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final String currentRoute;

  const MyScaffold({
    super.key,
    required this.body,
    this.appBar,
    required this.currentRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
      bottomNavigationBar: MyBottomNavigationBar(
        currentRoute: currentRoute,
        controller: ScrollController(),
      ),
    );
  }
}
