import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsUtils {

  static Future<void> saveSharedPref(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future<String?> getSharedPref(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(key);
    if (value == null) {
      return null;
    }
    return value;
  }
}