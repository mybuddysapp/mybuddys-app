import 'package:auth_provider/src/auth/api.dart';
import 'package:auth_provider/src/auth/exception/auth_exception.dart';
import 'package:auth_provider/src/auth/service/auth_service.dart';
import 'package:auth_provider/src/auth/token_manager.dart';
import 'package:auth_provider/src/model/register_response_error_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();

enum AuthStatus {
  uninitialized,
  authenticated,
  unauthenticated,
  notFound,
}

/**
 * AuthAPI class
 *
 */
class AuthAPI extends GetxService {
  late final Rx<AuthStatus> _status = AuthStatus.uninitialized.obs;

  final _tokenManager = TokenManager();

  // late final AuthService _authService;
  final AuthService _authService = AuthService(Api().api);

  final _userId = ''.obs;
  final _userEmail = ''.obs;

  String? get userId => _userId.value;

  String? get userEmail => _userEmail.value;

  @override
  void onInit() {
    super.onInit();
    // _initialize();
    //add a listenr to the _userId, if its null then the auth is unauthorized
    _userId.listen((userId) {
      if (userId.isEmpty) {
        _status.value = AuthStatus.unauthenticated;
      } else {
        _status.value = AuthStatus.authenticated;
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
    _init();
  }

  // Future<void> _initialize() async {
  //   // final baseUrl = Platform.environment['API_AUTH_URL'];
  //   await dotenv.load(fileName: ".env");
  //   final baseUrl = dotenv.env['API_AUTH_URL'] ?? null;
  //   assert(baseUrl == null, 'API_URL is not set in the environment file');
  //   _authService = AuthService(Api().api, baseUrl: baseUrl!);
  // }

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
    _status.value = AuthStatus.unauthenticated;
    await _authService.logout();
  }

  Future<void> login(String email, String password) async {
    final tokenRes =
        await _authService.login({'email': email, 'password': password});
    final token = tokenRes.access;
    final refreshToken = tokenRes.refresh;
    await _tokenManager.saveToken(token);
    await _tokenManager.saveRefreshToken(refreshToken);

    _status.value = AuthStatus.authenticated;
  }

  Future<void> register(String email, String password) async {
    try {
      await _authService.register({'email': email, 'password': password});
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        var errors = RegisterResponseErrorModel.fromJson(e.response?.data);

        String errorMessages = '';
        if (errors.email != null) {
          errors.email?.forEach((element) {
            errorMessages += '$element\n';
          });

          throw EmailAuthException(errorMessages);
        }
        if (errors.password != null) {
          errors.password?.forEach((element) {
            errorMessages += '$element\n';
          });

          throw PasswordAuthException(errorMessages);
        }
      }
      rethrow;
    }
    login(email, password);
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
