import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:approve_payment_flow/core/storage/key_value_storage.dart';

class SecureKeyValueStorage implements KeyValueStorage {
  final FlutterSecureStorage _storage;

  const SecureKeyValueStorage({
    FlutterSecureStorage storage = const FlutterSecureStorage(),
  }) : _storage = storage;

  @override
  Future<String?> getString(String key) => _storage.read(key: key);

  @override
  Future<void> putString(String key, String value) =>
      _storage.write(key: key, value: value);

  @override
  Future<void> remove(String key) => _storage.delete(key: key);
}
