import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:mission_timer/helper/toast/toast.dart';

class RegisterController extends GetxController {
  final registerFormKey = GlobalKey<FormState>();
  TextEditingController staffIcController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  onSubmit() {
    if (registerFormKey.currentState.validate()) {}
  }
}
