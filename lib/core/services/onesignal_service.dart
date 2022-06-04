import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

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
        switch (event.notification.additionalData!['type']) {
          case 'Comment':
            break;

          default:
            break;
        }
      },
    );

    // Will be called whenever a notification is received in foreground
    // Display Notification, pass null param for not displaying the notification

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      // Will be called whenever a notification is opened/button pressed.
    });

    // OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
    //   // Will be called whenever the permission changes
    //   // (ie. user taps Allow on the permission prompt in iOS)
    // });

    // OneSignal.shared
    //     .setSubscriptionObserver((OSSubscriptionStateChanges changes) {
    //   // Will be called whenever the subscription changes
    //   // (ie. user gets registered with OneSignal and gets a user ID)
    // });

    // OneSignal.shared.setEmailSubscriptionObserver(
    //     (OSEmailSubscriptionStateChanges emailChanges) {
    //   // Will be called whenever then user's email subscription changes
    //   // (ie. OneSignal.setEmail(email) is called and the user gets registered
    // });
  }

//Todo need handle logout onesignal
  void logOutOneSignal() async {
//setWhenLogin
// OneSignal.shared.setExternalUserId(uuid);
    await OneSignal.shared.disablePush(false);
  }
}
