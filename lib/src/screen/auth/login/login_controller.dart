import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mission_timer/core/helper/validate/validate.dart';


import 'package:mission_timer/src/screen/auth/login/input_email/input_email_screen.dart';

class LoginController extends GetxController {
  final Validate validate = Validate();
  final TextEditingController idEditingController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final formKeyLoginController = GlobalKey<FormState>();
  void login() {
    if (formKeyLoginController.currentState!.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.

    }
  }

  void inputMail() {
    //forgot pass step 1
    Get.toNamed(InputEmailScreen.router);
  }
}
