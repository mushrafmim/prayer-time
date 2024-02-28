import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prayertime/models/PrayerDateRangeModel.dart';

class PrayerTimeApiService {
  static const String baseUrl = 'https://wplggnmh93.execute-api.ap-southeast-1.amazonaws.com/default/prayer-timer';

  Future<PrayerDateRangeModel> getPrayerTime(DateTime dateTime) async {

    final isoDate = dateTime.toIso8601String();
    final response = await http.get(Uri.parse('$baseUrl?date=$isoDate'));

    if (response.statusCode == 200) {
      return PrayerDateRangeModel.fromJson(json.decode(response.body)["Items"][0]);
    } else {
      throw Exception('Failed to load prayer time');
    }
  }
}