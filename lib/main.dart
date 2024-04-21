import 'package:auth_provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybuddys/generated/locales.g.dart';
import 'package:mybuddys/infrastructure/utils/const.dart';

import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';

void main() async {
  var initialRoute = await Routes.initialRoute;
  await Consts.intialize();
  await SupabaseAuthProvider.initialize(
    Consts.SUPABASE_URL,
    Consts.SUPABASE_ANON_KEY,
  ).then((value) => {
        debugPrint(value.client.auth.toString()),
        Get.put(
          AuthController(value.client),
        ),
      });
  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;

  const Main(this.initialRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    // Get.changeTheme(
    //   Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
    // );
    return GetMaterialApp(
      title: 'MyBuddys',
      debugShowCheckedModeBanner: false,
      // showSemanticsDebugger: true,
      translationsKeys: AppTranslation.translations,
      initialRoute: initialRoute,
      themeMode: ThemeMode.system,
      theme: ThemeData(primarySwatch: Colors.teal),
      darkTheme: ThemeData.dark().copyWith(primaryColor: Colors.white30),
      getPages: Nav.routes,
      routingCallback: (routing) {},
      navigatorObservers: [],
    );
  }
}
