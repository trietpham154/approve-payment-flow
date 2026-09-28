abstract interface class KeyValueStorage {
  Future<String?> getString(String key);
  Future<void> putString(String key, String value);
  Future<void> remove(String key);
}
