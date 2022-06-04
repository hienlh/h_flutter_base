abstract class IStorage {
  Future<T?> get<T>(String key);
  Stream<T?> listen<T>(String key);
  Future<bool> set<T>(String key, T value);
  Future<T?> delete<T>(String key);
  Future<bool> clear();
}
