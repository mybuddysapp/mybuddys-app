import 'package:auth_provider/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mybuddys/algo/model/event/event.dart';
import 'package:mybuddys/ui/screens/calendar/CalendarPage.dart';
import 'package:mybuddys/ui/screens/event/events.dart';

import 'package:mybuddys/ui/screens/error/error_page.dart';
import 'package:mybuddys/ui/screens/games/games.dart';
import 'package:mybuddys/ui/screens/home/home_page.dart';
import 'package:mybuddys/ui/screens/splash/splash_page.dart';

import 'package:mybuddys/ui/screens/auth/signin_signup_page.dart';

import '../../ui/screens/event/event.dart';

enum APP {
  splash,
  login,
  signUp,
  settings,
  profile,
  home,
  activitys,
  calendar,
  activity,
  events,
  event,
  players,
  player,
  error,
  onBoarding,
  forgotPassword,
  verify,
}

extension AppPageExtension on APP {
  String get toPath {
    switch (this) {
      case APP.home:
        return "/";
      case APP.login:
        return "/login";
      case APP.signUp:
        return "/signup";
      case APP.activity:
        return "/games";
      case APP.forgotPassword:
        return "/forgot-password";
      case APP.verify:
        return "/verify";
      case APP.splash:
        return "/splash";
      case APP.error:
        return "/error";
      case APP.onBoarding:
        return "/start";
      case APP.settings:
        return "/settings";
      case APP.profile:
        return "/profile";
      case APP.events:
        return "/events";
      case APP.event:
        return "/event";
      case APP.calendar:
        return "/calendar";

      default:
        return "/";
    }
  }

  String get toName {
    switch (this) {
      case APP.home:
        return "home";
      case APP.login:
        return "login";
      case APP.signUp:
        return "signup";
      case APP.activity:
        return "activity";
      case APP.events:
        return "events";
      case APP.event:
        return "event";
      case APP.splash:
        return "SPLASH";
      case APP.error:
        return "ERROR";
      case APP.onBoarding:
        return "START";
      case APP.settings:
        return "SETTINGS";
      case APP.profile:
        return "PROFILE";
      case APP.forgotPassword:
        return "FORGOT_PASSWORD";
      case APP.verify:
        return "VERIFY";
      case APP.calendar:
        return "CALENDAR";
      default:
        return "HOME";
    }
  }

  String get toTitle {
    switch (this) {
      case APP.home:
        return "MyBuddys";
      case APP.login:
        return "MyBuddys Log In";
      case APP.signUp:
        return "MyBuddys Sign Up";
      case APP.splash:
        return "MyBuddys Splash";
      case APP.error:
        return "MyBuddys Error";
      case APP.onBoarding:
        return "Welcome to MyBuddys";
      case APP.events:
        return "Events";
      case APP.settings:
        return "MyBuddys Settings";
      case APP.profile:
        return "MyBuddys Profile";
      case APP.forgotPassword:
        return "MyBuddys Forgot Password";
      case APP.verify:
        return "MyBuddys Verify";
      case APP.calendar:
        return "MyBuddys Calendar";
      default:
        return "MyBuddys";
    }
  }
}

extension GoRouterExtension on BuildContext {
  Future<bool> goBack() async {
    final canPop = Navigator.of(this).canPop();
    if (canPop) {
      Navigator.of(this).pop();
    }
    return canPop;
  }
}

final routerProvider = Provider((ref) {
  return _routeConfig(redirect: (context, state) {
    final auth = ref.watch(authProvider);
    final isAuthenticated = !auth.isEmpty;

    final loginLocation = state.namedLocation(APP.login.toName);
    if (!isAuthenticated) {
      return loginLocation;
    }
    return null;
  });
});

