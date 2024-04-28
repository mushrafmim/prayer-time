import 'dart:convert';

import 'package:prayertime/models/SettingsModel.dart';
import 'package:prayertime/utils/sharedPrefs.dart';

class SettingsPersistenceService {
  static const String key = 'settings';

  static Future<void> saveSettings(SettingsModel object) async {
    await SharedPrefsUtils.saveSharedPref(key, jsonEncode(object.toJson()));
  }

  static Future<SettingsModel?> getSettings() async {
    final jsonString = await SharedPrefsUtils.getSharedPref(key);
    if (jsonString == null) {
      return null;
    }
    final settings = SettingsModel.fromJson(jsonDecode(jsonString));
    return settings;
  }
}