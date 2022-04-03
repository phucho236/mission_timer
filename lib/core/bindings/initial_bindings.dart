import 'package:get/get.dart';
import 'package:mission_timer/src/screen/splat/splat_controller.dart';
class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplatController());
    // Get.put(DropDownLanguageController());
    // Get.put(LoginController());
    // Get.put(InputEmailController());
    // controller
  }
}
