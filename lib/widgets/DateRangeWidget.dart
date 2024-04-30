import 'package:flutter/material.dart';
import 'package:prayertime/constants/Colors.dart';

class DateRangeWidget extends StatelessWidget {
  final DateTime fromDate;
  final DateTime toDate;
  final bool isEasternTime;

  const DateRangeWidget({
    super.key,
    required this.fromDate,
    required this.toDate,
    required this.isEasternTime
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 20.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DateComponent(fromOrTo: "FROM", date: fromDate),
                  DateComponent(fromOrTo: "TO", date: toDate)
                ]
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                isEasternTime ? "Eastern Times" : "Colombo Times",
                style: const TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class DateComponent extends StatelessWidget {
  final String fromOrTo;
  final DateTime date;

  const DateComponent({
    super.key,
    required this.fromOrTo,
    required this.date
  });

  @override
  Widget build(BuildContext context) {

    final dateText = date.toLocal().toString().substring(0, 10);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fromOrTo,
          style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor
          ),
        ),
        Text(
          dateText,
          style: const TextStyle(
            fontSize: 20,
            color: AppColors.accentColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
