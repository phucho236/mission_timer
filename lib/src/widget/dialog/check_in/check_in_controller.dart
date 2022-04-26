import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mission_timer/core/helper/toast/toast.dart';
import 'package:mission_timer/core/helper/utils/base64.dart';
import 'package:mission_timer/core/helper/utils/const.dart';
import 'package:mission_timer/core/model/task_model.dart';
import 'package:mission_timer/src/widget/calendar/calendar_controller.dart';

class CheckInController extends GetxController {
  CalendarController calendarController = Get.find<CalendarController>();
  bool isLoading = false;
  TaskModel? task;
  XFile? image;
  final ImagePicker _picker = ImagePicker();
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void onSave(String id) async {
    isLoading = true;
    update(['/button_save']);
    if (image == null) {
      Toast().showToat('pl_choose_image'.tr);
      isLoading = false;
      update(['/button_save']);
      return;
    }
    calendarController.homeController.updateStatusTask(id, () {
      isLoading = false;
      update(['/button_save']);
      Get.back();

      if (calendarController.selectedDay != null) {
        calendarController.selectedTasks =
            calendarController.getEventsForDay(calendarController.selectedDay!);
      }
      if (calendarController.rangeStart != null &&
          calendarController.rangeEnd != null) {
        calendarController.selectedTasks = calendarController.getEventsForRange(
            calendarController.rangeStart!, calendarController.rangeEnd!);
      }
      calendarController.update(['/events', '/calendar']);
    }, StatusTask.done, image: Base64.encode(await image!.readAsBytes()));
  }

  brainImage(context) async {
    return showModalBottomSheet<XFile?>(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.camera),
              title: Text("Camera"),
              onTap: () async {
                image = await _picker.pickImage(
                    source: ImageSource.camera, imageQuality: 20);

                Get.back();
                update(['/checkin']);
              },
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text("Gallery"),
              onTap: () async {
                image = await _picker.pickImage(
                    source: ImageSource.gallery, imageQuality: 20);

                Get.back();
                update(['/checkin']);
              },
            )
          ],
        );
      },
    );
  }
}
