class AuthProviderException implements Exception {
  final String message;

  AuthProviderException(this.message);

  @override
  String toString() => 'AuthProviderException: $message';
}
