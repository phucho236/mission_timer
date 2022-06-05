import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mission_timer/core/helper/utils/theme_data.dart';
import 'package:mission_timer/core/services/onesignal_service.dart';
import 'package:mission_timer/src/widget/calendar/calendar.dart';
import 'package:mission_timer/src/widget/menu_bar.dart';

class HomeScreen extends StatelessWidget with ThemeDataMixin {
  static const String router = "/HomeScreen";

  @override
  Widget build(BuildContext context) {
    Get.find<OnesignalService>().handleNotificaiton();
    return Scaffold(
      drawer: MenuBar(),
      appBar: AppBar(),
      body: Calendar(),
    );
  }
}
