import 'dart:convert';

import 'package:prayertime/models/PrayerDateRangeModel.dart';
import 'package:prayertime/utils/sharedPrefs.dart';

class PrayerTimePersistenceService {

  String key = 'prayer_date_range';

  Future<void> savePrayerDateRangeModel(PrayerDateRangeModel object) async {
    await SharedPrefsUtils.saveSharedPref(key, jsonEncode(object.toJson()));
  }

  Future<PrayerDateRangeModel?> getPrayerDateRangeModel() async {
    final jsonString = await SharedPrefsUtils.getSharedPref(key);
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