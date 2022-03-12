import 'package:get/get.dart';
import 'package:mission_timer/screen/register/register_screen.dart';
import 'package:mission_timer/screen/splat/splat_screen.dart';



class AppPages {
  static final pages = [
    GetPage(name: SplatScreen.router, page: () => SplatScreen()),
    GetPage(name: RegisterScreen.router, page: () => RegisterScreen()),
  ];
}
