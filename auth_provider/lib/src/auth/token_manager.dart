import 'package:auth_provider/src/auth/exception/token_invalid_exception.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  Future<bool> containsRefreshToken() async {
    try {
      final box = await SharedPreferences.getInstance();
      return box.containsKey(CacheManagerKey.REFRESH_TOKEN.toString());
    } catch (e) {
      return false;
    }
  }

  Future<void> saveToken(String token) async {
    try {
      if (!await isTokenValid(token: token)) {
        throw TokenInvalidException();
      }
      Map<String, dynamic>? decodedToken = JwtDecoder.tryDecode(token);
      if (decodedToken == null) {
        throw TokenInvalidException();
      }
      String userId = decodedToken['user_id'];
      final box = await SharedPreferences.getInstance();
      await box.setString(CacheManagerKey.USER_ID.toString(), userId);
      await box.setString(CacheManagerKey.TOKEN.toString(), token);
    } catch (e) {
      throw TokenInvalidException();
    }
  }

  //to check token validity, if token is expired, return false
  Future<bool> isTokenValid({String? token}) async {
    if (token == null) {
      final box = await SharedPreferences.getInstance();
      final token = box.getString(CacheManagerKey.TOKEN.toString());
      return !JwtDecoder.isExpired(token.toString());
    }
    return !JwtDecoder.isExpired(token);
  }

  //to save refresh token
  Future<void> saveRefreshToken(String token) async {
    try {
      final box = await SharedPreferences.getInstance();
      await box.setString(CacheManagerKey.REFRESH_TOKEN.toString(), token);
    } catch (e) {
      throw TokenInvalidException();
    }
  }

  Future<String?> getToken() async {
    final box = await SharedPreferences.getInstance();
    return box.getString(CacheManagerKey.TOKEN.toString());
  }

  Future<String?> getUserId() async {
    final box = await SharedPreferences.getInstance();
    return box.getString(CacheManagerKey.USER_ID.toString());
  }

  //to get refresh token
  Future<String?> getRefreshToken() async {
    final box = await SharedPreferences.getInstance();
    return box.getString(CacheManagerKey.REFRESH_TOKEN.toString());
  }

  Future<void> removeTokens() async {
    final box = await SharedPreferences.getInstance();
    await box.remove(CacheManagerKey.TOKEN.toString());
    await box.remove(CacheManagerKey.REFRESH_TOKEN.toString());
    await box.remove(CacheManagerKey.USER_ID.toString());
  }
}

enum CacheManagerKey { TOKEN, REFRESH_TOKEN, USER_ID }
