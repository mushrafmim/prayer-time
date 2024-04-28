import 'package:flutter/material.dart';
import 'package:prayertime/constants/Colors.dart';
import 'package:prayertime/stores/SettingsStore.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final settingsStore = Provider.of<SettingsStore>(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Eastern Time",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 18,
                    ),
                  ),
                  Switch(
                      value: settingsStore.settings.isEasternTime,
                      onChanged: (value) {
                    settingsStore.updateSetting('isEasternTime', value);
                  })
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text("Powered By", style: TextStyle(color: AppColors.primaryColor, fontSize: 18)),
                  SizedBox(height: 16),
                  Image(image: AssetImage("assets/handysof-logo.png"), width: 200, height: 80),
                  // Text("Follow Us At" , style: TextStyle(color: AppColors.primaryColor, fontSize: 18)),
                  // SizedBox(height: 16),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     IconButton(
                  //       icon: Image.asset("assets/facebook.png"),
                  //       onPressed: () {},
                  //     ),
                  //     IconButton(
                  //       icon: Image.asset("assets/twitter.png"),
                  //       onPressed: () {},
                  //     ),
                  //     IconButton(
                  //       icon: Image.asset("assets/instagram.png"),
                  //       onPressed: () {},
                  //     ),
                  //   ],
                  // )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
