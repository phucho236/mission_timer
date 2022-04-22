import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mission_timer/core/helper/utils/theme_data.dart';
import 'package:mission_timer/src/screen/auth/firt_change_pass/confirm_pass/first_change_pass_controller.dart';

import 'package:mission_timer/src/widget/base_layout/base_layout_auth.dart';
import 'package:mission_timer/src/widget/button_custom.dart';
import 'package:mission_timer/src/widget/text_field_custom.dart';

class FirstChangePassScreen extends StatefulWidget {
  static const String router = "/FirstChangePassScreen";
  @override
  _FirstChangePassScreenState createState() => _FirstChangePassScreenState();
}

class _FirstChangePassScreenState extends State<FirstChangePassScreen>
    with ThemeDataMixin {
  @override
  Widget build(BuildContext context) {
    return BaseLayoutAuth(
      titleForm: 'change_pass'.tr.toUpperCase(),
      turnOnBack: true,
      child: GetBuilder<FirstChangePassController>(
        init: FirstChangePassController(),
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
                        textEditingController: ct.oldpassEditingController,
                        validate: (value) => ct.validate.validateConfirmPass(
                            value, ct.oldpassEditingController.text),
                        hint: 'old_pass'.tr,
                      ),
                      TextFieldCustom(
                        textEditingController: ct.newpassEditingController,
                        validate: (value) => ct.validate.validatePass(value),
                        hint: 'new_pass'.tr,
                      ),
                      TextFieldCustom(
                        textEditingController: ct.confirmPassEditingController,
                        validate: (value) => ct.validate.validateConfirmPass(
                            value, ct.newpassEditingController.text),
                        hint: 'confirm_password'.tr,
                      ),
                    ],
                  ),
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
          );
        },
      ),
    );
  }
}
