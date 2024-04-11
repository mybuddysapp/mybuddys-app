import 'package:auth_provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mybuddys/algo/model/player/player.dart';
import 'package:mybuddys/algo/provider/player/player_provider.dart';
import 'package:mybuddys/algo/routes/route_config.dart';
import 'package:provider/provider.dart';

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final AsyncValue<User?> user = ref.watch(userProvider.future);
    final session = ref.watch(authProvider.notifier).getSession();
    debugPrint("session: " + session!.user.toString());

    final AsyncValue<Player> player =
        ref.watch(playerProvider(session.user.id));
    // if (session == null) {
    //   return const Center(
    //     child: CircularProgressIndicator(),
    //   );
    // }

    return player.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Error: $error'),
            ElevatedButton(
              onPressed: () => ref.refresh(playerProvider(session.user.id)),
              child: const Text('Try Again'),
            ),
          ],
        ),
      ),
      data: (playerData) => _ProfileView(session: session, player: playerData),
    );
  }
}

class _ProfileView extends ConsumerWidget {
  final Session session;
  final Player player;

  const _ProfileView({
    required this.session,
    required this.player,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: NetworkImage(player.avatar!)),
          Text('Profile'),
          Text('Email: ${session.user.email}'),
          Text('pseudo: ${player.pseudonym}'),
          Text('Name: ${player.firstname} ${player.lastname}'),
          Text('DOB: ${player.dob}'),
          //AGE from DOB
          Text(
              'Age: ${DateTime.now().year - int.parse(player.dob.substring(0, 4))}'),
          Text('Bio: ${player.bio}'),
          Text('Phone: ${player.phone ?? 'N/A'}'),
          Text('Address: ${player.address}'),

          // these buttons should be in a row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // edit button
              // Material styled button

              // edit button
              //iphone styled button
              TextButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  // context.go(APP.editProfile.toName);
                },
                child: const Text('Edit Profile'),
              ),

              // logout button
              ElevatedButton(
                onPressed: () {
                  ref.watch(authProvider.notifier).logout();
                  return context.go(APP.login.toName);
                },
                child: const Text('Logout'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
