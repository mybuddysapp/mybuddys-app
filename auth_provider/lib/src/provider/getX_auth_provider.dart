import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../auth_provider.dart';


class AuthController extends GetxController {
  final SupabaseClient _supabaseClient;

  AuthController(this._supabaseClient);

  Rx<User?> user = Rx<User?>(null);
  Rx<Session?> session = Rxn<Session>(null);

  bool get isAuthenticated => user.value != null;

  String? get username => user.value?.email;

  @override
  void onInit() {
    super.onInit();

    if (_supabaseClient.auth.currentSession != null) {
      user.value = _supabaseClient.auth.currentUser;
      session.value = _supabaseClient.auth.currentSession;
    } else {
      user.value = null;
      session.value = null;
    }
    // _supabaseClient.auth.onAuthStateChange.listen((authState) {
    //   if (authState.event == AuthChangeEvent.signedIn) {
    //     user.value = authState.session?.user;
    //     session.value = authState.session;
    //   } else {
    //     user.value = null;
    //   }
    // }, onError: (error) {
    //   // Handle error
    //   debugPrint("Error in onAuthStateChange: $error");
    //   user.value = null; // Set user value to null on error
    // }, onDone: () {
    //   // Handle completion
    //   debugPrint("Auth state change stream has completed");
    // });
  }

  void handleAuthStateChange() {
    _supabaseClient.auth.onAuthStateChange.listen((authState) {
      if (authState.event == AuthChangeEvent.signedIn) {
        user.value = authState.session?.user;
        session.value = authState.session;
      } else {
        user.value = null;
        session.value = null;
      }
    }, onError: (error) {
      // Handle error
      debugPrint("Error in onAuthStateChange: $error");
      user.value = null; // Set user value to null on error
    }, onDone: () {
      // Handle completion
      debugPrint("Auth state change stream has completed");
    });
  }

  Future<void> login(String email, String password) async {
    try {
      final response = await _supabaseClient.auth
          .signInWithPassword(email: email, password: password);
      if (response.user != null || response.session != null) {
        user.value = response.user;
        session.value = response.session;
        update();
      }
    } catch (e) {
      // Handle error
      debugPrint("Error signing in: $e");
      user.value = null;
      session.value = null;
      update();
    }
  }

  Future<void> register(String email, String password) async {
    try {
      final response =
          await _supabaseClient.auth.signUp(email: email, password: password);
      if (response.user != null || response.session != null) {
        user.value = response.user;
        session.value = response.session;
      }
      update();
    } catch (e) {
      // Handle error
      debugPrint("Error signing up: $e");
      user.value = null;
      session.value = null;
      update();
    }
  }

  Future<void> logout() async {
    await signOut();
  }

  Future<void> signOut() async {
    try {
      await _supabaseClient.auth.signOut();
      user.value = null;
      session.value = null;
      update();
    } catch (e) {
      // Handle error
      debugPrint("Error signing out: $e");
    }
  }

  Future<void> forgetPassword(String email) async {
    try {
      await _supabaseClient.auth.resetPasswordForEmail(email);
    } catch (e) {
      // Handle error
      debugPrint("Error resetting password: $e");
    }
  }
  Future<void> _nativeGoogleSignIn() async {
    /// TODO: update the Web client ID with your own.
    ///
    /// Web Client ID that you registered with Google Cloud.
    const webClientId = 'my-web.apps.googleusercontent.com';

    /// TODO: update the iOS client ID with your own.
    ///
    /// iOS Client ID that you registered with Google Cloud.
    const iosClientId = 'my-ios.apps.googleusercontent.com';

    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: iosClientId,
      serverClientId: webClientId,
    );
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      throw 'No ID Token found.';
    }

    await supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }

  Future<void> googleSignIn() async {
    try {
      // final response = await _supabaseClient.auth.
      //   Provider.google,
      //   redirectTo: '/',
      // );
      // if (response.user != null || response.session != null) {
      //   user.value = response.user;
      //   session.value = response.session;
      // }
      // update();
    } catch (e) {
      // Handle error
      debugPrint("Error signing in with Google: $e");
      user.value = null;
      session.value = null;
      update();
    }
  }
}