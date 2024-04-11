import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mybuddys/algo/routes/route_config.dart';
import 'package:mybuddys/ui/components/MyBottomNavigationBar.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        final router = ref.watch(routerProvider);
        return MaterialApp.router(
          // scrollBehavior: const EnvelopIndicatorScreen(),
          title: 'MyBuddys',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          // routeInformationParser: GoRouterInformationParser(),
          // builder: (context, widget) {
          //   return Scaffold(
          //     appBar: AppBar(title: Text('My App')),
          //     body: widget,
          //     bottomNavigationBar: MyBottomNavigationBar(
          //       currentRoute: '',
          //       controller: ScrollController(),
          //     ),
          //   );
          // },
        );
      },
    );
  }
}

//@override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         // ChangeNotifierProvider(
//         //   create: (_) => AuthProvider(),
//         // ),
//         // ChangeNotifierProvider(create: (_) => MyBuddysProvider()),
//         // Add this line
//         Provider(
//           create: (_) => AppRouter(),
//         ),
//       ],
//       builder: (context, child) {
//
//         // final router=ref.watch(routerProvider);
//         final GoRouter goRouter =
//             Provider.of<AppRouter>(context, listen: false).router;
//         return Consumer(
//           builder: (_, ref, __) {
//              final router = ref.watch(routerProvider);
//                return MaterialApp.router(
//             title: 'MyBuddys',
//             theme: ThemeData(
//               primarySwatch: Colors.blue,
//             ),
//             routerConfig: goRouter,
//             debugShowCheckedModeBanner: false,
//           );
//
//       },
//     );
//   }
// }
// }
