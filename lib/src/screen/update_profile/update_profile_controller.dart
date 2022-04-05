import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mission_timer/core/helper/strorage/strorage.dart';
import 'package:mission_timer/core/model/user_model.dart';

class UpdateProfileController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();

  XFile? avatar;
  late UserModel? userModel;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    userModel = Get.find<Strorage>().getUserModel!;
    address.text = userModel?.address ?? "";
    phone.text = userModel?.phone ?? "";
  }

  void updateProfile() {}
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
                avatar = await _picker.pickImage(source: ImageSource.camera);
                update(["/avatar"]);
              },
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text("gallery"),
              onTap: () async {
                avatar = await _picker.pickImage(source: ImageSource.gallery);
                update(["/avatar"]);
              },
            )
          ],
        );
      },
    );
  }
}
