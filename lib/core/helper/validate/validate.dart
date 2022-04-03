import 'package:get/get.dart';

class Validate {
  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "Vui lòng nhập email";
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      return "Email không đúng định dạng";
    }
    return null;
  }

  String? validateText(String? text, String? nameField) {
    if (text == null || text.isEmpty) {
      return "${'pl_input'.tr} $nameField.";
    }
    return null;
  }

  String? validateTextNumber(String? text, String? nameField) {
    if (text == null || text.isEmpty) {
      return 'pl_input'.tr + " $nameField.";
    }
    if (double.tryParse(text) == null) {
      return "$nameField " + 'is_number'.tr;
    }
    return null;
  }

  String? validatePass(String? passWord) {
    if (passWord == null || passWord.isEmpty) {
      return 'pl_input'.tr + 'password'.tr;
    }

    if (passWord.length < 5 || passWord.length > 15) {
      return 'validate_pass'.tr;
    }
    return null;
  }

  String? validateConfirmPass(String? passWord, String? confirmPass) {
    if (passWord != confirmPass) {
      return 'pass_does_not_match'.tr;
    }
    return null;
  }
}
