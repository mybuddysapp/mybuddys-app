import 'package:auth_provider/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybuddys/app/data/models/player/player.dart';
import 'package:mybuddys/infrastructure/navigation/routes.dart';
import 'package:mybuddys/presentation/components/my_sliver_app_bar.dart';
import 'package:mybuddys/presentation/screens/profile/widgets/create_profile/create_profile_sliver.dart';

// import 'package:appwrite/models.dart' as models;

import 'controllers/profile.controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  // @override
  // ProfileController controller = Get.put(ProfileController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // ProfileAppBar(avatar: null),
          MySliverAppBar(
            title: 'profile'.tr,
            avatarIcon: Icons.person_2,
            rightIconWidget: IconButton(
              icon: const Icon(
                CupertinoIcons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                // context.goNamed(app_route.settings.name);
                Get.toNamed(Routes.SETTINGS);
              },
            ),
            leftIconWidget: IconButton(
              style: Get.theme.iconButtonTheme.style,
              icon: const Icon(
                Icons.logout,
              ),
              onPressed: () {

                controller.onLogout();
              },
            ),
          ),
          SliverToBoxAdapter(
            child: controller.obx(
              (data) {
                // if (data != null) {
                return _ProfileView(player: data);
                // } else {
                //   return Center(
                //     child: Text('Profile not found'),
                //   );
                // }
              },
              onLoading: const Center(
                child: CircularProgressIndicator(),
              ),
              onEmpty: const CreateProfileSliver(),
              onError: (error) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Error: $error'),
                    ElevatedButton(
                      onPressed: () => {},
                      // ref.refresh(playerProfileProvider.notifier),
                      child: Text('try_again'.tr),
                    ),
                    // MyModalSheet(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CreatePlayerProfileWidget extends StatelessWidget {
  const CreatePlayerProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CreateProfileSliver(),
        ),
      ],
    );
  }
}

class _ProfileView extends StatelessWidget {
  final Player? player;

  _ProfileView({
    required this.player,
  });


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // display the user avatar or a default image
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              player?.avatar ?? 'https://via.placeholder.com/150',
            ),
          ),
          Text('profile'.tr),
          // Text('Email: ${session?.user.email}'),
          Text('pseudo: ${player?.pseudonym}'),
          Text('Name: ${player?.firstname} ${player?.lastname}'),
          Text('DOB: ${player?.dob}'),
          //AGE from DOB
          Text(
              'Age: ${DateTime.now().year - int.parse(player!.dob.substring(0, 4))}'),
          Text('Bio: ${player?.bio}'),
          Text('Phone: ${player?.phone ?? 'N/A'}'),
          Text('Address: ${player?.address}'),

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
                  // return context.go(app_route.login.name);
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
