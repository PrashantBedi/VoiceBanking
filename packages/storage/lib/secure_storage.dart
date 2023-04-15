import "package:flutter_secure_storage/flutter_secure_storage.dart";

import "storage.dart";

class SecureStorage implements Storage {
  late final FlutterSecureStorage secureStorage;

  SecureStorage(this.secureStorage);

  @override
  void clear() {
    secureStorage.deleteAll();
  }

  @override
  void deleteItem({required String key}) {
    secureStorage.delete(key: key);
  }

  @override
  Future<Map<String, String>?> getAllItem() async {
    return await secureStorage.readAll();
  }

  @override
  Future<String?> getItem({required String key}) async {
    return await secureStorage.read(key: key);
  }

  @override
  void setItem({required String key, required String value}) {
    secureStorage.write(key: key, value: value);
  }
}
