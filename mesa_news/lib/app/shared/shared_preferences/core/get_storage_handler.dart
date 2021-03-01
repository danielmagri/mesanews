import 'package:flutter/foundation.dart' show protected;
import 'package:get_storage/get_storage.dart';

abstract class GetStoragesHandler {
  GetStorage _prefs;

  GetStoragesHandler() {
    _prefs = GetStorage();
  }

  @protected
  void setStorageString(String key, String value) => _prefs.write(key, "$value");

  @protected
  void setStorageInt(String key, int value) => _prefs.write(key, value);

  @protected
  // ignore: avoid_positional_boolean_parameters
  void setStorageBool(String key, bool value) => _prefs.write(key, value);

  @protected
  String getStorageString(String key) => _prefs.read(key) ?? null;

  @protected
  int getStorageInt(String key) => _prefs.read(key) ?? null;

  @protected
  bool getStorageBool(String key) => _prefs.read(key) ?? false;

  @protected
  void removeStorage(String key) => _prefs.remove("$key");
}
