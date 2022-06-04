import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mission_timer/core/config/app_config.dart';
import 'package:mission_timer/src/app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  return runApp(
    AppConfig(
      flavorName: AppFlavor.DEVELOPMENT,
      apiUrl: 'https://missiontimer.up.railway.app/api',
      // apiUrl: "http://192.168.1.253:3000/api",
      appName: 'Điểm Danh ITTC',
      oneSignalId: '22906000-58fe-4443-8f57-0ffd53bd63cf',
      child: App(),
    ),
  );
}
