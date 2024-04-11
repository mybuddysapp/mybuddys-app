import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mybuddys/algo/model/event/event.dart';
import 'package:mybuddys/algo/model/player/player.dart';
import 'package:mybuddys/algo/provider/player/player_provider.dart';

class EventPage extends HookConsumerWidget {
  final Event event;

  const EventPage({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final  players = ref.watch(playerListProvider);
    final AsyncValue<List<Player>> playerList = ref.watch(playerListProvider);

    //create a list of players using the ids from the event to the attendees
    final List<Player>? attendees = playerList.value
        ?.where((player) => event.players.contains(player.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(event.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Event Picture  try to get the event picture from event.picture or use a default image
                  SizedBox(
                    width: double.infinity,
                    child: event.picture != null
                        ? Image.network(
                            event.picture!,
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                          )
                        : const Icon(
                            Icons.event,
                            size: 200,
                          ),
                    // const SizedBox(height: 27),
                  ),
                  // Event Name
                  Text(
                    event.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  // Event Location
                  Text(
                    'Location: ${event.location}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 8),
                  // Event Activity
                  Text(
                    'Activity: ${event.activity.name}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 8),
                  // Event Date and Time
                  Text(
                    'Date and Time: ${event.datetime}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 8),
                  // Event Created Date
                  Text(
                    'Created At: ${event.created_at}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 8),
                  // Event Modified Date
                  Text(
                    'Modified At: ${event.modified_at}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Divider(thickness: 2, color: Colors.grey[300]),
            // Attendees Section (List of Players)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Players:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  // List of Attendees (Placeholder for now)
                  playerList.when(
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    error: (error, stackTrace) => Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Error: $error'),
                          ElevatedButton(
                            onPressed: () =>
                                ref.refresh(playerListProvider.future),
                            child: const Text('Try Again'),
                          ),
                        ],
                      ),
                    ),
                    data: (players) => Column(
                      children: attendees!
                          .map(
                            (player) => ListTile(
                              leading: CircleAvatar(
                                child: Text(
                                  player.firstname[0],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              title: Text(player.firstname),
                              subtitle: Text(player.lastname),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
