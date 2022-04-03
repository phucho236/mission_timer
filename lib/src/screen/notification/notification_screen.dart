import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:mission_timer/core/helper/utils/app_colors.dart';
import 'package:mission_timer/core/helper/utils/theme_data.dart';
import 'package:mission_timer/src/screen/notification/notification_controller.dart';
import 'package:mission_timer/src/widget/base_layout/base_layout.dart';

class NotificationScreen extends StatefulWidget {
  static const String router = '/NotificationScreen';
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with ThemeDataMixin {
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      titleForm: 'notification'.tr,
      child: GetBuilder<NotificationController>(
        init: NotificationController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: List.generate(
                controller.notis.length,
                (index) => Stack(
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          Text(
                            controller.notis[index].title!,
                            style: textTheme.bodyText1,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          controller.notis[index].readed!
                              ? SizedBox()
                              : Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(90),
                                    color: ColorsApp.red,
                                  ),
                                ),
                        ],
                      ),
                      subtitle: Text(
                        controller.notis[index].content!,
                        style: textTheme.bodyText2,
                      ),
                      leading: Image.asset(
                        "assets/images/logo.png",
                        height: 50,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
