import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybuddys/presentation/screens.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key}) {
    Get.lazyPut(() => HomeController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomNavigationMenu(context, controller),
      body: PageView(
        controller: controller.pageController,
        onPageChanged: (index) {
          controller.changeTabIndex(index);
        },
        children: [
          EventsScreen(),
          TeamsScreen(),
          MessagesScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }

  Widget buildBottomNavigationMenu(
      BuildContext context, HomeController controller) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey.withOpacity(0.5),
            width: 1.0,
          ),
        ),
      ),
      child: Obx(
        () => BottomNavigationBar(
          showUnselectedLabels: false,
          showSelectedLabels: false,
          onTap: (index) {
            controller.pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          },
          currentIndex: controller.tabIndex.value,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black.withOpacity(0.5),
          items: const [
            BottomNavigationBarItem(
              activeIcon: Icon(CupertinoIcons.sportscourt_fill),
              icon: Icon(CupertinoIcons.sportscourt),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(CupertinoIcons.person_2_fill),
              icon: Icon(CupertinoIcons.person_2),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(CupertinoIcons.chat_bubble_2_fill),
              icon: Icon(CupertinoIcons.chat_bubble_2),
              label: 'Places',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(CupertinoIcons.settings_solid),
              icon: Icon(CupertinoIcons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
