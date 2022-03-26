part of 'services.dart';

class MemoryStorageService extends GetxService implements IStorage {
  final Map<String, dynamic> _data = {};

  @override
  Future<bool> clear() async {
    _data.clear();
    return true;
  }

  @override
  Future<T?> delete<T>(String key) async {
    final value = await get(key);
    _data.remove(key);
    return value;
  }

  @override
  Future<T?> get<T>(String key) async {
    return !_data.containsKey(key) ? null : _data[key];
  }

  @override
  Future<bool> set<T>(String key, String value) async {
    _data.addAll({key: value});
    return true;
  }
}
