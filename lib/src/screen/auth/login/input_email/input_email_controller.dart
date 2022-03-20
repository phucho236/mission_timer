import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mission_timer/core/helper/validate/validate.dart';

import 'package:mission_timer/src/screen/auth/login/confirm_pass/confirm_pass_screen.dart';

class InputEmailController extends GetxController {
  final formKeyInputEmailController = GlobalKey<FormState>();
  TextEditingController emailEditingController = TextEditingController();
  Validate validate = Validate();
  void submit() {
    if (formKeyInputEmailController.currentState!.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      Get.toNamed(ConfirmPassScreen.router);
    }
  }
}
