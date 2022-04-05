import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mission_timer/core/helper/validate/validate.dart';
import 'package:mission_timer/src/repositories/auth/auth_repository.dart';
import 'package:mission_timer/src/screen/auth/forgot_pass/confirm_pass/confirm_pass_screen.dart';

class InputEmailController extends GetxController {
  final formKeyInputEmailController = GlobalKey<FormState>();
  TextEditingController emailEditingController = TextEditingController();
  Validate validate = Validate();
   AuthRepository ar = new AuthRepository();
  void submit() {
    if (formKeyInputEmailController.currentState!.validate()) {
      
      Get.toNamed(ConfirmPassScreen.router);
    }
  }
}
