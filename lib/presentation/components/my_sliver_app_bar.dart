import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MySliverAppBar extends StatelessWidget {
  final String? avatar;
  final IconData? avatarIcon;
  final String title;
  final Widget? rightIconWidget;
  final Widget? leftIconWidget;

  const MySliverAppBar(
      {super.key,
      this.avatar,
      this.avatarIcon,
      required this.title,
      this.rightIconWidget,
      this.leftIconWidget});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      actions: [
        // IconButton(
        //   icon: const Icon(
        //     CupertinoIcons.settings,
        //     color: Colors.white,
        //   ),
        //   onPressed: () {
        //     // context.goNamed(app_route.settings.name);
        //     Get.toNamed(Routes.SETTINGS);
        //   },
        // ),
        rightIconWidget ?? const SizedBox(),
      ],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      leading: leftIconWidget ?? const SizedBox(),
      // IconButton(
      //   icon: const Icon(
      //     Icons.logout,
      //     color: Colors.white,
      //   ),
      //   onPressed: () {
      //     // ref.watch(authProvider.notifier).logout();
      //   },
      // ),
      //colors
      backgroundColor: const Color(0xFF1C4F5E),
      // forceElevated: true,
      elevation: 6,
      shadowColor: Colors.black,
      //
      expandedHeight: 200,
      floating: true,
      pinned: true,
      // snap: false,
      centerTitle: true,
      titleTextStyle:  TextStyle(
        color: Get.theme.primaryColor,
        fontSize: 40,
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          title.split('').join(' '),
          style:  TextStyle(
            color: Get.textTheme.headline1!.color,
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
                child: Icon(avatarIcon, size: 200),
              ),
      ),
    );
  }
}
