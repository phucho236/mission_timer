import 'package:flutter/material.dart';
import 'package:mission_timer/core/helper/toast/toast.dart';

import 'package:get/get.dart';
import 'package:mission_timer/core/helper/validate/validate.dart';
import 'package:mission_timer/src/repositories/auth/auth_repository.dart';
import 'package:mission_timer/src/screen/auth/forgot_pass/confirm_pass/confirm_pass_screen.dart';
import 'package:mission_timer/src/screen/auth/login/login_screen.dart';

class ConfirmPassController extends GetxController {
  TextEditingController passEditingController = TextEditingController();
  TextEditingController confirmPassEditingController = TextEditingController();
  AuthRepository _ar = AuthRepository();
  ConfirmPassScreenArgs args = Get.arguments;
  final formKeyConfirmPassController = GlobalKey<FormState>();
  final Validate validate = Validate();
  void submit() async {
    if (formKeyConfirmPassController.currentState!.validate()) {
      var reponse = await _ar.changePass(
          pass: passEditingController.text, otp: args.otp, uuid: args.userId);
      if (reponse == true) {
        Toast().showToat('success'.tr);
        Get.offNamedUntil(LoginScreen.router, (router) => false);
      }
    }
  }
}
