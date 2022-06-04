import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mission_timer/core/helper/utils/theme_data.dart';
import 'package:mission_timer/src/screen/auth/pin_code_verification/pin_code_verification_controller.dart';
import 'package:mission_timer/src/widget/base_layout/base_layout_auth.dart';
import 'package:mission_timer/src/widget/button_custom.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeVerification extends StatefulWidget {
  static const String router = "/PinCodeVerification";
  @override
  _PinCodeVerificationState createState() => _PinCodeVerificationState();
}

class _PinCodeVerificationState extends State<PinCodeVerification>
    with ThemeDataMixin {
  @override
  Widget build(BuildContext context) {
    return BaseLayoutAuth(
      titleForm: 'forgot_pass'.tr.toUpperCase(),
      turnOnBack: true,
      child: GetBuilder<PinCodeVerificationController>(
          init: PinCodeVerificationController(),
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GetBuilder<PinCodeVerificationController>(
                          id: "pinCode",
                          builder: (controllerPinCode) {
                            return PinCodeTextField(
                              length: 6,
                              obscureText: false,
                              animationType: AnimationType.fade,
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(5),
                                fieldHeight: 50,
                                fieldWidth: 40,
                                activeFillColor: Colors.white,
                              ),
                              animationDuration: Duration(milliseconds: 300),
                              backgroundColor: Colors.blue.shade50,
                              enableActiveFill: true,
                              errorAnimationController:
                                  controller.errorController,
                              controller: controller.codeEditingController,
                              onCompleted: (v) {
                                controller.submit(Get.arguments);
                              },
                              beforeTextPaste: (text) {
                                print("Allowing to paste $text");
                                return true;
                              },
                              appContext: context,
                              onChanged: (String value) {},
                            );
                          }),
                      SizedBox(height: 30),
                      Container(
                        width: 250,
                        child: ButtonCustom(
                          content: 'submit'.tr,
                          onPressed: () {
                            controller.submit(Get.arguments);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
