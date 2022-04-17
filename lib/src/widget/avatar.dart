import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mission_timer/core/helper/utils/assets.dart';
import 'package:mission_timer/src/screen/update_profile/profile_controller.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      id: '/avatar',
      builder: (controller) {
        return Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            image: controller.avatar != null
                ? DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(controller.avatar!.path),
                  )
                : controller.userModel!.avatar != null
                    ? DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(controller.userModel!.avatar!))
                    : DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          Assets.user,
                        ),
                      ),
          ),
        );
      },
    );
  }
}
