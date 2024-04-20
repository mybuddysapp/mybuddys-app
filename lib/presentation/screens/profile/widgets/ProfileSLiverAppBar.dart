import 'package:auth_provider/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mybuddys/infrastructure/navigation/routes.dart';

class ProfileAppBar extends ConsumerWidget {
  final String? avatar;

  const ProfileAppBar({super.key, required this.avatar});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverAppBar(
      actions: [
        IconButton(
          icon: const Icon(
            CupertinoIcons.settings,
            color: Colors.white,
          ),
          onPressed: () {
            // context.goNamed(app_route.settings.name);
            Get.toNamed(Routes.SETTINGS);
          },
        ),
      ],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.logout,
          color: Colors.white,
        ),
        onPressed: () {
          ref.watch(authProvider.notifier).logout();
        },
      ),
      //colors
      backgroundColor: const Color(0xFF000000),
      // forceElevated: true,
      elevation: 6,
      shadowColor: Colors.black,
      //
      expandedHeight: 200,
      floating: true,
      pinned: true,
      // snap: false,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 40,
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: const Text(
          'P r o f i l e',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
          ),
        ),
        titlePadding: const EdgeInsets.all(8),
        centerTitle: true,
        expandedTitleScale: 2.5,
        background: avatar != null
            ? Image.network(
                avatar!,
                fit: BoxFit.cover,
              )
            : Container(
                color: Colors.blueGrey,
                child: const Icon(Icons.person_2, size: 200),
              ),
      ),
    );
  }
}
