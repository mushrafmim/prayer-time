import 'package:flutter/material.dart';
import 'package:prayertime/models/PrayerTimeModel.dart';

class PrayerWidget extends StatelessWidget {
  final PrayerTimeModel prayerTime;

  const PrayerWidget({
    super.key,
    required this.prayerTime,
  });

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
                  color: Color(0xFF004366e),
                ),
              ),
              Text(
                prayerTime.prayerTime.format(context).toString(),
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
