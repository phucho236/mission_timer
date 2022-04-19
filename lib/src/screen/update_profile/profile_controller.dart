import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mission_timer/core/helper/strorage/strorage.dart';
import 'package:mission_timer/core/helper/toast/toast.dart';
import 'package:mission_timer/core/model/user_model.dart';
import 'package:mission_timer/src/repositories/user/user_repository.dart';

class ProfileController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  XFile? avatar;
  late UserModel? userModel;
  final UserRepository ur = UserRepository();
  @override
  void onInit() {
    super.onInit();
    userModel = Get.find<Strorage>().getUserModel!;
    address.text = userModel?.address ?? "";
    phone.text = userModel?.phone ?? "";
  }

  void getProfile() async {
    //  bool? respone = await ur.updateProfile(
    //     pathAvatar: avatar != null ? avatar!.path : null,
    //     address: address.text,
    //     phone: phone.text,
    //     callbackUpdate: (value) {
    //       if (value.isNotEmpty) update(value);
    //     },
    //   );
    //   if (respone == true) {
    //     Toast().showToat('succses'.tr);
    //   }
  }
  void updateProfile() async {
    if (avatar != null) {
      print(await avatar!.length());
      Toast().showToat('posting_image'.tr);
      ur
          .updateAvatar(
              path: avatar!.path,
              callbackUpdate: (value) {
                //   if (value.isNotEmpty) update(value);
              })
          ?.then(
        (value) {
          if (value == true) {
            Toast().showToat('update_avatar_success'.tr);
          }
        },
      );
    }

    bool? respone = await ur.updateProfile(
      address: address.text,
      phone: phone.text,
    );
    if (respone == true) {
      Toast().showToat('succses'.tr);
    }
  }

  void brainImage(context) async {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.camera),
              title: Text("Camera"),
              onTap: () async {
                avatar = await _picker.pickImage(
                    source: ImageSource.camera, imageQuality: 20);
                update(["/avatar"]);
                Get.back();
              },
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text("gallery"),
              onTap: () async {
                avatar = await _picker.pickImage(
                    source: ImageSource.gallery, imageQuality: 20);
                update(["/avatar"]);
                Get.back();
              },
            )
          ],
        );
      },
    );
  }
}
