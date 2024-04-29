
import 'package:get/get.dart';

class AuthException implements Exception {
  final String message;

  AuthException(this.message);

  @override
  String toString() => 'AuthException: $message';
}

class CredentialException extends AuthException {
  CredentialException() : super("invalid_username_or_password".tr);
}

class PasswordNotValidException extends AuthException {
  PasswordNotValidException() : super("incorrect_password".tr);
}
