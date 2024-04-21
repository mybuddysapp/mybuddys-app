import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../auth_provider.dart';
import '../consts.dart';

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

  Future<String?> login(String email, String password) async {
    try {
      final response = await _supabaseClient.auth
          .signInWithPassword(email: email, password: password);
      if (response.user != null && response.session != null) {
        user.value = response.user;
        session.value = response.session;
        update();
        return null;
      } else {
        return "server not responding";
      }
    } on AuthException catch (e) {
      // Handle error
      debugPrint("Error signing in: $e");
      user.value = null;
      session.value = null;
      update();
      return e.message.toString();
    } catch (e) {
      // Handle error
      debugPrint("Error signing in: $e");
      user.value = null;
      session.value = null;
      update();
      return e.toString();
    }
  }

  Future<String?> register(String email, String password) async {
    try {
      print("Registering user"
          "email: $email"
          "password: $password");
      final response =
          await _supabaseClient.auth.signUp(email: email, password: password);
      if (response.user != null && response.session != null) {
        user.value = response.user;
        session.value = response.session;
        return null;
      } else {
        return "server not responding";
      }
      update();
    } on AuthException catch (e) {
      // Handle error
      debugPrint("Error signing up: $e");
      user.value = null;
      session.value = null;
      update();
      return e.message.toString();
    } catch (e) {
      debugPrint("Error signing up: $e");
      user.value = null;
      session.value = null;
      update();
      return e.toString();
    }
  }

  Future<void> logout() async {
    await signOut();
  }

  Future<String?> signOut() async {
    try {
      await _supabaseClient.auth.signOut();
      user.value = null;
      session.value = null;
      update();
      return null;
    } on AuthException catch (e) {
      // Handle error
      debugPrint("Error signing up: $e");
      user.value = null;
      session.value = null;
      update();
      return e.message.toString();
    } catch (e) {
      // Handle error
      debugPrint("Error signing out: $e");
      return e.toString();
    }
  }

  Future<String?> forgetPassword(String email) async {
    try {
      await _supabaseClient.auth.resetPasswordForEmail(email);
      return null;
    } on AuthException catch (e) {
      // Handle error
      debugPrint("Error signing up: $e");
      user.value = null;
      session.value = null;
      update();
      return e.message.toString();
    } catch (e) {
      // Handle error
      debugPrint("Error resetting password: $e");
      return e.toString();
    }
  }

  Future<void> googleSignIn() async {
    /// TODO: update the Web client ID with your own.
    ///
    /// Web Client ID that you registered with Google Cloud.
    const webClientId =
        '410853899126-08kp7cmr16bnf77mm3ov172kut1l106v.apps.googleusercontent.com';

    /// TODO: update the iOS client ID with your own.
    ///
    /// iOS Client ID that you registered with Google Cloud.
    const iosClientId =
        '410853899126-ntqs7q26a6tgdojvv0lc3bereofhh48d.apps.googleusercontent.com';

    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: clientID(),
      serverClientId: GOOGLE_CLIENT_ID_WEB,
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

    final response = await supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );

    if (response.user != null || response.session != null) {
      user.value = response.user;
      session.value = response.session;
    }
  }
}
