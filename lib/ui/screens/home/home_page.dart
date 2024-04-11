import 'package:auth_provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mybuddys/algo/model/activity/activity.dart';
import 'package:mybuddys/algo/provider/activity/activity_provider.dart';
import 'package:mybuddys/ui/components/MyScaffold.dart';
import 'package:mybuddys/ui/screens/calendar/CalendarPage.dart';
import 'package:mybuddys/ui/screens/event/events.dart';
import 'package:mybuddys/ui/screens/message/MessageSection.dart';
import 'package:mybuddys/ui/screens/message/messages.dart';
import 'package:mybuddys/ui/screens/profile/profile.dart';
import 'package:mybuddys/ui/screens/team/teams.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      const EventsPage(),
      CalendarPage(),
      const TeamsPage(),
      const MessageSection(),
      const ProfilePage(),
    ];
  }

  // var _currentIndex = 0;

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.sports_cricket),
        title: "Events",
        activeColorPrimary: Colors.purple,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.event),
        title: "Calendar",
        activeColorPrimary: Colors.blue,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.group),
        title: "Teams",
        activeColorPrimary: Colors.pink,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.chat),
        title: "Messages",
        activeColorPrimary: Colors.orange,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: "Profile",
        activeColorPrimary: Colors.teal,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white70,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      navBarStyle: NavBarStyle.style1,
      //add a shadow
      // decoration: NavBarDecoration(
      //     colorBehindNavBar: Colors.white,
      //     borderRadius: BorderRadius.circular(10.0)),
      popAllScreensOnTapOfSelectedTab: true,
      // itemAnimationProperties: ItemAnimationProperties(
      //   duration: const Duration(milliseconds: 200),
      //   curve: Curves.ease,
      // ),
      // screenTransitionAnimation: ScreenTransitionAnimation(
      //   animateTabTransition: true,
      //   curve: Curves.ease,
      //   duration: const Duration(milliseconds: 200),
      // ),
      navBarHeight: 70,
      // bottomScreenMargin: 0.0,
      hideNavigationBarWhenKeyboardShows: true,
      // hideNavigationBar: false,
    );
  }
}
