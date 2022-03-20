import 'package:get/get.dart';
import 'package:mission_timer/screen/auth/login/forgot_pass1/input_email_controller.dart';
import 'package:mission_timer/screen/auth/login/login_controller.dart';
import 'package:mission_timer/screen/splat/splat_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplatController());
    // Get.put(LoginController());
    // Get.put(InputEmailController());
    // controller
  }
}
