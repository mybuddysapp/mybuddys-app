import 'package:auth_provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mybuddys/utils/consts.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialize the user repository
  await SupabaseAuthProvider.initialize(
    // SUPABASE_URL,
    'http://192.168.1.202:8000',
    SUPABASE_ANON_KEY,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
