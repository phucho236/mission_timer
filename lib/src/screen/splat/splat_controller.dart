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
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyNWFjYzRjYTg5ODY4ODQyZGE4ZGU2ZSIsImlhdCI6MTY1MDM0MTQ1NCwiZXhwIjoxNjUyOTMzNDU0fQ.YDfT5f2nKNsj4o640rB0jYND3PEWVDbCtk7GV27_scg";
    Get.find<Strorage>().saveToken(token);
    final strorage = Get.find<Strorage>();

    if (strorage.getToken != null) {
      Get.put(HomeScreenController()).getData();
      changeLanguage(strorage);
      Get.find<ProfileController>().getProfile();
      Get.find<OnesignalService>().sendTag(strorage.getUserModel!.userId!);

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
