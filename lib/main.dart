import 'package:auth_provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybuddys/infrastructure/navigation/bindings/controllers/controllers_bindings.dart';
import 'package:mybuddys/infrastructure/utils/const.dart';
import 'package:mybuddys/presentation/screens.dart';
import 'package:mybuddys/presentation/screens/auth/controllers/auth.controller.dart';
import 'package:mybuddys/presentation/screens/home/controllers/home.controller.dart';
import 'package:provider/provider.dart';

import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';

void main() async {
  var initialRoute = await Routes.initialRoute;
  await Consts.intialize();
  // await ServicesSer().dependencies();

  // await SupabaseAuthProvider.initialize(
  //   Consts.SUPABASE_URL,
  //   Consts.SUPABASE_ANON_KEY,
  // ).then((value) => {
  //       debugPrint(value.client.auth.toString()),
  //       Get.put(
  //         AuthController(value.client),
  //       ),
  //     },
  // );

  // Get.put(
  //   AppwriteAuthProvider(),
  //   // () => AppwriteAuthProvider(),
  //   permanent: true,
  //   builder: AppwriteAuthProvider.initialize(),
  // );

  runApp(
    Main(initialRoute),
  );
}

class ServicesSer extends Bindings {
  @override
  void dependencies() {
    // Get.putAsync<AppwriteAuthProvider>(
    //   () async {
    //     final instance = AppwriteAuthProvider();
    //     await Future.delayed(const Duration(seconds: 2));
    //     await instance.init();
    //     return instance;
    //   },
    //   permanent: true,
    // );
    Get.lazyPut(() => AuthAPI());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => AuthScreenController());
  }
}

class Main extends StatelessWidget {
  final String initialRoute;

  const Main(this.initialRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    // Get.changeTheme(
    //   Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
    // );
    // var appwriteAuthProvider = Get.find<AppwriteAuthProvider>();

    // Get.put(
    //   AuthScreenController(),
    // );
    // final value = context.watch<AuthAPI>().status;
    // print('==== TOP CHANGE Value changed to: $value!');
    //
    // value == AuthStatus.uninitialized
    //     ? print("Uninitialized")
    //     : value == AuthStatus.authenticated
    //         ? print("Authenticated")
    //         : print("Unauthenticated");

    return GetMaterialApp(
      key: UniqueKey(),
      title: 'MyBuddys',
      debugShowCheckedModeBanner: false,
      // showSemanticsDebugger: true,
      // translationsKeys: AppTranslation.translations,
      // initialRoute: initialRoute,
      themeMode: ThemeMode.system,
      theme: ThemeData(primarySwatch: Colors.teal),
      darkTheme: ThemeData.dark().copyWith(primaryColor: Colors.white30),
      // home: value == AuthStatus.uninitialized
      //     ? const Scaffold(
      //         body: Center(child: CircularProgressIndicator()),
      //       )
      //     : value == AuthStatus.authenticated
      //         ? const HomeScreen()
      //         : const AuthScreen(),
      getPages: Nav.routes,
      home: const RootScreen(),
      initialBinding: RootControllerBinding(),
      // home: Obx(
      //   () {
      //     return appwriteAuthProvider.isAuthenticated.isTrue
      //         ? const HomeScreen()
      //         : const AuthScreen();
      //   },
      // )
      // routingCallback: (routing) {},
      // navigatorObservers: [],
    );
  }
}
