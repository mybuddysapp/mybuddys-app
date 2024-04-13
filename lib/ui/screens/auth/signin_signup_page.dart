import 'package:auth_provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mybuddys/algo/routes/route_config.dart';
import 'package:mybuddys/extensions/build_context.dart';
import 'package:mybuddys/extensions/connection_state.dart';

class SignInSignUpPage extends HookConsumerWidget {
  const SignInSignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController(text: '');
    final passwordController = useTextEditingController(text: '');
    final login = useState<Future<void>?>(null);
    final loginSnap = useFuture(login.value);
    final signup = useState<Future<void>?>(null);
    final signupSnap = useFuture(signup.value);
    // final auth = ref.watch(authProvider);

    //auth.isAuthenticated();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: context.height * 0.24),
            Text('Login', style: context.textTheme.headlineMedium),
            const SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: loginSnap.isWaiting
                  ? null
                  : () async {
                      login.value = ref.read(authProvider.notifier).login(
                            emailController.text,
                            passwordController.text,
                          );
                      context.go(APP.home.toName);
                    },
              child: BtnChild(
                loading: loginSnap.isWaiting,
                child: const Text('Login Here'),
              ),
            ),
            ElevatedButton(
              onPressed: signupSnap.isWaiting
                  ? null
                  : () async {
                      signup.value = ref.read(authProvider.notifier).signUp(
                            emailController.text,
                            passwordController.text,
                          );
                      context.go(APP.home.toName);
                    },
              child: BtnChild(
                loading: loginSnap.isWaiting,
                child: const Text('Sign Up Here'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BtnChild extends StatelessWidget {
  const BtnChild({
    super.key,
    required this.loading,
    this.color,
    this.size = 14,
    required this.child,
  });

  final bool loading;
  final Widget child;
  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(child: child),
        if (loading)
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: size,
              height: size,
              child: const CircularProgressIndicator(
                strokeWidth: 1,
              ),
            ),
          ),
      ],
    );
  }
}
// import 'package:auth_provider/auth_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
//
// // import 'package:go_router/go_router.dart';
// // import 'package:myhomies/main.dart';
// // import 'package:myhomies/pages/mfa/verify_page.dart';
// // import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_login/flutter_login.dart';
// import 'package:go_router/go_router.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:mybuddys/extensions/connection_state.dart';
//
// import 'package:provider/provider.dart';
//
// import 'package:mybuddys/algo/routes/route_config.dart';
//
// export 'package:mybuddys/ui/screens/auth/signin_signup_page.dart';
//
// class SignInSignUpPage extends HookConsumerWidget {
//   static const route = '/auth/login';
//
//   const SignInSignUpPage({super.key});
//
//   // late final Provider<UserRepository> provider;
//   //
//   //  @override
//   //  void initState() {
//   //    super.initState();
//   //     provider = Provider.of<UserRepository>(context, listen: false);
//   //  }
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final emailController = TextEditingController();
//     final passwordController = TextEditingController();
//
//     final login = useState<Future<void>?>(null);
//     final loginSnap = useFuture(login.value);
//     final auth = ref.watch(authProvider);
//
//     // AuthProvider provider = Provider.of<AuthProvider>(context);
//     return FlutterLogin(
//       title: 'MyBuddys',
//       // logo: const AssetImage('assets/images/ecorp-lightblue.png'),
//       onLogin: (data) async {
//         final email = data.name.trim(); // Get email from LoginData
//         final password = data.password.trim(); // Get password from LoginData
//         // var res = await provider.signIn(email,
//         //     password); // Call signIn method from UserRepository implementation
//         // loginSnap.isWaiting
//         //     ? null
//         //     : () async {
//         //   login.value = ref.read(authRepositoryProvider.notifier).login(
//         //     emailController.text,
//         //     passwordController.text,
//         //   );
//         // }
//         // ,
//
//         debugPrint("-----------------------" + loginSnap.toString());
//
//         AsyncValue res = ref.watch(authProvider.notifier as ProviderListenable<AsyncValue>);
//         res.value.login(
//               emailController.text,
//               passwordController.text,
//             );
//         debugPrint('*********************** Login successful ::: ' +
//             login.value.toString());
//         return login.value.toString();
//
//         // if (loginSnap.isDone) {
//         //   login.value = ref.read(authProvider.notifier).login(
//         //     emailController.text,
//         //     passwordController.text,
//         //   );
//         //   return null;
//         // }
//
//         // ref
//         //     .read(authRepositoryProvider)
//         //     .signIn(email: email, password: password);
//
//         // If login is successful, return a success message
//         // if (res?.status == Status.success) {
//         // // context.go(APP_PAGE.home.toName);
//         // return null;
//         // } else {
//         // return "Login Failed : ${res!.data.toString()}";
//         // }
//       },
//       onSignup: (data) {
//         final email = data.name?.trim(); // Get email from LoginData
//         final password = data.password?.trim(); // Get password from LoginData
//         // ref
//         //     .read(authProvider)
//         //     .signUp(email: email, password: password);
//         return null;
//       },
//       onSubmitAnimationCompleted: () {
//         context.go(APP.home.toName);
//         // Navigator.of(context).pushReplacement(MaterialPageRoute(
//         //   builder: (context) => const Home(),
//         // ));
//       },
//       onRecoverPassword: _recoverPassword,
//     );
//   }
//
//   Future<String?> _loginUser(LoginData data) async {
//     // try {
//     //   final email = data.name.trim(); // Get email from LoginData
//     //   final password = data.password.trim(); // Get password from LoginData
//     //   var res = await provider.signIn(email,
//     // password); // Call signIn method from UserRepository implementation
//     //
//     // // If login is successful, return a success message
//     //
//     // print('Login successful' + res.toString());
//     //
//     // return "Login successful";
//     // } catch (error) {
//     // // If an error occurs during login, show a SnackBar with the error message
//     //
//     // return null; // Return null to indicate that login failed
//     // }
//   }
//
//   Future<String?> _signupUser(SignupData data) async {
//     // try {
//     //   // Call the signUp method from your UserRepository implementation
//     //   await userRL.signUp(data.name!, data.password!);
//     //   return 'User registration successful'; // Return a success message if registration is successful
//     // } catch (error) {
//     //   print('User registration error: $error'); // Print the error message
//     //   return null; // Return null to indicate that registration failed
//     // }
//   }
//
//   Future<String?>? _recoverPassword(String data) {}
// }
// //
// // import 'package:auth_provider/auth_provider.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_hooks/flutter_hooks.dart';
// // import 'package:hooks_riverpod/hooks_riverpod.dart';
// // import 'package:mybuddys/extensions/connection_state.dart';
// //
// // class SignInSignUpPage extends HookConsumerWidget {
// //   const SignInSignUpPage({super.key});
// //
// //   @override
// //   Widget build(BuildContext context, WidgetRef ref) {
// //     final emailController = useTextEditingController(text: '');
// //     final passwordController = useTextEditingController(text: '');
// //     final login = useState<Future<void>?>(null);
// //     final loginSnap = useFuture(login.value);
// //     final auth = ref.watch(authProvider);
// //
// //     return Scaffold(
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: <Widget>[
// //             const Text('Login'),
// //             const SizedBox(height: 20),
// //             TextField(
// //               controller: emailController,
// //               decoration: const InputDecoration(
// //                 labelText: 'Email',
// //               ),
// //             ),
// //             TextField(
// //               controller: passwordController,
// //               decoration: const InputDecoration(
// //                 labelText: 'Password',
// //               ),
// //               obscureText: true,
// //             ),
// //             const SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: loginSnap.isWaiting
// //                   ? null
// //                   : () async {
// //                       login.value = ref.read(authProvider.notifier).login(
// //                             emailController.text,
// //                             passwordController.text,
// //                           );
// //                       debugPrint('*********************** Login successful ::: '+login.value.toString());
// //                       return login.value;
// //                     },
// //               child: BtnChild(
// //                 loading: loginSnap.isWaiting,
// //                 child: const Text('Login'),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // class BtnChild extends StatelessWidget {
// //   const BtnChild({
// //     super.key,
// //     required this.loading,
// //     this.color,
// //     this.size = 14,
// //     required this.child,
// //   });
// //
// //   final bool loading;
// //   final Widget child;
// //   final Color? color;
// //   final double size;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Stack(
// //       children: [
// //         Center(child: child),
// //         if (loading)
// //           Align(
// //             alignment: Alignment.centerRight,
// //             child: SizedBox(
// //               width: size,
// //               height: size,
// //               child: const CircularProgressIndicator(
// //                 strokeWidth: 1,
// //               ),
// //             ),
// //           ),
// //       ],
// //     );
// //   }
// // }
