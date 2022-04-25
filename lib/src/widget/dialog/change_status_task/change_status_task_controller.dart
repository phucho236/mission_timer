import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mission_timer/core/helper/utils/const.dart';
import 'package:mission_timer/core/model/task_model.dart';
import 'package:mission_timer/src/widget/calendar/calendar_controller.dart';

class ChageStatusTaskController extends GetxController {
  CalendarController calendarController = Get.find<CalendarController>();
  TextEditingController contentDonotAccept = TextEditingController();
  final formKeyContentDonotAccept = GlobalKey<FormState>();
  Task? task;
  bool accept = true;
  bool isLoading = false;
  void changeStatus(value) {
    accept = !accept;
    update(['/change_status_dialog']);
  }

  void onSave(String id) {
    isLoading = true;
    update(['/button_save']);

    if (!accept) {
      bool validate = formKeyContentDonotAccept.currentState!.validate();
      if (!validate) {
        isLoading = false;
        update(['/button_save']);
        return;
      }
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
    }, accept ? StatusTask.accept : StatusTask.refuse,
        content: accept ? null : contentDonotAccept.text);
  }
}
