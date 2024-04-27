import 'package:auth_provider/auth_provider.dart';
import 'package:get/get.dart';

class Routes {
  static Future<String> get initialRoute async {
    // TODO: implement method
    // print('before object');
    // await Future.delayed(Duration(seconds: 2), () {
    //   print("object");
    // });
    // Get.putAsync<AppwriteAuthProvider>(
    //   () async {
    //     final instance = AppwriteAuthProvider();
    //     await instance.init();
    //     return instance;
    //   },
    //   permanent: true,
    // );
    // Get.put<AppwriteAuthProvider>(
    //   AppwriteAuthProvider(),
    //   permanent: true,
    //   builder: () {
    //     final instance = AppwriteAuthProvider();
    //     instance.init();
    //     return instance;
    //   },
    // );

    return Routes.ROOT;
  }

  static const ACTIVITY = '/activity';
  static const AUTH = '/auth';
  static const CALENDAR = '/calendar';
  static const EVENT = '/event';
  static const EVENTS = '/events';
  static const HOME = '/home';
  static const MESSAGES = '/messages';
  static const PROFILE = '/profile';
  static const ROOT = '/';
  static const SETTINGS = '/settings';
  static const TEAMS = '/teams';
}
