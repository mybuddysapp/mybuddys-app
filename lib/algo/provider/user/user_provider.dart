import 'package:auth_provider/auth_provider.dart';
import 'package:mybuddys/algo/api/api.dart';
import 'package:mybuddys/extensions/ref_ext.dart';
import 'package:provider/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

@riverpod
Future<User?> user(UserRef ref) async {
  final client = await ref.getDebouncedDio();

  // final auth= ref.watch(authProvider.notifier);

  // final response = await getResponseData(client, "player/");

  final User? user = supabase.auth.currentUser;

  // final User user = User.fromJson(response as Map<String, dynamic>);

  return user;
}
