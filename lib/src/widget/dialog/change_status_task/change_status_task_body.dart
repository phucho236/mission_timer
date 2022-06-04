import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mission_timer/core/helper/utils/const.dart';
import 'package:mission_timer/core/helper/validate/validate.dart';
import 'package:mission_timer/core/model/task_model.dart';

import 'package:mission_timer/src/widget/dialog/change_status_task/change_status_task_controller.dart';
import 'package:mission_timer/src/widget/text_field_custom.dart';

class ChangeStatusTask extends StatelessWidget {
  const ChangeStatusTask({required this.task, Key? key}) : super(key: key);
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<ChageStatusTaskController>(
          init: ChageStatusTaskController(),
          id: '/change_status_dialog',
          initState: (buildComplete) {
            if (task.status == StatusTask.accept.name) {
              buildComplete.controller!.accept = true;
            }
          },
          builder: (controller) {
            return Column(
              children: [
                Row(
                  children: [
                    Checkbox(
                        value: controller.accept,
                        onChanged: controller.changeStatus),
                    Text('participation'.tr)
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                        value: !controller.accept,
                        onChanged: controller.changeStatus),
                    Text('do_not_participation'.tr)
                  ],
                ),
                !controller.accept
                    ? Form(
                        key: controller.formKeyContentDonotAccept,
                        child: TextFieldCustom(
                            validate: (text) =>
                                Validate().validateText(text, 'reason'.tr),
                            textEditingController:
                                controller.contentDonotAccept,
                            hint: 'answer_the_reason.tr'),
                      )
                    : Container(),
              ],
            );
          },
        ),
        GetBuilder<ChageStatusTaskController>(
          id: '/button_save',
          builder: (buttonController) {
            return buttonController.isLoading
                ? Container(
                    margin: EdgeInsets.all(5),
                    child: CircularProgressIndicator())
                : TextButton(
                    child: Text('save'.tr),
                    onPressed: () => buttonController.onSave(task.id!),
                  );
          },
        )
      ],
    );
  }
}
