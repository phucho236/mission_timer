import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:mission_timer/src/screen/home/home_screen_controller.dart';
import 'package:mission_timer/src/screen/notification/notification_controller.dart';
import 'package:mission_timer/src/screen/notification/notification_screen.dart';
import 'package:mission_timer/src/widget/calendar/calendar_controller.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:get/get.dart';

class OnesignalService extends GetxService {
  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() {
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    OneSignal.shared.setAppId("22906000-58fe-4443-8f57-0ffd53bd63cf");

// The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      print("Accepted permission: $accepted");
    });
  }

  void registerOneSignal(String userId) async {
    await OneSignal.shared.sendTag('userId', userId);
    await OneSignal.shared.disablePush(false);
  }

  void handleNotificaiton() {
    //Todo need handle in home screen
    OneSignal.shared.setNotificationWillShowInForegroundHandler(
      (OSNotificationReceivedEvent event) {
        print('New notification: ${event.notification.additionalData}');
        print(event.notification.badge);
        FlutterAppBadger.updateBadgeCount(
            event.notification.badgeIncrement ?? 1);
        print("type" + event.notification.additionalData!['type']);
        switch (event.notification.additionalData!['type']) {
          case 'task':
            try {
              var calendarController = Get.find<CalendarController>();
              var homeScreenController = Get.find<HomeScreenController>();

              //get new task
              homeScreenController.getTasks(updateLayout: () {
                //update event for day day selected
                if (calendarController.selectedDay != null) {
                  calendarController.selectedTasks = calendarController
                      .getEventsForDay(calendarController.selectedDay!);
                }
                //update event for range day selected
                if (calendarController.rangeStart != null &&
                    calendarController.rangeEnd != null) {
                  calendarController.selectedTasks =
                      calendarController.getEventsForRange(
                          calendarController.rangeStart!,
                          calendarController.rangeEnd!);
                }
                calendarController.update(['/events', '/calendar']);
              });
            } catch (e) {}
            break;
          case 'admin':
            try {
              Get.find<NotificationController>().getData(pageInput: 1);
            } catch (e) {}

            break;
          default:
            break;
        }
      },
    );

    // Will be called whenever a notification is received in foreground
    // Display Notification, pass null param for not displaying the notification

    OneSignal.shared.setNotificationOpenedHandler(
      (OSNotificationOpenedResult result) {
        // Will be called whenever a notification is opened/button pressed.

        print('New notification: ${result.notification.additionalData}');
        FlutterAppBadger.removeBadge();
        switch (result.notification.additionalData!['type']) {
          case 'task':
            //defaut

            break;
          case 'admin':
            Get.toNamed(NotificationScreen.router);

            break;
          default:
            break;
        }
      },
    );
  }

//Todo need handle logout onesignal
  void logOutOneSignal() async {
    FlutterAppBadger.removeBadge();
    await OneSignal.shared.disablePush(true);
  }
}
