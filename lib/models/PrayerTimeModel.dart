import 'package:flutter/material.dart';

class PrayerTimeModel {
  final String prayerName;
  TimeOfDay prayerTime;

  PrayerTimeModel({
    required this.prayerName,
    required this.prayerTime
  });

  factory PrayerTimeModel.fromJson(Map<String, dynamic> json) {
    String time = json['time'];
    List<String> timeSplit = time.split(':');

    return PrayerTimeModel(
        prayerName: json['prayer'],
        prayerTime: TimeOfDay(hour: int.parse(timeSplit[0]), minute: int.parse(timeSplit[1]))
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'prayer': prayerName,
      'time': '${prayerTime.hour}:${prayerTime.minute}'
    };
  }
}