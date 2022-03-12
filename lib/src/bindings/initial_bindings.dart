import 'package:get/get.dart';
import 'package:mission_timer/screen/register/register_controller.dart';
import 'package:mission_timer/screen/splat/splat_controller.dart';


class InitialBinding extends Bindings {
  @override
  void dependencies() {
  Get.put(SplatController());
  Get.put(RegisterController());
    // controller
}
}