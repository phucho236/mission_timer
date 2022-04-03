import 'package:get/get.dart';
import 'package:mission_timer/core/helper/strorage/strorage.dart';
import 'package:mission_timer/src/screen/splat/splat_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitialBinding extends Bindings {
  late final prefs;
  @override
  void dependencies() {
    Get.put(SplatController());

    Get.putAsync(() async {
      prefs = await SharedPreferences.getInstance();
      return Strorage(preferences: prefs);
    });
  }
}
