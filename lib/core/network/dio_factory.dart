import 'package:dio/dio.dart';
import 'package:approve_payment_flow/core/logging/logger.dart';
import 'package:approve_payment_flow/core/network/redacting_log_interceptor.dart';

abstract final class DioFactory {
  static const Duration timeout = Duration(seconds: 30);

  static Dio create({required Logger logger}) {
    final dio = Dio(
      BaseOptions(
        connectTimeout: timeout,
        receiveTimeout: timeout,
        sendTimeout: timeout,
      ),
    );
    dio.interceptors.add(RedactingLogInterceptor(logger));
    return dio;
  }
}
