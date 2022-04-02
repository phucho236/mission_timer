import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mission_timer/core/helper/utils/theme_data.dart';
import 'package:mission_timer/src/screen/auth/forgot_pass/confirm_pass/confirm_pass_controller.dart';

import 'package:mission_timer/src/widget/base_layout/base_layout_auth.dart';
import 'package:mission_timer/src/widget/button_custom.dart';
import 'package:mission_timer/src/widget/text_field_custom.dart';

class ConfirmPassScreen extends StatefulWidget {
  static const String router = "/ConfirmPassScreen";
  @override
  _ConfirmPassScreenState createState() => _ConfirmPassScreenState();
}

class _ConfirmPassScreenState extends State<ConfirmPassScreen>
    with ThemeDataMixin {
  @override
  Widget build(BuildContext context) {
    return BaseLayoutAuth(
      titleForm: 'forgot_pass'.tr.toUpperCase(),
      turnOnBack: true,
      child: GetBuilder<ConfirmPassController>(
        init: ConfirmPassController(),
        builder: (ct) {
          return Form(
            key: ct.formKeyConfirmPassController,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      TextFieldCustom(
                        textEditingController: ct.passEditingController,
                        validate: (value) => ct.validate.validatePass(value),
                        hint: 'password'.tr,
                      ),
                      TextFieldCustom(
                        textEditingController: ct.confirmPassEditingController,
                        validate: (value) => ct.validate.validateConfirmPass(
                            value, ct.passEditingController.text),
                        hint: 'confirm_password'.tr,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: 250,
                  child: ButtonCustom(
                    content: 'login'.tr,
                    onPressed: () {
                      ct.submit();
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
