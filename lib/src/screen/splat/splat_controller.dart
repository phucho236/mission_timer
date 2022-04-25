import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:get/get.dart';
import 'package:mission_timer/core/config/language/localization_service.dart';
import 'package:mission_timer/core/helper/strorage/strorage.dart';
import 'package:mission_timer/core/services/onesignal_service.dart';
import 'package:mission_timer/src/screen/auth/firt_change_pass/confirm_pass/first_pass_screen.dart';
import 'package:mission_timer/src/screen/auth/login/login_screen.dart';
import 'package:mission_timer/src/screen/home/home_screen.dart';
import 'package:mission_timer/src/screen/home/home_screen_controller.dart';
import 'package:mission_timer/src/screen/update_profile/profile_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplatController extends GetxController {
  void init() async {
    await Get.putAsync(() async {
      return Strorage(preferences: await SharedPreferences.getInstance());
    });
    final strorage = Get.find<Strorage>();

    if (strorage.getToken != null) {
      FlutterAppBadger.updateBadgeCount(1);
      changeLanguage(strorage);
      await Get.find<HomeScreenController>().getTasks();
      Get.find<ProfileController>().getProfile();
      Get.find<OnesignalService>()
          .registerOneSignal(strorage.getUserModel!.userId!);

      if (strorage.getUserModel!.isPasswordChanged!) {
        Get.offAndToNamed(HomeScreen.router);
      } else {
        Get.offAndToNamed(LoginScreen.router);
        Get.toNamed(FirstChangePassScreen.router);
      }
    } else {
      Get.offAndToNamed(LoginScreen.router);
    }
  }

  void changeLanguage(Strorage strorage) {
    var languagecode = strorage.getLanguageCode;
    if (languagecode != null && languagecode != Get.locale?.languageCode) {
      LocalizationService.changeLocale(languagecode);
    }
  }
}
