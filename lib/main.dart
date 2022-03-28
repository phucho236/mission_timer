import 'package:flutter/material.dart';
import 'package:mission_timer/core/config/app_config.dart';
import 'package:mission_timer/src/app.dart';

void main() async {
  return runApp(
    AppConfig(
      apiUrl: 'https://mission-timer-be.herokuapp.com/api',
      appName: 'Điểm Danh ITTC',
      oneSignalId: '60fa340b-394f-4209-be92-5a4035f0b489',
      child: App(),
    ),
  );
}
