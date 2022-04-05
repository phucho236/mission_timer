import 'package:flutter/material.dart';
import 'package:mission_timer/core/helper/toast/toast.dart';

import 'package:get/get.dart';
import 'package:mission_timer/core/helper/validate/validate.dart';
import 'package:mission_timer/src/repositories/auth/auth_repository.dart';
import 'package:mission_timer/src/screen/auth/login/login_screen.dart';

class FirstChangePassController extends GetxController {
  TextEditingController oldpassEditingController = TextEditingController();
  TextEditingController newpassEditingController = TextEditingController();
  TextEditingController confirmPassEditingController = TextEditingController();
  final formKeyConfirmPassController = GlobalKey<FormState>();
  final Validate validate = Validate();
  AuthRepository ar = AuthRepository();
  void submit() async {
    if (formKeyConfirmPassController.currentState!.validate()) {
      bool? reponse = await ar.firstChangePass(
          oldPass: oldpassEditingController.text,
          newPass: newpassEditingController.text);
      if (reponse!) {
        Get.offAndToNamed(LoginScreen.router);
      }
    }
  }
}
