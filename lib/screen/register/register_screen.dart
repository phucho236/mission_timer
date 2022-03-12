import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mission_timer/helper/validate/validate.dart';
import 'package:mission_timer/screen/register/register_controller.dart';

class RegisterScreen extends StatefulWidget {
  static const String router = "/RegisterScreen";
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Validate validate = Validate();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Đăng kí")),
      body: GetBuilder<RegisterController>(
        builder: (controller) {
          return Form(
            key: controller.registerFormKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  //DropdownButton(items: items, onChanged: onChanged),
                  Text("chọn khoa ở đây"),
                  Text("chọn bộ môn tại đây"),
                  TextFormField(
                    validator: (value) {
                      return validate.validateEmail(value);
                    },
                    controller: controller.emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      return validate.validateText(value, "Họ và Tên");
                    },
                    controller: controller.fullNameController,
                    decoration: InputDecoration(
                      hintText: 'Họ và Tên',
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      return validate.validatePass(value);
                    },
                    controller: controller.passwordController,
                    decoration: InputDecoration(
                      hintText: 'Nhập mật khẩu',
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      return validate.validateConfirmPass(
                          value, controller.passwordController.text);
                    },
                    decoration: InputDecoration(
                      hintText: 'Nhập lại mật khẩu',
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      controller.onSubmit();
                    },
                    child: Text("Đăng kí"),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
