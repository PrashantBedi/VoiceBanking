import "package:flutter_secure_storage/flutter_secure_storage.dart";

import "secure_storage.dart";
import "storage.dart";
import "local_storage.dart";

class StorageFactory {
  static Storage secureStorage() => SecureStorage(new FlutterSecureStorage());

  static Storage localStorage(String boxName) => LocalStorage(boxName);
}
