import 'package:get/get.dart';
import 'package:mission_timer/src/screen/auth/login/confirm_pass/confirm_pass_screen.dart';
import 'package:mission_timer/src/screen/auth/login/input_email/input_email_screen.dart';
import 'package:mission_timer/src/screen/auth/login/login_screen.dart';
import 'package:mission_timer/src/screen/splat/splat_screen.dart';

class AppPages {
  static final pages = [
    GetPage(name: SplatScreen.router, page: () => SplatScreen()),
    GetPage(name: LoginScreen.router, page: () => LoginScreen()),
    GetPage(name: InputEmailScreen.router, page: () => InputEmailScreen()),
    GetPage(name: ConfirmPassScreen.router, page: () => ConfirmPassScreen()),
  ];
}
