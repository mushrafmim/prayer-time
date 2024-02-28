import 'dart:convert';

import 'package:prayertime/models/PrayerDateRangeModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrayerTimePersistenceService {

  Future<void> savePrayerDateRangeModel(PrayerDateRangeModel object) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('prayer_date_range', jsonEncode(object.toJson()));
  }

  Future<PrayerDateRangeModel?> getPrayerDateRangeModel() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('prayer_date_range');
    if (jsonString == null) {
      return null;
    }
    final prayerDateRangeModel = PrayerDateRangeModel.fromJson(jsonDecode(jsonString));

    if (prayerDateRangeModel.fromDate.isBefore(DateTime.now()) && prayerDateRangeModel.toDate.isAfter(DateTime.now())) {
      return prayerDateRangeModel;
    } else {
      return null;
    }
  }
}