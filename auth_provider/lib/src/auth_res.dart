import 'package:auth_provider/auth_provider.dart';

enum Status { success, error }

abstract class Response {
  final Status status;
  final Object? data;

  Response(this.status, this.data);
}

class SuccessResponse implements Response {
  @override
  final Status status = Status.success;
  @override
  final AuthResponse? data;

  SuccessResponse(this.data);
}

class ErrorResponse implements Response {
  @override
  final Status status = Status.error;
  @override
  final String data;

  ErrorResponse(this.data);
}

class ExceptionResponse implements Response {
  @override
  final Status status = Status.error;
  @override
  final AuthException data;

  ExceptionResponse(this.data);
}