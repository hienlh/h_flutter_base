part of 'services.dart';

class StorageService extends GetxService implements IStorage {
  late final GetStorage _box;

  Future<StorageService> init() async {
    await GetStorage.init();
    _box = GetStorage();
    return this;
  }

  @override
  Future<bool> clear() async {
    await _box.erase();
    return true;
  }

  @override
  Future<T?> delete<T>(String key) async {
    final value = _box.read(key);
    await _box.remove(key);
    return value;
  }

  @override
  Future<T?> get<T>(String key) async {
    return _box.read(key);
  }

  @override
  Future<bool> set<T>(String key, String value) async {
    await _box.write(key, value);
    return true;
  }
}
