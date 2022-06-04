import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mission_timer/core/helper/utils/theme_data.dart';
import 'package:mission_timer/src/screen/auth/forgot_pass/input_uuid/input_uuid_controller.dart';

import 'package:mission_timer/src/widget/base_layout/base_layout_auth.dart';
import 'package:mission_timer/src/widget/button_custom.dart';
import 'package:mission_timer/src/widget/text_field_custom.dart';

class InputUuIdScreen extends StatefulWidget {
  static const String router = "/InputUuIdScreen";
  @override
  _InputUuIdScreenState createState() => _InputUuIdScreenState();
}

class _InputUuIdScreenState extends State<InputUuIdScreen> with ThemeDataMixin {
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
                          textEditingController: ct.uuidEditingController,
                          validate: (value) => ct.validate
                              .validateTextNumber(value, 'user_id'.tr),
                          hint: 'user_id'.tr,
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
