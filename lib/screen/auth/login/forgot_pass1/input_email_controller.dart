import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mission_timer/helper/validate/validate.dart';

class InputEmailController extends GetxController {
  final formKeyInputEmailController = GlobalKey<FormState>();
  TextEditingController emailEditingController = TextEditingController();
  Validate validate = Validate();
  void submit() {
    if (formKeyInputEmailController.currentState!.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.

    }
  }
}
