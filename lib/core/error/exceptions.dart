sealed class AppException implements Exception {
  const AppException(this.message);
  final String message;

  @override
  String toString() => '$runtimeType: $message';
}

class NetworkException extends AppException {
  const NetworkException([super.message = 'Sin conexión a internet']);
}

class TimeoutException extends AppException {
  const TimeoutException([super.message = 'La solicitud tardó demasiado']);
}

class ServerException extends AppException {
  const ServerException(super.message, {this.statusCode});
  final int? statusCode;
}

class NotFoundException extends AppException {
  const NotFoundException([super.message = 'Recurso no encontrado']);
}

class UnauthorizedException extends AppException {
  const UnauthorizedException([super.message = 'API key inválida o ausente']);
}

class UnknownException extends AppException {
  const UnknownException([super.message = 'Error inesperado']);
}
