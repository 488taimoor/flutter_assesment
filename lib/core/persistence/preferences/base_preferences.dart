import 'package:get_storage/get_storage.dart';

abstract class BasePreferences {
  final _storage = GetStorage();

  void remove(String key) => _storage.remove(key);

  void removeAll() => _storage.erase();

  T? retrieve<T>(String key) => _storage.read(key);

  void store<T>(String key, T value) => _storage.write(key, value);
}
