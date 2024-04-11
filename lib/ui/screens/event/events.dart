import 'package:auth_provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mybuddys/algo/model/event/event.dart';
import 'package:mybuddys/algo/provider/activity/activity_provider.dart';
import 'package:mybuddys/algo/provider/event/event_provider.dart';
import 'package:mybuddys/ui/components/MyEventCard.dart';
import 'package:mybuddys/ui/components/MyRefreshIndicator.dart';

import '../../../algo/provider/player/player_provider.dart';

class EventsPage extends HookConsumerWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Event>> eventList = ref.watch(eventListProvider);

    final playersList = ref.watch(playerListProvider.future);

    // debugPrint("playersList: " + playersList.toString());

    return RefreshIndicator(
      displacement: 100,
      notificationPredicate: (notification) {
        return notification.depth == 0;
      },

      onRefresh: () => ref.refresh(eventListProvider.future),
      child: eventList.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Error: $error'),
              ElevatedButton(
                onPressed: () => ref.refresh(eventListProvider.future),
                child: const Text('Try Again'),
              ),
            ],
          ),
        ),
        data: (activityData) => ListView.builder(
          itemCount: activityData.length,
          itemBuilder: (context, index) {
            final event = activityData[index];
            return MyEventCard(event: event);
          },
        ),
      ),
    );
  }
}
