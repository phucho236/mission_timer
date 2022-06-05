import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mission_timer/core/helper/strorage/strorage.dart';
import 'package:mission_timer/core/helper/validate/validate.dart';
import 'package:mission_timer/core/model/user_model.dart';
import 'package:mission_timer/core/services/onesignal_service.dart';
import 'package:mission_timer/src/repositories/auth/auth_repository.dart';
import 'package:mission_timer/src/screen/auth/firt_change_pass/confirm_pass/first_pass_screen.dart';
import 'package:mission_timer/src/screen/auth/forgot_pass/input_uuid/input_uuid_screen.dart';

import 'package:mission_timer/src/screen/home/home_screen.dart';
import 'package:mission_timer/src/screen/home/home_screen_controller.dart';

class LoginController extends GetxController {
  final Validate validate = Validate();
  final TextEditingController idEditingController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final formKeyLoginController = GlobalKey<FormState>();
  AuthRepository ar = new AuthRepository();
  login() async {
    if (formKeyLoginController.currentState!.validate()) {
      UserModel? result = await ar.logIn(
          id: idEditingController.text, pass: passController.text);
      if (result != null) {
        Get.find<OnesignalService>()
            .registerOneSignal(Get.find<Strorage>().getUserModel!.userId!);
        await Get.find<HomeScreenController>().getTasks();
        if (result.isPasswordChanged!) {
          Get.toNamed(HomeScreen.router);
       
        } else {
          Get.toNamed(FirstChangePassScreen.router);
        }
      }
    }
  }

  void inputMail() {
    //forgot pass step 1
    Get.toNamed(InputUuIdScreen.router);
  }
}
