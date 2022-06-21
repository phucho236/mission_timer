import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:mission_timer/core/helper/toast/toast.dart';
import 'package:mission_timer/core/helper/utils/app_colors.dart';
import 'package:mission_timer/core/helper/utils/theme_data.dart';
import 'package:mission_timer/src/screen/notification/detail_notifi_screen.dart';
import 'package:mission_timer/src/screen/notification/notification_controller.dart';
import 'package:mission_timer/src/widget/base_layout/base_layout.dart';
import 'package:mission_timer/src/widget/calendar/calendar_controller.dart';

class NotificationScreen extends StatefulWidget {
  static const String router = '/NotificationScreen';
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> with ThemeDataMixin {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return GetBuilder<NotificationController>(
          id: "/notification",
          init: NotificationController(),
          builder: (controller) {
            return BaseLayout(
              isLoading: controller.isLoading,
              isSingleChildScrollView: false,
              titleForm: 'notification'.tr,
              child: RefreshIndicator(
                onRefresh: () async {
                  controller.getData(pageInput: 0);
                },
                child: ListView(
                  physics: AlwaysScrollableScrollPhysics(), // <-- this will disable scroll

                  controller: controller.scrollController,
                  children: [
                    Column(
                      children: List.generate(
                        controller.notis.length,
                        (index) => Item(
                          onPress: () {
                            if (!controller.notis[index].readed!) {
                              controller.updateReaded(index, controller.notis[index].id!);
                            }
                            if (controller.notis[index].type == "admin")
                              Get.toNamed(DetailNotiScreen.route, arguments: controller.notis[index]);
                            else {
                              Get.back();
                            }
                          },
                          textTheme: textTheme,
                          controller: controller,
                          index: index,
                        ),
                      ),
                    ),
                    GetBuilder<NotificationController>(
                        id: "/loading",
                        builder: (controller) {
                          return Opacity(
                              opacity: controller.isLoadMore ? 1 : 0,
                              child: Center(child: CircularProgressIndicator()));
                        })
                  ],
                ),
              ),
            );
          });
    });
  }
}

class Item extends StatelessWidget {
  const Item({Key? key, required this.textTheme, required this.controller, @required this.onPress, required this.index})
      : super(key: key);

  final TextTheme textTheme;
  final NotificationController controller;
  final int index;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Stack(
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
            leading: controller.notis[index].type == "admin"
                ? Image.asset(
                    "assets/images/logo.png",
                    height: 50,
                  )
                : Icon(
                    Icons.work,
                    size: 30,
                    color: ColorsApp.blue,
                  ),
          ),
        ],
      ),
    );
  }
}
