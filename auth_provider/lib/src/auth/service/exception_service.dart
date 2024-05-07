import 'package:dio/dio.dart';

class ExceptionService {
  // final DioException exception;

  // ExceptionService({required this.exception});

  static errorDecoder(DioExceptionType error) {
    switch (error) {
      case DioExceptionType.connectionError:
        return 'Connection timeout';
      case DioExceptionType.sendTimeout:
        return 'Send timeout';
      case DioExceptionType.receiveTimeout:
        return 'Receive timeout';
      case DioExceptionType.badResponse:
        return 'No account found with that email';
      case DioExceptionType.cancel:
        return 'Request cancelled';
      case DioExceptionType.unknown:
        return 'Other error';
      default:
        return 'Unknown error';
    }
  }

}
