import 'package:auth_provider/auth_provider.dart';
import 'package:auth_provider/src/auth/token_manager.dart';
import 'package:dio/dio.dart';

import '../consts.dart';

class Api {
  final Dio api = Dio();
  TokenManager tokenManager = TokenManager();

  Api() {
    api.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (!options.path.contains('http')) {
            options.path = AUTH_API_URL + options.path;
          }
          options.headers['Content-Type'] = 'application/json';
          options.headers['Authorization'] =
              'Bearer ${await tokenManager.getToken()}';
          return handler.next(options);
        },
        onError: (DioException error, handler) async {
          if ((error.response?.statusCode == 403 &&
              !await tokenManager.isTokenValid())) {
            if (await tokenManager.containsRefreshToken()) {
              if (await refreshToken()) {
                return handler.resolve(await _retry(error.requestOptions));
              }
            }
          }
          logger.e(error);
          if (error.error==DioExceptionType.connectionError) {
            return handler.reject(error);
          }
          return handler.next(error);
        },
      ),
    );
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return api.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  Future<bool> refreshToken() async {
    final refreshToken = await tokenManager.getRefreshToken();
    final response =
        await api.post('/jwt/refresh/', data: {'refresh': refreshToken});

    if (response.statusCode == 200) {
      await tokenManager.saveToken(response.data['access']);
      return true;
    } else {
      // refresh token is wrong
      tokenManager.removeTokens();
      return false;
    }
  }
}
