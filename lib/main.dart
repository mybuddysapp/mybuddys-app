import 'package:auth_provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mybuddys/resources/pages/event/events.dart';
import 'package:mybuddys/resources/pages/home/home_page.dart';
import 'package:mybuddys/resources/widgets/landing_page.dart';
import 'package:mybuddys/routes/route_config.dart';
import 'package:mybuddys/utils/consts.dart';

import 'app/translations/my_translations.dart';
import 'bootstrap/boot.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Nylo nylo = await Nylo.init(setup: Boot.nylo, setupFinished: Boot.finished);

  // initialize the user repository
  await SupabaseAuthProvider.initialize(
    SUPABASE_URL,
    // 'http://192.168.1.202:8000',
    SUPABASE_ANON_KEY,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        final router = ref.watch(routerProvider);
        return GetMaterialApp(
          title: 'MyBuddys',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          home: LandingPage(),
          themeMode: ThemeMode.system,
          translations: MyTranslations(),
          // your translations
          locale: Locale('fr', 'FR'),
          // translations will be displayed in that locale
          fallbackLocale: Locale('fr', 'FR'), // specify the fa
        );
        // return GetMaterialApp.router(
        //   title: 'MyBuddys',
        //   theme: ThemeData(
        //     primarySwatch: Colors.blue,
        //   ),
        //   routeInformationProvider: router.routeInformationProvider,
        //   routerDelegate: router.routerDelegate,
        //   routeInformationParser: router.routeInformationParser,
        //   debugShowCheckedModeBanner: false,
        //   themeMode: ThemeMode.system,
        //
        //   translations: MyTranslations(), // your translations
        //   locale: Locale('fr', 'FR'), // translations will be displayed in that locale
        //   fallbackLocale: Locale('fr', 'FR'), // specify the fallback locale in case an invalid locale is selected.
        //
        // );
      },
    );
  }
}
