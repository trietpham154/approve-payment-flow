import 'package:dio/dio.dart';

sealed class NetworkException implements Exception {
  final String message;
  final Object? cause;

  const NetworkException(this.message, [this.cause]);

  @override
  String toString() => 'NetworkException: $message';
}

class HttpException extends NetworkException {
  final int statusCode;

  const HttpException(this.statusCode, [Object? cause])
      : super('HTTP error $statusCode', cause);
}

class ConnectivityException extends NetworkException {
  const ConnectivityException([Object? cause])
      : super('Network connectivity error', cause);
}

class SerializationException extends NetworkException {
  const SerializationException([Object? cause])
      : super('Serialization error', cause);
}

class UnknownNetworkException extends NetworkException {
  const UnknownNetworkException([Object? cause])
      : super('Unknown network error', cause);
}

NetworkException mapToDomainException(Object error) {
  if (error is NetworkException) return error;
  if (error is DioException) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
      case DioExceptionType.cancel:
      case DioExceptionType.badCertificate:
        return ConnectivityException(error);
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode ?? 500;
        return HttpException(statusCode, error);
      case DioExceptionType.unknown:
      default:
        return UnknownNetworkException(error);
    }
  }
  if (error is FormatException) {
    return SerializationException(error);
  }
  return UnknownNetworkException(error);
}
