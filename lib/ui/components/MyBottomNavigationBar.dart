import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:mybuddys/algo/routes/route_config.dart';
import 'package:mybuddys/ui/screens/event/events.dart';
import 'package:mybuddys/ui/screens/home/home_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MyBottomNavigationBar extends StatefulWidget {
  final String currentRoute;
  final ScrollController controller;

  const MyBottomNavigationBar(
      {super.key, required this.currentRoute, required this.controller});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar>
    with SingleTickerProviderStateMixin {
  // late AnimationController _animationController;
  // late Animation<double> _animation;

  var _currentIndex = 0;

  bool isSearchBarVisible = false;

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      currentIndex: _currentIndex,
      //use go router to navigate between pages
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
        switch (index) {
          case 0:
            // context.push(APP.home.toPath);
            MaterialPageRoute(
              builder: (BuildContext context) {
                return Home();
              },
            );
            break;
          case 1:
            // context.push(APP.events.toPath);
            // Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const EventsPage();
              },
              // ),
            );
            break;
          case 2:
            context.goNamed(APP.login.toName);
            break;
          case 3:
            context.goNamed(APP.splash.toName);
            break;
          case 4:
            context.goNamed(APP.profile.toName);
          default:
            context.goNamed(APP.home.toName);
        }
      },
      items: [
        SalomonBottomBarItem(
          icon: Icon(Icons.sports_cricket),
          title: Text("Events"),
          selectedColor: Colors.purple,
        ),
        SalomonBottomBarItem(
          icon: Icon(Icons.group),
          title: Text("Teams"),
          selectedColor: Colors.pink,
        ),
        SalomonBottomBarItem(
          icon: Icon(Icons.message),
          title: Text("Messages"),
          selectedColor: Colors.orange,
        ),
        SalomonBottomBarItem(
          icon: Icon(Icons.person),
          title: Text("Profile"),
          selectedColor: Colors.teal,
        ),
      ],
      // Container(
      //   padding: const EdgeInsets.all(12),
      //   // margin: const EdgeInsets.symmetric(horizontal: 24),
      //   decoration: BoxDecoration(
      //     color: Colors.blueGrey[700],
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.black.withOpacity(0.5),
      //         blurRadius: 12,
      //         spreadRadius: 1,
      //       ),
      //     ],
      //     borderRadius: BorderRadius.circular(24),
      //   ),
      //   child: Row(
      //     mainAxisSize: MainAxisSize.min,
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       MyAnimatedContainer(
      //         name: "Home",
      //         isSelected: true,
      //         animateIcon: AnimateIcons.discount,
      //         onTap: () {
      //           // _animationController
      //           //     .reverse()
      //           //     .then((_) => {
      //           context.goNamed(APP.home.toName);
      //           // });
      //         },
      //         currentRoute: widget.currentRoute,
      //       ),
      //       MyAnimatedContainer(
      //         name: "Products",
      //         isSelected: false,
      //         animateIcon: AnimateIcons.heart,
      //         onTap: () {
      //           // _animationController.reverse().then((_) =>
      //           // {
      //           // });
      //           context.goNamed(APP.home.toName);
      //         },
      //         currentRoute: widget.currentRoute,
      //       ),
      //       MyAnimatedContainer(
      //         name: "Profile",
      //         isSelected: false,
      //         animateIcon: AnimateIcons.smile,
      //         onTap: () {
      //           context.goNamed(APP.profile.toName);
      //         },
      //         currentRoute: widget.currentRoute,
      //       ),
      //       // badges.Badge(
      //       //   showBadge: cartProvider.counter > 0,
      //       //   position: badges.BadgePosition.topEnd(top: -8, end: -5),
      //       //   badgeContent: Text(cartProvider.counter.toString()),
      //       //   badgeStyle: badges.BadgeStyle(
      //       //     shape: badges.BadgeShape.circle,
      //       //     badgeColor: Colors.red,
      //       //     padding: const EdgeInsets.all(4),
      //       //     borderRadius: BorderRadius.circular(4),
      //       //     // borderSide: BorderSide(color: Colors.white, width: 2),
      //       //     // borderGradient: badges.BadgeGradient.linear(
      //       //     //     colors: [Colors.red, Colors.black]),
      //       //     // badgeGradient: badges.BadgeGradient.linear(
      //       //     //   colors: [Colors.yellow, Colors.redAccent],
      //       //     //   begin: Alignment.topCenter,
      //       //     //   end: Alignment.bottomCenter,
      //       //     // ),
      //       //     elevation: 0,
      //       //   ),
      //       //   child: MyAnimatedContainer(
      //       //     name: "Cart",
      //       //     isSelected: false,
      //       //     animateIcon: AnimateIcons.paid,
      //       //     onTap: () {
      //       //       context.goNamed(APP_PAGE.cart.toName);
      //       //     },
      //       //     currentRoute: widget.currentRoute,
      //       //   ),
      //       // ),
      //       // if (widget.currentRoute.toLowerCase().compareTo("home") == 0 ||
      //       //     widget.currentRoute.toLowerCase().compareTo("products") ==
      //       //         0 ||
      //       //     widget.currentRoute.toLowerCase().compareTo("cart") == 0)
      //       //   MyAnimatedContainer(
      //       //     name: "search",
      //       //     animateIcon: AnimateIcons.zoom,
      //       //     isSelected: false,
      //       //     onTap: () {
      //       //       setState(() {
      //       //         isSearchBarVisible = !isSearchBarVisible;
      //       //       });
      //       //       // _showBottm(context);
      //       //     },
      //       //     currentRoute: 'currentRoute',
      //       //   )
      //     ],
      //   ),

      // ),
      // ),
    );
  }
}
