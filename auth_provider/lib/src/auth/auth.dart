// import 'dart:developer';
//
// import 'package:auth_provider/src/auth_res.dart';
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'auth_provider_exception.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// final AuthRepositoryProvider = Provider((ref) {
//   return AuthRepository(supabase: Supabase.instance);
// });
//
// // PROVIDER REPOSITORY
// class AuthRepository {
//   final Supabase _supabase;
//
//   AuthRepository({
//     required Supabase supabase,
//   }) : _supabase = supabase;
//
//   // SIGN UP
//   Future<AuthModel> signUp(
//       {required String email, required String password}) async {
//     log('EMAIL $email password $password');
//     try {
//       AuthModel authModel =
//           const AuthModel(uid: '', email: '', password: '', imgUrl: '');
//       final response =
//           await _supabase.client.auth.signUp(email: email, password: password);
//       authModel = AuthModel(
//           uid: response.user!.id, email: email, password: password, imgUrl: '');
//       log('AUTH MODEL $authModel');
//       return authModel;
//     } catch (e) {
//       log('ERROR $e');
//       throw 'Error';
//     }
//   }
//
//   Future<AuthModel> signIn(
//       {required String email, required String password}) async {
//     try {
//       AuthModel authModel =
//           const AuthModel(uid: '', email: '', password: '', imgUrl: '');
//       final response = await _supabase.client.auth
//           .signInWithPassword(email: email, password: password);
//       log('RESPONSE ${response.user}');
//       authModel = AuthModel(
//           uid: response.user!.id, email: email, password: password, imgUrl: '');
//       log('SIGN IN $authModel');
//       return authModel;
//     } catch (e) {
//       log('ERROR SIGN IN $e');
//       throw 'Error';
//     }
//   }
//
//   Future<void> signOut() async {
//     try {
//       _supabase.client.auth.signOut();
//     } catch (e) {
//       log('ERROR SIGN OUT $e');
//       throw 'Error';
//     }
//   }
// }
//
// enum ProviderState {
//   loading,
//   error,
//   success,
// }
//
// // class AuthProvider extends ChangeNotifier {
// //   final supabaseClient = Supabase.instance.client;
// //
// //   ProviderState _state = ProviderState.success;
// //
// //   late User _user;
// //
// //   User get currentUser => _user;
// //
// //   ProviderState get state => _state;
// //
// //   final supabaseProvider = Provider((ref) => Supabase.instance.client);
// //
// //   //
// //   // String? _error;
// //   //
// //   // String? get authError => _error;
// //
// //   Session? _session;
// //
// //   Session? get session => _session;
// //
// //   bool get isAuthenticated => _session != null;
// //
// //   Future<Response?> signIn(String email, String password) async {
// //     try {
// //       _state = ProviderState.loading;
// //       final AuthResponse response = await supabaseClient.auth
// //           .signInWithPassword(email: email, password: password);
// //       if (response.user != null && response.session != null) {
// //         _user = response.user!;
// //         _session = response.session!;
// //         _state = ProviderState.success;
// //         notifyListeners();
// //         return SuccessResponse(response);
// //       }
// //
// //       // debugPrint('Signing in with email: $email and password: $password');
// //       // debugPrint('Res: $response');
// //       return ErrorResponse("Error signing in");
// //     } on AuthException catch (e) {
// //       _state = ProviderState.error;
// //       notifyListeners();
// //       return ErrorResponse(e.message);
// //     }
// //   }
// //
// //   Future<Object> signUp(String email, String password) async {
// //     try {
// //       _state = ProviderState.loading;
// //       final AuthResponse response =
// //           await supabaseClient.auth.signUp(email: email, password: password);
// //       if (response.user != null && response.session != null) {
// //         _user = response.user!;
// //         _session = response.session!;
// //         _state = ProviderState.success;
// //         notifyListeners();
// //         return SuccessResponse(response);
// //       }
// //       debugPrint('Signing up with email: $email and password: $password');
// //       debugPrint('Res: $response');
// //       return ErrorResponse("Error signing up");
// //     } on AuthException catch (e) {
// //       _state = ProviderState.error;
// //       notifyListeners();
// //       return ErrorResponse(e.message);
// //     }
// //   }
// //
// //   Future<void> signOut() async {
// //     try {
// //       _state = ProviderState.loading;
// //       final response = await supabaseClient.auth.signOut();
// //
// //       _session = null;
// //       // _user = null;
// //       _state = ProviderState.success;
// //       notifyListeners();
// //     } catch (e) {
// //       _state = ProviderState.error;
// //       notifyListeners();
// //     }
// //   }
// //
// // // Future<AuthUser?> signUp(String email, String password) async {
// // //   final response = await supabaseClient.auth.signUp(email, password);
// // //
// // //   if (response.error != null) {
// // //     throw AuthProviderException(response.error!.message);
// // //   }
// // //
// // //   final user = response.data?.user;
// // //   if (user != null) {
// // //     SessionManager.setToken(response.data!.accessToken);
// // //     return AuthUser(id: user.id, email: user.email);
// // //   }
// // //
// // //   return null;
// // // }
// // //
// // // Future<void> signOut() async {
// // //   final response = await supabaseClient.auth.signOut();
// // //   if (response.error != null) {
// // //     throw AuthProviderException(response.error!.message);
// // //   }
// // //   SessionManager.clearToken();
// // // }
// // }

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'my_auth_user.dart';

part 'auth.g.dart';

final supabase = Supabase.instance.client;

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  late final StreamSubscription<AuthState> _authStateSubscription;

  @override
  MyAuthUser build() {
    initListener();

    supabase.auth.onAuthStateChange;
    return supabase.auth.currentSession == null
        ? MyAuthUser.empty
        : MyAuthUser.fromSupabaseSession(supabase.auth.currentSession!);
  }

  initListener() {
    _authStateSubscription = supabase.auth.onAuthStateChange.listen((data) {
      state = MyAuthUser.fromSupabaseSession(data.session);
    });
  }

  bool isAuthenticated() {
    return supabase.auth.currentSession != null;
  }

  Session? getSession() {
    return supabase.auth.currentSession;
  }


  Future<String?> login(String email, String password) async {
    try {
      var res=await supabase.auth.signInWithPassword(password: password, email: email);
      debugPrint("Logged in successfully");
      return null;
    } on AuthException catch (er) {
      // print(er.message);
      return er.message;
    } catch (err) {
      return err.toString();
    }
  }

  Future<String?> signUp(String email, String password) async {
    try {
      await supabase.auth.signUp(email: email, password: password);
      return null;
    } on AuthException catch (er) {
      // print(er.message);
      return er.message;
    } catch (err) {
      return err.toString();
    }
  }

  logout() async {
    await supabase.auth.signOut();
  }

  dispose() {
    _authStateSubscription.cancel();
  }
}
