import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _prefs;
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  //! LOCAL STORAGE shared preferences

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is int) {
      return await _prefs.setInt(key, value);
    } else if (value is double) {
      return await _prefs.setDouble(key, value);
    } else if (value is String) {
      return await _prefs.setString(key, value);
    } else if (value is bool) {
      return await _prefs.setBool(key, value);
    } else if (value is List<String>) {
      return await _prefs.setStringList(key, value);
    } else {
      return false;
    }
  }

  static dynamic getData({required String key}) {
    return _prefs.get(key);
  }

  static Future<bool> removeData({required String key}) async {
    return await _prefs.remove(key);
  }

  static Future<bool> clearAllData() async {
    return await _prefs.clear();
  }

  //! secure storage

  static Future<void> saveSecureData({
    required String key,
    required String value,
  }) async {
    await _secureStorage.write(key: key, value: value);
  }

  static Future<String?> getSecureData(String key) async {
    return await _secureStorage.read(key: key);
  }

  static Future<void> removeSecureData({required String key}) async {
    await _secureStorage.delete(key: key);
  }

  static Future<void> clearAllSecureData() async {
    await _secureStorage.deleteAll();
  }
}
