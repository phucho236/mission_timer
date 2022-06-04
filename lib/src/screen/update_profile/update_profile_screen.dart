import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mission_timer/core/helper/validate/validate.dart';
import 'package:mission_timer/src/screen/update_profile/profile_controller.dart';
import 'package:mission_timer/src/widget/avatar.dart';
import 'package:mission_timer/src/widget/base_layout/base_layout.dart';
import 'package:mission_timer/src/widget/button_custom.dart';
import 'package:mission_timer/src/widget/text_field_custom.dart';

class UpdateProfileScreen extends StatelessWidget {
  static const String router = "/UpdateProfileScreen";
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      turnOnBack: true,
      titleForm: 'profile'.tr,
      child: GetBuilder<ProfileController>(
          init: ProfileController(),
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: controller.formKeyUpdateProfile,
                child: Column(
                  children: [
                    MaterialButton(
                      onPressed: () => controller.brainImage(context),
                      child: Container(
                        height: 140,
                        width: 140,
                        child: Stack(
                          children: [
                            Avatar(),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.image),
                                  Icon(Icons.camera),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Email'),
                        ),
                        Expanded(
                          child: TextFieldCustom(
                            validate: (value) {
                              return Validate().validateEmail(value);
                            },
                            hint: 'example@gmail.com'.tr,
                            textEditingController: controller.email,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('phone'.tr),
                        ),
                        Expanded(
                          child: TextFieldCustom(
                            validate: (value) {
                              return Validate().validatePhoneNumber(value);
                            },
                            hint: 'xxxx xxx xxx'.tr,
                            textEditingController: controller.phone,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('address'.tr),
                        ),
                        Expanded(
                          child: TextFieldCustom(
                            validate: (value) {
                              Validate().validateText(value, 'address'.tr);
                            },
                            hint: 'xxx Le Trong Tan, ...'.tr,
                            textEditingController: controller.address,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 250,
                      child: ButtonCustom(
                        content: 'save'.tr,
                        onPressed: () {
                          controller.updateProfile();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