GoRouter _routeConfig({GoRouterRedirect? redirect}) => GoRouter(
      initialLocation: APP.home.toPath,
      redirect: redirect,
      routes: [
        GoRoute(
          path: APP.home.toPath,
          name: APP.home.toName,
          builder: (context, state) => Home(),
          // redirect: (context, state) {
          //   if (AuthProvider().isAuthenticated) {
          //     return APP.home.toPath;
          //   } else {
          //     return APP.login.toPath;
          //   }
          // },
        ),
        // GoRoute(
        //   path: APP.activity.toPath,
        //   name: APP.activity.toName,
        //   builder: (context, state) => const GamesScreen(),
        // ),
        // GoRoute(
        //   path: 'auth',
        //   name: 'AUTH',
        //   routes: <GoRoute>[

        GoRoute(
          path: APP.signUp.toPath,
          name: APP.signUp.toName,
          builder: (context, state) => SignInSignUpPage(),
        ),
        GoRoute(
          path: APP.login.toPath,
          name: APP.login.toName,
          builder: (context, state) => SignInSignUpPage(),
        ),
        GoRoute(
          path: APP.splash.toPath,
          name: APP.splash.toName,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          name: APP.events.toName,
          path: APP.events.toPath,
          builder: (context, state) => const EventsPage(),
        ),
        GoRoute(
          name: APP.calendar.toName,
          path: APP.calendar.toPath,
          builder: (context, state) => CalendarPage(),
        ),
        GoRoute(
          name: APP.event.toName,
          path: APP.event.toPath,
          builder: (context, state) {
            final myObject = state.extra as Event;
            return EventPage(event: myObject);
          },
        )
        // GoRoute(
        //   path: APP.forgotPassword.toPath,
        //   name: APP.forgotPassword.toName,
        //   builder: (context, state) => const ForgotPasswordPage(),
        // ),
        // GoRoute(
        //   path: APP.verify.toPath,
        //   name: APP.verify.toName,
        //   builder: (context, state) => const VerifyPage(),
        // ),
        //   ],
        // ),
        // GoRoute(
        //   path: APP.onBoarding.toPath,
        //   name: APP.onBoarding.toName,
        //   builder: (context, state) => const OnBoardingPage(),
        // ),
        // GoRoute(
        //   path: APP.products.toPath,
        //   name: APP.products.toName,
        //   builder: (context, state) => const ProductsPage(),
        // ),
        // GoRoute(
        //   path: APP.product.toPath,
        //   name: APP.product.toName,
        //   builder: (context, state) {
        //     final myObject = state.extra! as Product;
        //     return ProductPage(product: myObject);
        //   },
        // ),
        // GoRoute(
        //   path: APP.profile.toPath,
        //   name: APP.profile.toName,
        //   builder: (context, state) => const ProfilePage(),
        // ),
        // GoRoute(
        //   path: APP.settings.toPath,
        //   name: APP.settings.toName,
        //   builder: (context, state) => const SettingPage(),
        // ),
        // GoRoute(
        //   path: APP.error.toPath,
        //   name: APP.error.toName,
        //   builder: (context, state) => ErrorPage(error: state.extra.toString()),
        // ),
        // GoRoute(
        //   path: APP.cart.toPath,
        //   name: APP.cart.toName,
        //   builder: (context, state) => const CartPage(),
        // ),
      ],
    );

