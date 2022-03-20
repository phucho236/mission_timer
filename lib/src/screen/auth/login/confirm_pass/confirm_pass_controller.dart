import 'package:flutter/material.dart';
import 'package:mission_timer/core/helper/toast/toast.dart';

import 'package:get/get.dart';
import 'package:mission_timer/core/helper/validate/validate.dart';
import 'package:mission_timer/src/screen/auth/login/login_screen.dart';

class ConfirmPassController extends GetxController {
  TextEditingController passEditingController = TextEditingController();
  TextEditingController confirmPassEditingController = TextEditingController();
  final formKeyConfirmPassController = GlobalKey<FormState>();
  final Validate validate = Validate();
  void submit() {
    if (formKeyConfirmPassController.currentState!.validate()) {
      Toast().showToat('succes'.tr);
      Get.offAndToNamed(LoginScreen.router);
    }
  }
}
