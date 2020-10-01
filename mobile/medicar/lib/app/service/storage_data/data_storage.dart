import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DataStorage {
  static final DataStorage dataStorage = DataStorage._internal();
  var _storage;

  factory DataStorage() {
    return dataStorage;
  }

  FlutterSecureStorage get storage {
    return _storage != null ? dataStorage : _initializeStorage();
  }

  DataStorage._internal();

  FlutterSecureStorage _initializeStorage() {
    return FlutterSecureStorage();
  }

  saveData(String key, String value) async {
    bool status;
    if (value != null) {
      var store = storage;
      await store.write(key: key, value: value);
      status = true;
    } else {
      status = false;
    }
    return status;
  }

  getData(String key) async {
    String result;
    try {
      result = await storage.read(key: key);
    } catch (e) {
      print('Não existe nada salvo');
    }
    return result;
  }

  deleteSomeData(String key) async {
    await storage.delete(key: key);
  }

  clearStorage() async {
    await storage.deleteAll();
  }
}
