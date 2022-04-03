import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mission_timer/core/helper/utils/theme_data.dart';
import 'package:mission_timer/src/screen/auth/login/login_controller.dart';
import 'package:mission_timer/src/widget/base_layout/base_layout_auth.dart';
import 'package:mission_timer/src/widget/button_custom.dart';
import 'package:mission_timer/src/widget/dropdow_language.dart';
import 'package:mission_timer/src/widget/text_field_custom.dart';

class LoginScreen extends StatefulWidget {
  static const String router = "/LoginScreen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ThemeDataMixin {
  @override
  Widget build(BuildContext context) {
    return BaseLayoutAuth(
      titleForm: 'login'.tr.toUpperCase(),
      child: GetBuilder<LoginController>(
        init: LoginController(),
        builder: (ct) {
          return Form(
            key: ct.formKeyLoginController,
            child: Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextFieldCustom(
                            textEditingController: ct.idEditingController,
                            validate: (value) => ct.validate
                                .validateTextNumber(value, 'id_teacher'.tr),
                            hint: 'id_teacher'.tr,
                          ),
                          TextFieldCustom(
                            textEditingController: ct.passController,
                            validate: (value) =>
                                ct.validate.validateText(value, 'password'.tr),
                            hint: 'password'.tr,
                          ),
                          SizedBox(height: 30),
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
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      onChild: Positioned(
        right: 10,
        bottom: 10,
        child: Row(
          children: [
            Icon(Icons.language_outlined),
            SizedBox(
              width: 10,
            ),
            DropDownLanguage(),
          ],
        ),
      ),
    );
  }
}
