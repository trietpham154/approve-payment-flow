import 'package:dio/dio.dart';
import 'package:approve_payment_flow/core/di/dependency_injection.dart';
import 'package:approve_payment_flow/core/network/dio_factory.dart';

void registerNetworkModule() {
  getIt.registerLazySingleton<Dio>(
    () => DioFactory.create(logger: getIt()),
  );
}
