import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mission_timer/core/helper/validate/validate.dart';
import 'package:mission_timer/core/model/user_model.dart';
import 'package:mission_timer/src/repositories/auth/auth_repository.dart';
import 'package:mission_timer/src/screen/auth/forgot_pass/input_email/input_email_screen.dart';

import 'package:mission_timer/src/screen/home/home_screen.dart';

class LoginController extends GetxController {
  final Validate validate = Validate();
  final TextEditingController idEditingController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final formKeyLoginController = GlobalKey<FormState>();
  AuthRepository ar = new AuthRepository();
  login() async {
    if (formKeyLoginController.currentState!.validate()) {
      UserModel? reponse = await ar.logIn(
          id: idEditingController.text, pass: passController.text);
      if (reponse!.isPasswordChanged!) {
        Get.toNamed(InputEmailScreen.router);
      }
      else
      {
        Get.toNamed(HomeScreen.router);
      }
    }
  }

  void inputMail() {
    //forgot pass step 1
    Get.toNamed(InputEmailScreen.router);
  }
}
