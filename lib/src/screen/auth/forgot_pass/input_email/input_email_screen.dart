import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mission_timer/core/helper/utils/theme_data.dart';
import 'package:mission_timer/src/screen/auth/forgot_pass/input_email/input_email_controller.dart';

import 'package:mission_timer/src/widget/base_layout/base_layout_auth.dart';
import 'package:mission_timer/src/widget/button_custom.dart';
import 'package:mission_timer/src/widget/text_field_custom.dart';

class InputEmailScreen extends StatefulWidget {
  static const String router = "/InputMailScreen";
  @override
  _InputEmailScreenState createState() => _InputEmailScreenState();
}

class _InputEmailScreenState extends State<InputEmailScreen>
    with ThemeDataMixin {
  @override
  Widget build(BuildContext context) {
    return BaseLayoutAuth(
      titleForm: 'forgot_pass'.tr.toUpperCase(),
      turnOnBack: true,
      child: GetBuilder<InputEmailController>(
          init: InputEmailController(),
          builder: (ct) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                key: ct.formKeyInputEmailController,
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFieldCustom(
                          textEditingController: ct.emailEditingController,
                          validate: (value) => ct.validate.validateEmail(value),
                          hint: 'email'.tr,
                        ),
                        SizedBox(height: 30),
                        Container(
                          width: 250,
                          child: ButtonCustom(
                            content: 'submit'.tr,
                            onPressed: () {
                              ct.submit();
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
