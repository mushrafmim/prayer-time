import 'package:flutter/material.dart';
import 'package:prayertime/models/PrayerTimeModel.dart';

class PrayerWidget extends StatelessWidget {
  final PrayerTimeModel prayerTime;
  final bool isEasternTime;

  const PrayerWidget({
    super.key,
    required this.prayerTime,
    required this.isEasternTime
  });

  TimeOfDay reduceSixMins(TimeOfDay time) {
    DateTime dateTime = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, time.hour, time.minute);
    dateTime = dateTime.subtract(const Duration(minutes: 6));
    return TimeOfDay.fromDateTime(dateTime);
  }

  TimeOfDay addSixMins(TimeOfDay time) {
    DateTime dateTime = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, time.hour, time.minute);
    dateTime = dateTime.add(const Duration(minutes: 6));
    return TimeOfDay.fromDateTime(dateTime);
  }



  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 8.0),
      child: Container(
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12)
          ),
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                prayerTime.prayerName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff004366e),
                ),
              ),
              Text(
                isEasternTime ? reduceSixMins(prayerTime.prayerTime).format(context).toString(): prayerTime.prayerTime.format(context).toString(),
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF00608e)
                ),
              ),
            ],
          )
      ),
    );
  }
}
