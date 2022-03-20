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
    if (double.tryParse(text) != null) {
      return "$nameField " + 'is_number'.tr;
    }
    return null;
  }

  String? validatePass(String passWord) {
    if (passWord.length < 5 || passWord.length > 15) {
      return "Mật khẩu có độ dài từ 5 đến 15 kí tự.";
    }
    return null;
  }

  String? validateConfirmPass(String? passWord, String? confirmPass) {
    if (passWord != confirmPass) {
      return "Mật khẩu không trùng khớp";
    }
    return null;
  }
}
