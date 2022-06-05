import 'package:get/get.dart';
import 'package:mission_timer/src/screen/auth/firt_change_pass/confirm_pass/first_pass_screen.dart';
import 'package:mission_timer/src/screen/auth/forgot_pass/confirm_pass/confirm_pass_screen.dart';
import 'package:mission_timer/src/screen/auth/forgot_pass/input_uuid/input_uuid_screen.dart';
import 'package:mission_timer/src/screen/auth/login/login_screen.dart';
import 'package:mission_timer/src/screen/auth/pin_code_verification/pin_code_verification.dart';
import 'package:mission_timer/src/screen/chart/chart_screen.dart';
import 'package:mission_timer/src/screen/home/home_screen.dart';
import 'package:mission_timer/src/screen/notification/detail_notifi_screen.dart';
import 'package:mission_timer/src/screen/notification/notification_screen.dart';
import 'package:mission_timer/src/screen/splat/splat_screen.dart';
import 'package:mission_timer/src/screen/test_supervision/test_supervision_screen.dart';
import 'package:mission_timer/src/screen/update_profile/update_profile_screen.dart';

class AppPages {
  static final pages = [
    GetPage(name: SplatScreen.router, page: () => SplatScreen()),
    GetPage(name: LoginScreen.router, page: () => LoginScreen()),
    GetPage(name: InputUuIdScreen.router, page: () => InputUuIdScreen()),
    GetPage(name: ConfirmPassScreen.router, page: () => ConfirmPassScreen()),
    GetPage(
        name: FirstChangePassScreen.router,
        page: () => FirstChangePassScreen()),
    GetPage(name: HomeScreen.router, page: () => HomeScreen()),
    GetPage(name: ChartScreen.router, page: () => ChartScreen()),
    GetPage(name: NotificationScreen.router, page: () => NotificationScreen()),
    GetPage(
        name: TestSupervisionScreen.router,
        page: () => TestSupervisionScreen()),
    GetPage(
        name: UpdateProfileScreen.router, page: () => UpdateProfileScreen()),
    GetPage(
        name: PinCodeVerification.router, page: () => PinCodeVerification()),
            GetPage(
        name: DetailNotiScreen.route, page: () => DetailNotiScreen()),
  ];
}
