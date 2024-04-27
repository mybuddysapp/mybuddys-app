import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config.dart';
import '../../presentation/screens.dart';
import 'bindings/controllers/controllers_bindings.dart';
import 'routes.dart';

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;

  const EnvironmentsBadge({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.DEV
        ? Banner(
            location: BannerLocation.topStart,
            message: "env",
            color: env == Environments.QAS ? Colors.blue : Colors.purple,
            child: child,
          )
        : SizedBox(child: child);
  }
}

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.AUTH,
      page: () => const AuthScreen(),
      binding: AuthControllerBinding(),
    ),
    GetPage(
      name: Routes.ROOT,
      page: () => const RootScreen(),
      // binding: RootControllerBinding(),
      // middlewares: [MyMiddleware()],
      children: [
        GetPage(
          name: Routes.HOME,
          page: () => const HomeScreen(),
          binding: HomeControllerBinding(),
          // middlewares: [MyMiddleware()],
        ),
        GetPage(
          name: Routes.PROFILE,
          page: () => const ProfileScreen(),
          binding: ProfileControllerBinding(),
          // middlewares: [MyMiddleware()],
        ),
        GetPage(
          name: Routes.EVENTS,
          page: () => const EventsScreen(),
          binding: EventsControllerBinding(),
          // middlewares: [MyMiddleware()],
        ),
        GetPage(
          name: Routes.EVENT,
          page: () => const EventScreen(),
          binding: EventControllerBinding(),
          // middlewares: [MyMiddleware()],
        ),
        GetPage(
          name: Routes.MESSAGES,
          page: () => const MessagesScreen(),
          binding: MessagesControllerBinding(),
          // middlewares: [MyMiddleware()],
        ),
        GetPage(
          name: Routes.SETTINGS,
          page: () => const SettingsScreen(),
          binding: SettingsControllerBinding(),
          // middlewares: [MyMiddleware()],

          // // middlewares: [MyMiddleware()],
        ),
        GetPage(
          name: Routes.CALENDAR,
          page: () => const CalendarScreen(),
          binding: CalendarControllerBinding(),
          // middlewares: [MyMiddleware()],
        ),
        GetPage(
          name: Routes.ACTIVITY,
          page: () => const ActivityScreen(),
          binding: ActivityControllerBinding(),
          // middlewares: [MyMiddleware()],
        ),
        GetPage(
          name: Routes.TEAMS,
          page: () => const TeamsScreen(),
          binding: TeamsControllerBinding(),
          // middlewares: [MyMiddleware()],
        ),
      ],
    ),
    GetPage(
      name: Routes.ROOT,
      page: () => const RootScreen(),
      binding: RootControllerBinding(),
    ),
  ];
}
