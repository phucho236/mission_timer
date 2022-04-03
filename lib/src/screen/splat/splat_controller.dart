import 'package:get/get.dart';
import 'package:mission_timer/core/config/language/localization_service.dart';
import 'package:mission_timer/core/helper/strorage/strorage.dart';
import 'package:mission_timer/src/screen/auth/login/login_screen.dart';

class SplatController extends GetxController {
  void init() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        changeLanguage();

        Get.toNamed(LoginScreen.router);
      },
    );
  }

  void changeLanguage() {
    var languagecode = Get.find<Strorage>().getLanguageCode;
    if (languagecode != null && languagecode != Get.locale?.languageCode) {
      LocalizationService.changeLocale(languagecode);
    }
  }
}
