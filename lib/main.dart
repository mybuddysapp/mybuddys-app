import 'package:auth_provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mybuddys/algo/routes/route_config.dart';
import 'package:mybuddys/utils/consts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
        return MaterialApp.router(
          title: 'MyBuddys',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routerConfig: router,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
