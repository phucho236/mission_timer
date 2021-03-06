import 'package:get/get.dart';
import 'package:mission_timer/core/services/firebase_storege_service.dart';
import 'package:mission_timer/core/services/onesignal_service.dart';
import 'package:mission_timer/src/screen/home/home_screen_controller.dart';
import 'package:mission_timer/src/screen/splat/splat_controller.dart';
import 'package:mission_timer/src/screen/update_profile/profile_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put(FirebaseStorageService());
    Get.put(OnesignalService());
    Get.put(SplatController());
    Get.put(HomeScreenController());

    Get.lazyPut(() => ProfileController());
  }
}
