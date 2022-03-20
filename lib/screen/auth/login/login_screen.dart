import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mission_timer/screen/auth/login/login_controller.dart';

import 'package:mission_timer/utils/theme_data.dart';
import 'package:mission_timer/widget/base_layout/base_layout.dart';

import 'package:mission_timer/widget/button_custom.dart';
import 'package:mission_timer/widget/text_field_custom.dart';

class LoginScreen extends StatefulWidget {
  static const String router = "/LoginScreen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ThemeDataMixin {
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: GetBuilder<LoginController>(
        init: LoginController(),
        builder: (ct) {
          return Form(
            key: ct.formKeyLoginController,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'login'.tr.toUpperCase(),
                                style: textTheme.headline6!,
                              ),
                            ),
                            TextFieldCustom(
                              textEditingController: ct.passController,
                              validate: (value) => ct.validate
                                  .validateTextNumber(value, 'id_teacher'.tr),
                              hint: 'id_teacher'.tr,
                            ),
                            TextFieldCustom(
                              textEditingController: ct.idEditingController,
                              validate: (value) => ct.validate
                                  .validateTextNumber(value, 'password'.tr),
                              hint: 'password'.tr,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 250,
                        child: ButtonCustom(
                          content: 'login'.tr,
                          onPressed: () {
                            ct.login();
                          },
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          return ct.inputMail();
                        },
                        child: Text(
                          'forgot_pass'.tr,
                          style: textTheme.bodyText1,
                        ),
                      )
                    ],
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
