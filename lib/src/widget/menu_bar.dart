import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mission_timer/src/screen/chart/chart_screen.dart';
import 'package:mission_timer/src/screen/notification/notification_screen.dart';
import 'package:mission_timer/src/screen/test_supervision/test_supervision_screen.dart';
import 'package:mission_timer/src/screen/update_profile/update_profile_screen.dart';
import 'package:mission_timer/src/widget/dropdow_language.dart';

class MenuBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Stack(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(90)),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.person_outline),
            title: Text('profile'.tr),
            onTap: () => {
              Get.back(),
              Get.toNamed(UpdateProfileScreen.router),
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('notification'.tr),
            onTap: () => {
              Get.back(),
              Get.toNamed(NotificationScreen.router),
            },
          ),
          ListTile(
            leading: Icon(Icons.checklist_rounded),
            title: Text('test_supervision'.tr),
            onTap: () => {
              Get.back(),
              Get.toNamed(TestSupervisionScreen.router),
            },
          ),
          ListTile(
            leading: Icon(Icons.bar_chart),
            title: Text('chart'.tr),
            onTap: () => {
              Get.back(),
              Get.toNamed(ChartScreen.router),
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('settings'.tr),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('feedback'.tr),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('logout'.tr),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.language_outlined),
            title: Row(
              children: [
                Text('language'.tr),
                Spacer(),
                DropDownLanguage(),
              ],
            ),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
