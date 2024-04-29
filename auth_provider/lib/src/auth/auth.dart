import 'package:auth_provider/src/auth/api.dart';
import 'package:auth_provider/src/auth/service/auth_service.dart';
import 'package:auth_provider/src/auth/token_manager.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();

enum AuthStatus {
  uninitialized,
  authenticated,
  unauthenticated,
  notFound,
}

class AuthAPI extends GetxService {
  // final _isLogged = false.obs;
  late final Rx<AuthStatus> _status = AuthStatus.uninitialized.obs;

  // final _api = Api();
  final _tokenManager = TokenManager();
  final _authService = AuthService(Api().api);

  final _userId = ''.obs;
  final _userEmail = ''.obs;

  String? get userId => _userId.value;

  String? get userEmail => _userEmail.value;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  AuthAPI() {
    _status.listen((isLogged) async {
      if (isLogged == AuthStatus.authenticated) {
        final user = await _authService.getUser();
        _userId.value = user.id;
        _userEmail.value = user.email;
      } else {
        _userId.value = '';
        _userEmail.value = '';
        _tokenManager.removeTokens();
      }
    });
  }

  AuthStatus get status => _status.value;

  Future<void> logOut() async {
    await _authService.logout();
    _status.value = AuthStatus.unauthenticated;
    // _isLogged.value = false;
    // _userId.value = '';
    // _userEmail.value = '';
    // _tokenManager.removeTokens();
  }

  Future<void> login(String email, String password) async {
    try {
      final tokenRes =
          await _authService.login({'email': email, 'password': password});
      final token = tokenRes.access;
      final refreshToken = tokenRes.refresh;
      await _tokenManager.saveToken(token);
      await _tokenManager.saveRefreshToken(refreshToken);

      logger.d(tokenRes.access);
      logger.d(tokenRes.refresh);
      _status.value = AuthStatus.authenticated;
      // Token is cached
    } catch (e) {
      _status.value = AuthStatus.unauthenticated;
      logger.e(e);
    }
  }

  Future<void> register(String email, String password) async {
    try {
      final user =
          await _authService.register({'email': email, 'password': password});
      // _userId.value = user.id;
      // _userEmail.value = user.email;
      // _isLogged.value = true;
    } catch (e) {
      _tokenManager.removeTokens();
      // _userEmail.value = '';
      // _userId.value = '';
      // _isLogged.value = false;
      _status.value = AuthStatus.uninitialized;
      logger.e(e);
    }
  }

  Future<void> checkLoginStatus() async {
    final token = await _tokenManager.getToken();
    if (token != null) {
      _status.value = AuthStatus.authenticated;
    } else {
      _status.value = AuthStatus.unauthenticated;
    }
  }

  Future<void> getMe() async {
    try {
      final user = await _authService.getUser();
      _userId.value = user.id;
      _userEmail.value = user.email;
    } catch (e) {
      _status.value = AuthStatus.uninitialized;
      logger.e(e);
    }
  }

  void _init() {
    checkLoginStatus();
  }
}
