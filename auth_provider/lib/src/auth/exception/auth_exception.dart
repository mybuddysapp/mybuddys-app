import 'package:get/get.dart';

class AuthException implements Exception {
  final String message;

  AuthException(this.message);

  @override
  String toString() => 'Error: $message';
}

class EmailAuthException extends AuthException {
  EmailAuthException(super.message);
}

class CredentialException extends AuthException {
  CredentialException() : super("invalid_username_or_password".tr);
}

class PasswordAuthException extends AuthException {
  PasswordAuthException(super.message);
}
