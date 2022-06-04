import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mission_timer/src/repositories/auth/auth_repository.dart';
import 'package:mission_timer/src/screen/auth/forgot_pass/confirm_pass/confirm_pass_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeVerificationController extends GetxController {
  String? currentText;
  final TextEditingController codeEditingController = TextEditingController();
  late StreamController<ErrorAnimationType>? errorController;
  final formKeyPinCodeVerificationController = GlobalKey<FormState>();
  AuthRepository ar = new AuthRepository();
  @override
  void onInit() {
    super.onInit();
    errorController = StreamController<ErrorAnimationType>();
  }

  void submit(String uuid) async {
    if (codeEditingController.text.length != 6) {
      errorController!.add(ErrorAnimationType.shake);
      return;
    }
    var reponse =
        await ar.verifyOTP(otp: codeEditingController.text, userId: uuid);
    if (reponse == false) {
      errorController!.add(ErrorAnimationType.shake);
      return;
    } else {
      Get.toNamed(ConfirmPassScreen.router,
          arguments: ConfirmPassScreenArgs(
              otp: codeEditingController.text, userId: Get.arguments));
    }
  }
}
