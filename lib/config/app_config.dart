

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppConfig extends InheritedWidget {
  final String appName;
  final AppFlavor flavorName;
  final String apiUrl;
  final String oneSignalId;
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey _globalKey;
  static GlobalKey  get globalKey => _globalKey;
  bool get isDevelopment => flavorName == AppFlavor.DEVELOPMENT;

  static String urlApi = "";
  static String pathToRS = "";
  AppConfig({
     this.appName,
     this.flavorName,
     this.apiUrl,
     Widget child,
     this.oneSignalId,
  }) : super(child: child) {
    urlApi = apiUrl;
    _globalKey = child.key as GlobalKey<State<StatefulWidget>>;
    FlutterError.onError = (FlutterErrorDetails details) {
      if (isDevelopment) {
        FlutterError.dumpErrorToConsole(details);
      } 
    };
  }

  static AppConfig get instance => Get.context.dependOnInheritedWidgetOfExactType(aspect: AppConfig);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}

enum AppFlavor { DEVELOPMENT, TEST, PRODUCTION }
//
String get urlApi => AppConfig.urlApi;
