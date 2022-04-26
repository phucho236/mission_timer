import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mission_timer/core/helper/utils/base64.dart';

import 'package:mission_timer/core/model/task_model.dart';

import 'package:mission_timer/src/widget/dialog/check_in/check_in_controller.dart';

class CheckIn extends StatelessWidget {
  const CheckIn({required this.task, Key? key}) : super(key: key);
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    // Get.put(CheckInController()).task = task;
    return Column(
      children: [
        GetBuilder<CheckInController>(
            init: CheckInController(),
            id: '/checkin',
            builder: (controller) {
              controller.task = task;
              return MaterialButton(
                onPressed: () {
                  controller.brainImage(context);
                },
                child: Container(
                  decoration: BoxDecoration(border: Border.all(width: 1)),
                  height: 300,
                  width: double.infinity,
                  child: controller.image != null
                      ? Image.file(
                          File(controller.image!.path),
                          fit: BoxFit.cover,
                        )
                      : controller.task!.imageBase64 != null &&
                              controller.task!.imageBase64!.isNotEmpty
                          ? Image.network(
                              controller.task!.imageBase64!,
                              fit: BoxFit.cover,
                            )
                          : Icon(Icons.image),
                ),
              );
            }),
        GetBuilder<CheckInController>(
          id: '/button_save',
          builder: (buttonController) {
            return buttonController.isLoading
                ? Container(
                    margin: EdgeInsets.all(5),
                    child: CircularProgressIndicator())
                : TextButton(
                    child: Text('save'.tr),
                    onPressed: () {
                      buttonController.onSave(task.id!);
                    },
                  );
          },
        )
      ],
    );
  }
}
