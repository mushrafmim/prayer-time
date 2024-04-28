import 'package:flutter/widgets.dart';
import 'package:prayertime/models/SettingsModel.dart';
import 'package:prayertime/services/SettingsPersistenceService.dart';

class SettingsStore extends ChangeNotifier {
  late SettingsModel _settings;

  SettingsModel get settings => _settings; // Getter for accessing settings

  SettingsStore() {
    _loadSettings(); // Load settings on initialization
  }

  // Load settings from SharedPreferences
  Future<void> _loadSettings() async {
    final settings = await SettingsPersistenceService.getSettings();
    _settings = settings ?? SettingsModel(); // If settings is null, create a new instance
  }

  // Save settings to SharedPreferences
  Future<void> _saveSettings() async {
    await SettingsPersistenceService.saveSettings(_settings);
  }

  // Update settings and notify listeners
  void updateSetting(String key, dynamic value) async {
    switch (key) {
      case 'isEasternTime':
        _settings.isEasternTime = value as bool;
        break;
      default:
        print("Invalid setting key: $key");
    }

    await _saveSettings();
    notifyListeners(); // Notify listeners about changes
  }
}