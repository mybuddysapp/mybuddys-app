// import 'package:auth_provider/auth_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class GamesScreen extends StatelessWidget {
//   const GamesScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     AuthProvider authProvider =
//         Provider.of<AuthProvider>(context, listen: false);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Games'),
//       ),
//       body: Center(
//         child: authProvider.isAuthenticated
//             ? Text('Authenticated Games')
//             : Text('Non Authenticated Games'),
//       ),
//     );
//   }
// }
