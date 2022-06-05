import 'package:flutter/material.dart';
import 'package:mission_timer/core/helper/utils/theme_data.dart';
import 'package:mission_timer/core/model/notification_model.dart';
import 'package:mission_timer/src/widget/base_layout/base_layout.dart';
import 'package:get/get.dart';

class DetailNotiScreen extends StatelessWidget with ThemeDataMixin {
  static const String route = "/DetailNotiScreen";
  DetailNotiScreen({Key? key}) : super(key: key);
  final NotificationModel notificationModel = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      titleForm: "detail_notification".tr,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "notification".tr + ": ${notificationModel.title}",
              style: textTheme.titleLarge,
            ),
            Text(
              "content".tr + ": ${notificationModel.content}",
              style: textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
