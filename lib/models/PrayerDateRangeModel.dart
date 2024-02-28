import 'package:prayertime/models/PrayerTimeModel.dart';

class PrayerDateRangeModel {
  final DateTime fromDate;
  final DateTime toDate;
  final List<PrayerTimeModel> prayerTimes;

  const PrayerDateRangeModel({
    required this.fromDate,
    required this.toDate,
    required this.prayerTimes
  });

  factory PrayerDateRangeModel.fromJson(Map<String, dynamic> json) {

    return PrayerDateRangeModel(
        fromDate: DateTime.parse(json['from']),
        toDate: DateTime.parse(json['to']),
        prayerTimes: (json['prayers'] as List).map((e) => PrayerTimeModel.fromJson(e)).toList()
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'from': fromDate.toIso8601String(),
      'to': toDate.toIso8601String(),
      'prayers': prayerTimes.map((e) => e.toJson()).toList()
    };
  }
}