class ServerException implements Exception {
  final String message;

  ServerException(this.message);

  @override
  String toString() => 'Server Error: $message';
}

class NoInternetException extends ServerException {
  NoInternetException() : super("No Internet Connection");
}

class ServerNotRespondingException extends ServerException {
  ServerNotRespondingException() : super("Server is not responding");
}
