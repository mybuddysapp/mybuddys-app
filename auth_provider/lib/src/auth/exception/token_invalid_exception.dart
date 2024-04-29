import 'auth_exception.dart';

class TokenInvalidException extends AuthException {
  TokenInvalidException() : super('Token is invalid');
}