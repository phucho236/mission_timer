import 'package:get/get.dart';
import 'package:mission_timer/screen/auth/login/login_screen.dart';



class SplatController extends GetxController {
  void init() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.toNamed(LoginScreen.router);
      },
    );
  }
}
