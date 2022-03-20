import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppConfig extends InheritedWidget {
  final String? appName;
  final AppFlavor? flavorName;
  final String? apiUrl;
  final String? oneSignalId;
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  bool get isDevelopment => flavorName == AppFlavor.DEVELOPMENT;
  static String? urlApi = "";
  static String? pathToRS = "";
  AppConfig({
    this.appName,
    this.flavorName,
    this.apiUrl,
    required Widget child,
    this.oneSignalId,
  }) : super(child: child) {
    urlApi = apiUrl;
    FlutterError.onError = (FlutterErrorDetails details) {
      if (isDevelopment) {
        FlutterError.dumpErrorToConsole(details);
      }
    };
  }

  static AppConfig? get instance =>
      Get.context!.dependOnInheritedWidgetOfExactType(aspect: AppConfig);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}

enum AppFlavor { DEVELOPMENT, TEST, PRODUCTION }
//
String? get urlApi => AppConfig.urlApi;
