import 'package:approve_payment_flow/core/di/dependency_injection.dart';
import 'package:approve_payment_flow/core/storage/key_value_storage.dart';
import 'package:approve_payment_flow/core/storage/secure_key_value_storage.dart';

void registerLocalStoreModule() {
  getIt.registerLazySingleton<KeyValueStorage>(
    () => const SecureKeyValueStorage(),
  );
}
