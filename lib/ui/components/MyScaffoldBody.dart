// import 'package:flutter/material.dart';
//
// import 'MyBottomNavigationBar.dart';
//
// class MyScaffoldBody extends StatefulWidget {
//   final String currentRoute;
//   final Widget Function(BuildContext context, ScrollController controller) body;
//
//   const MyScaffoldBody(
//       {super.key, required this.currentRoute, required this.body});
//
//   @override
//   State<MyScaffoldBody> createState() => _MyScaffoldBodyState();
// }
//
// class _MyScaffoldBodyState extends State<MyScaffoldBody> {
//   final double _bottom = 35;
//   bool isSearchBarVisible = false;
//
//   // FocusNode focusNode = FocusNode();
//   //
//   // onScrollUp() {
//   //   setState(() {
//   //     isSearchBarVisible = !isSearchBarVisible;
//   //   });
//   //   isSearchBarVisible ? showKeyboard() : dismissKeyboard();
//   //
//   //   // setState(() {
//   //   //   _bottom = MediaQuery.of(context).size.height;
//   //   // });
//   //   // showSuccessNotification(context, "this is drag down");
//   // }
//   //
//   // void showKeyboard() {
//   //   focusNode.requestFocus();
//   // }
//   //
//   // void dismissKeyboard() {
//   //   focusNode.unfocus();
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: widget.body(context, ScrollController()),
//       backgroundColor: const Color(0xFF4A4A58),
//       bottomNavigationBar: MyBottomNavigationBar(
//         currentRoute: widget.currentRoute,
//         controller: ScrollController(),
//       ),
//     );
//   }
//
//   // @override
//   // Widget build(BuildContext context) {
//   //   return BottomBar(
//   //     fit: StackFit.expand,
//   //     width: MediaQuery.of(context).size.width * 0.92,
//   //     // start: 0,
//   //     // end: 2,
//   //     offset: _bottom,
//   //     start: 6,
//   //     end: 0,
//   //     // bottom: 35,
//   //     barAlignment: Alignment.bottomCenter,
//   //     reverse: false,
//   //     scrollOpposite: false,
//   //     // barColor: Colors.transparent,
//   //     barColor: const Color(0xFF4A4A58),
//   //     borderRadius: BorderRadius.circular(30),
//   //     // body: (context, controller) => InfiniteListPage(
//   //     //   controller: controller, color: Colors.blueAccent),
//   //     body: widget.body,
//   //     duration: const Duration(seconds: 1),
//   //     curve: Curves.decelerate,
//   //     showIcon: true,
//   //     icon: (width, height) => Center(
//   //       child: IconButton(
//   //         padding: EdgeInsets.zero,
//   //         onPressed: () {},
//   //         icon: Icon(
//   //           Icons.arrow_upward_rounded,
//   //           color: Colors.red,
//   //           size: width,
//   //         ),
//   //       ),
//   //     ),
//   //     child: MyBottomNavigationBar(
//   //       currentRoute: widget.currentRoute,
//   //     ),
//   //   );
//   // }
// }
