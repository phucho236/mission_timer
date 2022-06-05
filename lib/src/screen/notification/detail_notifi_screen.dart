import 'package:flutter/material.dart';
import 'package:mission_timer/core/helper/utils/theme_data.dart';
import 'package:mission_timer/core/model/notification_model.dart';
import 'package:mission_timer/src/widget/base_layout/base_layout.dart';
import 'package:get/get.dart';

class DetailNotiScreen extends StatelessWidget with ThemeDataMixin {
  static const String route = "/DetailNotiScreen";
  const DetailNotiScreen({required this.notificationModel, Key? key})
      : super(key: key);
  final NotificationModel notificationModel;
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      titleForm: "detail_notification".tr,
      child: Column(
        children: [
          Text(
            "title".tr + "${notificationModel.title}",
            style: textTheme.bodyLarge,
          ),
          Text(
            "content".tr + "${notificationModel.content}",
            style: textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
