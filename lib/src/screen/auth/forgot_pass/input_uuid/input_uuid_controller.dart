import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mission_timer/core/helper/validate/validate.dart';
import 'package:mission_timer/src/repositories/auth/auth_repository.dart';
import 'package:mission_timer/src/screen/auth/pin_code_verification/pin_code_verification.dart';

class InputEmailController extends GetxController {
  final formKeyInputEmailController = GlobalKey<FormState>();
  TextEditingController uuidEditingController = TextEditingController();
  Validate validate = Validate();
  AuthRepository ar = new AuthRepository();
  void submit() async {
    if (formKeyInputEmailController.currentState!.validate()) {
      var response = await ar.sendMail(userId: uuidEditingController.text);
      if (response == true) {
        Get.toNamed(PinCodeVerification.router,
            arguments: uuidEditingController.text);
      }
    }
  }
}
