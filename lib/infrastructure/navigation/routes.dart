class Routes {
  static Future<String> get initialRoute async {
    // TODO: implement method
    await Future.delayed(Duration(seconds: 2));

    return HOME;
  }

  static const ROOT = '/';
  static const ACTIVITY = '/activity';
  static const CALENDAR = '/calendar';
  static const EVENT = '/event';
  static const EVENTS = '/events';
  static const HOME = '/home';
  static const MESSAGES = '/messages';
  static const PROFILE = '/profile';
  static const SETTINGS = '/settings';
  static const TEAMS = '/teams';
  static const AUTH = '/auth';
}
