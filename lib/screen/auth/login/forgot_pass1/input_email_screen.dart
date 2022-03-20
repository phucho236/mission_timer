import 'package:flutter/material.dart';
import 'package:mission_timer/screen/auth/login/forgot_pass1/input_email_controller.dart';
import 'package:mission_timer/utils/theme_data.dart';
import 'package:mission_timer/widget/base_layout/base_layout.dart';
import 'package:get/get.dart';
import 'package:mission_timer/widget/button_custom.dart';
import 'package:mission_timer/widget/text_field_custom.dart';

class InputEmailScreen extends StatefulWidget {
  static const String router = "/InputMailScreen";
  @override
  _InputEmailScreenState createState() => _InputEmailScreenState();
}

class _InputEmailScreenState extends State<InputEmailScreen>
    with ThemeDataMixin {
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      turnOnBack: true,
      child: GetBuilder<InputEmailController>(builder: (ct) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: ct.formKeyInputEmailController,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'forgot_pass'.tr.toUpperCase(),
                          style: textTheme.headline6!,
                        ),
                      ),
                      TextFieldCustom(
                        textEditingController: ct.emailEditingController,
                        validate: (value) => ct.validate.validateEmail(value),
                        hint: 'email'.tr,
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
                          content: 'submit'.tr,
                          onPressed: () {
                            ct.submit();
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
