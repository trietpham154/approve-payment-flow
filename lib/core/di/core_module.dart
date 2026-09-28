import 'package:approve_payment_flow/core/di/dependency_injection.dart';
import 'package:approve_payment_flow/core/logging/logger.dart';

void registerCoreModule() {
  getIt.registerLazySingleton<Logger>(() => const AppLogger());
}
