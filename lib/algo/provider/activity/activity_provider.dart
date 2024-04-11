import 'package:async/async.dart';
import 'package:auth_provider/auth_provider.dart';
import 'package:mybuddys/algo/model/activity/activity.dart';
import 'package:mybuddys/extensions/ref_ext.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'activity_provider.g.dart';

// @riverpod
// Future<Activity> activity(ActivityRef ref) async {
//   final client = await ref.getDebouncedHttpClient();
//   final response = await client.get(Uri.https('boredapi.com', '/api/activity'));
//   final json = jsonDecode(response.body) as Map<String, dynamic>;
//   return Activity.fromJson(json);
// }

@riverpod
Future<List<Activity>> activityList(ActivityListRef ref) async {
  final memoizer = AsyncMemoizer<List<Activity>>();

  return memoizer.runOnce(() async {
    final client = await ref.getDebouncedHttpClient();
    final response = await supabase.from('activity').select('*');
    final List<Activity> activities =
        response.map((e) => Activity.fromJson(e)).toList();

    return activities;
  });
  // final client = await ref.getDebouncedHttpClient();
  // final response = await supabase.from('activity').select('*');
  // final List<Activity> activities = response
  //     .map((e) => Activity.fromJson(e ?? {})) // Handle null value here
  //     .toList();
  //
  // return activities;
}

@riverpod
Future<Activity> activity(ActivityRef ref, String activityId) async {
  final client = await ref.getDebouncedHttpClient();
  final response =
      await supabase.from('activity').select('*').eq('id', activityId);

  final Activity activity = response
      .map((e) => Activity.fromJson(e)) // Handle null value here
      .first;

  return activity;
}
