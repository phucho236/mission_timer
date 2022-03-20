import 'package:flutter/material.dart';
import 'package:mission_timer/config/app_config.dart';
import 'package:mission_timer/src/app.dart';


void main() async {
    return runApp(
      AppConfig(
        apiUrl: '',
        appName: 'Điểm Danh ITTC',
        oneSignalId: '60fa340b-394f-4209-be92-5a4035f0b489',
        child: App(),
        
      ),
    );  
}
