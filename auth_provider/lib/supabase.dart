import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthProvider {
  final SupabaseClient _client;

  SupabaseClient get client => _client;

  SupabaseAuthProvider(this._client);

  static Future<SupabaseAuthProvider> initialize(
    String url,
    String anonKey,
  ) async {
    await Supabase.initialize(
      url: url,
      anonKey: anonKey,
    );
    return SupabaseAuthProvider(Supabase.instance.client);
  }
}
