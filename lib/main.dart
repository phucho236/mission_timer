import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mission_timer/core/config/app_config.dart';
import 'package:mission_timer/src/app.dart';

void main() async {
  

  return runApp(
    AppConfig(
      flavorName: AppFlavor.DEVELOPMENT,
      apiUrl: 'https://mission-timer-be.herokuapp.com/api',
      appName: 'Điểm Danh ITTC',
      oneSignalId: '22906000-58fe-4443-8f57-0ffd53bd63cf',
      child: App(),
    ),
  );
}