// class AppRouter {
//   GoRouter Function({GoRouterRedirect? redirect}) get router => _routeConfig;
//
//   // final GoRouter goRouter = GoRouter(
//   GoRouter _routeConfig({GoRouterRedirect? redirect}) => GoRouter(
//     // refreshListenable: appService,
//     initialLocation: APP.home.toPath,
//     routes: [
//       GoRoute(
//         path: APP.home.toPath,
//         name: APP.home.toName,
//         builder: (context, state) => const Home(),
//         // redirect: (context, state) {
//         //   if (AuthProvider().isAuthenticated) {
//         //     return APP.home.toPath;
//         //   } else {
//         //     return APP.login.toPath;
//         //   }
//         // },
//       ),
//       // GoRoute(
//       //   path: APP.activity.toPath,
//       //   name: APP.activity.toName,
//       //   builder: (context, state) => const GamesScreen(),
//       // ),
//       // GoRoute(
//       //   path: 'auth',
//       //   name: 'AUTH',
//       //   routes: <GoRoute>[
//
//       GoRoute(
//         path: APP.signUp.toPath,
//         name: APP.signUp.toName,
//         builder: (context, state) =>  SignInSignUpPage(),
//       ),
//       GoRoute(
//         path: APP.login.toPath,
//         name: APP.login.toName,
//         builder: (context, state) =>  SignInSignUpPage(),
//       ),
//       GoRoute(
//         path: APP.splash.toPath,
//         name: APP.splash.toName,
//         builder: (context, state) => const SplashScreen(),
//       ),
//       GoRoute(
//         name: APP.events.toName,
//         path: APP.events.toPath,
//         builder: (context, state) => const EventsPage(),
//       )
//       // GoRoute(
//       //   path: APP.forgotPassword.toPath,
//       //   name: APP.forgotPassword.toName,
//       //   builder: (context, state) => const ForgotPasswordPage(),
//       // ),
//       // GoRoute(
//       //   path: APP.verify.toPath,
//       //   name: APP.verify.toName,
//       //   builder: (context, state) => const VerifyPage(),
//       // ),
//       //   ],
//       // ),
//       // GoRoute(
//       //   path: APP.onBoarding.toPath,
//       //   name: APP.onBoarding.toName,
//       //   builder: (context, state) => const OnBoardingPage(),
//       // ),
//       // GoRoute(
//       //   path: APP.products.toPath,
//       //   name: APP.products.toName,
//       //   builder: (context, state) => const ProductsPage(),
//       // ),
//       // GoRoute(
//       //   path: APP.product.toPath,
//       //   name: APP.product.toName,
//       //   builder: (context, state) {
//       //     final myObject = state.extra! as Product;
//       //     return ProductPage(product: myObject);
//       //   },
//       // ),
//       // GoRoute(
//       //   path: APP.profile.toPath,
//       //   name: APP.profile.toName,
//       //   builder: (context, state) => const ProfilePage(),
//       // ),
//       // GoRoute(
//       //   path: APP.settings.toPath,
//       //   name: APP.settings.toName,
//       //   builder: (context, state) => const SettingPage(),
//       // ),
//       // GoRoute(
//       //   path: APP.error.toPath,
//       //   name: APP.error.toName,
//       //   builder: (context, state) => ErrorPage(error: state.extra.toString()),
//       // ),
//       // GoRoute(
//       //   path: APP.cart.toPath,
//       //   name: APP.cart.toName,
//       //   builder: (context, state) => const CartPage(),
//       // ),
//     ],
//     redirect: redirect
//     // errorBuilder: (context, state) =>
//     //     ErrorScreen(message: state.error.toString()),
//
//     // redirect: (BuildContext context, GoRouterState state) async {
//
//       // final auth = ref.watch(authProvider);
//
//       // routerProvider.read(context).redirect(context, state);
//       //   final loginLocation = state.namedLocation(APP.login.toName);
//     //   final homeLocation = state.namedLocation(APP.home.toName);
//     //   final splashLocation = state.namedLocation(APP.splash.toName);
//     //   final onboardLocation = state.namedLocation(APP.onBoarding.toName);
//     //   final signUpLocation =
//     //       state.namedLocation(APP.signUp.toName); // Add this line
//     //   final verifyLocation =
//     //       state.namedLocation(APP.verify.toName); // Add this line
//     //   final forgotPasswordLocation =
//     //       state.namedLocation(APP.forgotPassword.toName);
//     //   return null; // Add this line
//     //
//     //   // final isLoggedIn = appService.loginState;
//     //   // final isInitialized = appService.initialized;
//     //   // final isOnboarded = appService.onboarding;
//     //   //
//     //   // final currentPath = state.uri.path;
//     //   //
//     //   // // If not Initialized and not going to Initialized redirect to Splash
//     //   // if (!isInitialized && currentPath != splashLocation) {
//     //   //   return splashLocation;
//     //   //   // If not onboard and not going to onboard redirect to OnBoarding
//     //   // } else
//     //   // if (isInitialized && !isOnboarded && currentPath != onboardLocation) {
//     //   //   return onboardLocation;
//     //   //   // If not logged in and not going to login redirect to Login
//     //   // } else if (isInitialized && isOnboarded && !isLoggedIn &&
//     //   //     currentPath == signUpLocation) { // Allow navigation to signup page
//     //   //   return signUpLocation;
//     //   // } else if (isInitialized && isOnboarded && !isLoggedIn &&
//     //   //     currentPath == verifyLocation) { // Allow navigation to verify page
//     //   //   return verifyLocation;
//     //   // } else if (isInitialized && isOnboarded && !isLoggedIn &&
//     //   //     currentPath != loginLocation) {
//     //   //   return loginLocation;
//     //   // } else if ((isLoggedIn && currentPath == loginLocation) ||
//     //   //     (isInitialized && currentPath == splashLocation) ||
//     //   //     (isOnboarded && currentPath == onboardLocation)) {
//     //   //   return homeLocation;
//     //   // } else {
//     //   //   // Else Don't do anything
//     //   //   return null;
//     //   // }
//     // },
//   );
// }
