import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mission_timer/core/helper/strorage/strorage.dart';
import 'package:mission_timer/core/helper/toast/toast.dart';
import 'package:mission_timer/core/model/user_model.dart';
import 'package:mission_timer/core/services/firebase_storege_service.dart';
import 'package:mission_timer/src/repositories/user/user_repository.dart';

class ProfileController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController email = TextEditingController();
  XFile? avatar;
  late UserModel? userModel;
  final UserRepository ur = UserRepository();
  final formKeyUpdateProfile = GlobalKey<FormState>();
  @override
  void onInit() {
    super.onInit();
    userModel = Get.find<Strorage>().getUserModel!;
    address.text = userModel?.address ?? "";
    phone.text = userModel?.phone ?? "";
    email.text = userModel?.email ?? "";
  }

  getProfile() async {
    UserModel? respone = await ur.getProfile();
    Get.find<Strorage>().saveUserModel(respone);
  }

  void updateProfile() async {
    String? urlAvatar;
    if (avatar != null) {
      urlAvatar =
          await Get.find<FirebaseStorageService>().putPhoto(File(avatar!.path));
    }
    bool validate = formKeyUpdateProfile.currentState!.validate();
    if (validate) {
      bool? respone = await ur.updateProfile(
          address: address.text,
          phone: phone.text,
          avatar: urlAvatar,
          email: email.text);
      if (respone == true) {
        Toast().showToat('succses'.tr);
        getProfile();
      }
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
