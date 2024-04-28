import 'dart:io';

import 'package:flutter/material.dart';
import 'package:prayertime/models/PrayerDateRangeModel.dart';
import 'package:prayertime/constants/Colors.dart';
import 'package:prayertime/screens/SettingsScreen.dart';
import 'package:prayertime/services/PrayerTimeAPIService.dart';
import 'package:prayertime/services/PrayerTimePersistenceService.dart';
import 'package:prayertime/stores/SettingsStore.dart';
import 'package:prayertime/widgets/DateRangeWidget.dart';
import 'package:prayertime/widgets/PrayerWidget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PrayerTimeApiService _prayerTimeApiService = PrayerTimeApiService();
  final PrayerTimePersistenceService _prayerTimePersistenceService = PrayerTimePersistenceService();

  PrayerDateRangeModel? prayerModel;
  bool unableToFetch = false;


  String userRegion = "Eastern";

  @override
  initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    // fetch the data from the local storage if it exists
    var prayerTime = await _prayerTimePersistenceService.getPrayerDateRangeModel();


    if (prayerTime == null) {
      // if the data does not exist in the local storage, fetch it from the API
      try {
        prayerTime = await _prayerTimeApiService.getPrayerTime(DateTime.now());

        // After fetching it storing it to the localstorage.
        await _prayerTimePersistenceService.savePrayerDateRangeModel(prayerTime);

      } on SocketException {
        // handle the error
        unableToFetch = true;

        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('No Internet Connection'),
                content: const Text('Please check your internet connection and try again.'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      // Close the dialog
                      Navigator.of(context).pop();
                    },
                    child: const Text('Close'),
                  ),
                ],
              );
            });
      }
    }

    setState(() {
      prayerModel = prayerTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    final settingsStore = Provider.of<SettingsStore>(context);

    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Prayer Times',
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [

            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsScreen(),
                    )
                );
              },
            ),
          ]
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            if (prayerModel == null && !unableToFetch)
              const Center(
                child: CircularProgressIndicator(),
              )
            else if (prayerModel != null)
              DateRangeWidget(
                fromDate: prayerModel!.fromDate,
                toDate: prayerModel!.toDate,
                isEasternTime: settingsStore.settings.isEasternTime,
              ),
            ...?prayerModel?.prayerTimes
                .map((prayerTime) => PrayerWidget(
                prayerTime: prayerTime,
                isEasternTime: settingsStore.settings.isEasternTime))
          ],
        ),
      ),
    );
  }
}
