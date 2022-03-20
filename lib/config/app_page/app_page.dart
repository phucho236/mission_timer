import 'package:get/get.dart';
import 'package:mission_timer/screen/auth/login/forgot_pass1/input_email_screen.dart';
import 'package:mission_timer/screen/auth/login/login_screen.dart';

import 'package:mission_timer/screen/splat/splat_screen.dart';

class AppPages {
  static final pages = [
    GetPage(name: SplatScreen.router, page: () => SplatScreen()),
    GetPage(name: LoginScreen.router, page: () => LoginScreen()),
    GetPage(name: InputEmailScreen.router, page: () => InputEmailScreen()),
  ];
}
