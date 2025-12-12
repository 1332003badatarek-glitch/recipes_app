import 'package:recipesapp/config/cache/cache_helper.dart';

class ThemeLocalStorage {
  static const String key = 'isDark';

  static Future<void> saveTheme(bool isDark) async {
    await CacheHelper.saveData(key: key, value: isDark);
  }

  static Future<bool> loadTheme() async {
    return await CacheHelper.getData(key: key) ?? false;
  }
}
