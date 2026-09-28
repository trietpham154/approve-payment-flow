import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:approve_payment_flow/core/logging/logger.dart';

class RedactingLogInterceptor extends Interceptor {
  final Logger _logger;

  static const _sensitiveKeys = {
    'password',
    'authorization',
    'access_token',
    'refresh_token',
    'token',
    'session',
    'apikey',
    'api_key',
    'cvv',
    'cvc',
    'pin',
    'card_number',
    'account_number',
    'otp',
  };

  const RedactingLogInterceptor(this._logger);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final redactedHeaders = _redactMap(options.headers);
    final redactedBody = _redactData(options.data);
    _logger.d(
      'Network',
      '--> ${options.method} ${options.uri}\nHeaders: $redactedHeaders\nBody: $redactedBody',
    );
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final redactedHeaders = _redactMap(response.headers.map);
    final redactedBody = _redactData(response.data);
    _logger.d(
      'Network',
      '<-- ${response.statusCode} ${response.requestOptions.uri}\nHeaders: $redactedHeaders\nBody: $redactedBody',
    );
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logger.e(
      'Network',
      '<-- ERROR ${err.response?.statusCode} ${err.requestOptions.uri}: ${err.message}',
    );
    handler.next(err);
  }

  Map<String, dynamic> _redactMap(Map<dynamic, dynamic> map) {
    final result = <String, dynamic>{};
    map.forEach((key, value) {
      final keyString = key.toString();
      if (_sensitiveKeys.contains(keyString.toLowerCase())) {
        result[keyString] = '[REDACTED]';
      } else if (value is Map) {
        result[keyString] = _redactMap(value);
      } else if (value is List) {
        result[keyString] = value.map(_redactValue).toList();
      } else {
        result[keyString] = value;
      }
    });
    return result;
  }

  dynamic _redactData(dynamic data) {
    if (data == null) return null;
    if (data is Map) {
      return _redactMap(data);
    }
    if (data is List) {
      return data.map(_redactValue).toList();
    }
    if (data is String) {
      try {
        final decoded = jsonDecode(data);
        if (decoded is Map || decoded is List) {
          return jsonEncode(_redactData(decoded));
        }
      } catch (_) {}
    }
    return data;
  }

  dynamic _redactValue(dynamic value) {
    if (value is Map) return _redactMap(value);
    if (value is List) return value.map(_redactValue).toList();
    return value;
  }
}
