import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mission_timer/src/screen/update_profile/update_profile_controller.dart';
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
      child: GetBuilder<UpdateProfileController>(
          init: UpdateProfileController(),
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  MaterialButton(
                    onPressed: () => controller.brainImage(context),
                    child: Container(
                      height: 140,
                      width: 140,
                      child: Stack(
                        children: [
                          GetBuilder<UpdateProfileController>(
                              init: UpdateProfileController(),
                              id: '/avatar',
                              builder: (context) {
                                return Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    image: controller.avatar != null
                                        ? DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                controller.avatar!.path))
                                        : DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://scontent.fsgn2-3.fna.fbcdn.net/v/t1.6435-9/55557199_2271955539690518_7651652999973961728_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=yzHzmi2jHWIAX-k2MIr&_nc_ht=scontent.fsgn2-3.fna&oh=00_AT9kWoAeDDcgHGfySAHkcZVtchRkkA7FSSTH-QvmnL854A&oe=627123E9"),
                                          ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                );
                              }),
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
                        child: Text('phone'.tr),
                      ),
                      Expanded(
                        child: TextFieldCustom(
                          hint: 'phone'.tr,
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
                          hint: 'address'.tr,
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
            );
          }),
    );
  }
}
