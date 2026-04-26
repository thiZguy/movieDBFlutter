import 'package:dio/dio.dart';

import '../error/exceptions.dart';

AppException mapDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return const TimeoutException();
    case DioExceptionType.connectionError:
      return const NetworkException();
    case DioExceptionType.badResponse:
      final status = e.response?.statusCode;
      final message = _extractMessage(e.response?.data) ?? 'Error del servidor';
      if (status == 401 || status == 403) {
        return UnauthorizedException(message);
      }
      if (status == 404) {
        return NotFoundException(message);
      }
      return ServerException(message, statusCode: status);
    case DioExceptionType.cancel:
      return const UnknownException('Solicitud cancelada');
    case DioExceptionType.badCertificate:
    case DioExceptionType.unknown:
      return UnknownException(e.message ?? 'Error desconocido');
  }
}

String? _extractMessage(dynamic data) {
  if (data is Map && data['status_message'] is String) {
    return data['status_message'] as String;
  }
  return null;
}
