import 'package:get/get.dart';
import 'package:mission_timer/screen/register/register_screen.dart';

class SplatController extends GetxController {
  void init() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.toNamed(RegisterScreen.router);
      },
    );
  }
}
