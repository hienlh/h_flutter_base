abstract class IStorage {
  Future<T?> get<T>(String key);
  Future<bool> set<T>(String key, String value);
  Future<T?> delete<T>(String key);
  Future<bool> clear();
}