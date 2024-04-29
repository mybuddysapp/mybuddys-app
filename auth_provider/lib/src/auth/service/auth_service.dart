import 'package:auth_provider/src/auth/user/my_auth_user.dart';
import 'package:auth_provider/src/consts.dart';
import 'package:auth_provider/src/model/token_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_service.g.dart';

@RestApi(baseUrl: AUTH_API_URL)
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST('/jwt/create/')
  Future<TokenResponseModel> login(@Body() Map<String, dynamic> body);

  @GET('/users/me/')
  Future<MyAuthUser> getUser();

  @POST('/users/')
  Future<MyAuthUser> register(@Body() Map<String, dynamic> body);

  @POST('/users/activation/')
  Future<dynamic> activateUser(@Body() Map<String, dynamic> body);

  @POST('/users/activation/')
  Future<dynamic> resendActivationMail(@Body() Map<String, dynamic> body);


  /**
   * Change email
   * {
      "new_email":"sixx@one.com",
      "re_new_email":"sixx@one.com",
      "current_password":"qsdfgh12"
      }
   */
  @POST('/users/set_email/')
  Future<dynamic> changeEmail(@Body() Map<String, dynamic> body);

/**
   * Change password
   * {
      "new_password":"qsdfgh12",
      "re_new_password":"qsdfgh12",
      "current_password":"qsdfgh12"
      }
   */
  @POST('/users/set_password/')
  Future<dynamic> changePassword(@Body() Map<String, dynamic> body);

  @POST('/logout/')
  Future<void> logout();
}