import 'package:flutter/material.dart';
import 'package:mission_timer/core/helper/extension/date_time_extension.dart';
import 'package:mission_timer/core/helper/utils/app_colors.dart';
import 'package:mission_timer/core/helper/utils/const.dart';
import 'package:mission_timer/core/helper/utils/util.dart';
import 'package:mission_timer/core/model/task_model.dart';
import 'package:mission_timer/src/widget/calendar/calendar_controller.dart';
import 'package:mission_timer/src/widget/dialog/change_status_task/change_status_task_body.dart';
import 'package:mission_timer/src/widget/dialog/check_in/check_in.dart';
import 'package:get/get.dart';

mixin CalendarMixin {
  Widget? calendarMaker(
      CalendarController controller,
      Function changeBuildMaker,
      bool buildmakersed,
      DateTime dateTime,
      TaskModel taskmodel) {
    if (controller.getEventsForDay(dateTime).length >= 3) {
      final firstDay =
          controller.getEventsForDay(dateTime).first.task!.startDate!;
      if (firstDay.isEqua(
            taskmodel.task!.startDate!,
          ) &&
          !buildmakersed) {
        changeBuildMaker();

        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [ColorsApp.blue, ColorsApp.red],
            ),
          ),
          height: 8,
          width: 40,
        );
      } else {
        return SizedBox();
      }
    }

    StatusTask statusEnum = StatusTask.values
        .firstWhere((e) => e.toString() == 'StatusTask.' + taskmodel.status!);
    switch (statusEnum) {
      case StatusTask.notAnswered:
        return Container(
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            color: ColorsApp.getColorStatusTask(statusEnum),
            shape: BoxShape.circle,
          ),
        );

      case StatusTask.accept:
        return Container(
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            color: ColorsApp.getColorStatusTask(statusEnum),
            shape: BoxShape.circle,
          ),
        );

      case StatusTask.incomplete:
        return Container(
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            color: ColorsApp.getColorStatusTask(statusEnum),
            shape: BoxShape.circle,
          ),
        );

      case StatusTask.refuse:
        return Container(
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            color: ColorsApp.getColorStatusTask(statusEnum),
            shape: BoxShape.circle,
          ),
        );

      case StatusTask.done:
        return Container(
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            color: ColorsApp.getColorStatusTask(statusEnum),
            shape: BoxShape.circle,
          ),
        );

      default:
        return Container(
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            color: ColorsApp.getColorStatusTask(statusEnum),
            shape: BoxShape.circle,
          ),
        );
    }
  }
}

class ExpansionPanelCustom extends StatefulWidget {
  ExpansionPanelCustom(
      {required this.headerBuilder,
      required this.body,
      this.isExpanded = false,
      Key? key})
      : super(key: key);
  final Widget headerBuilder;
  final Widget body;
  final bool isExpanded;
  @override
  State<ExpansionPanelCustom> createState() => _ExpansionPanelCustomState();
}

class _ExpansionPanelCustomState extends State<ExpansionPanelCustom> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.headerBuilder,
        widget.isExpanded ? widget.body : SizedBox(),
      ],
    );
  }
}

class TaskWidget extends StatelessWidget {
  const TaskWidget(this.statusEnum, this.taskModel, this.onTap, {Key? key})
      : super(key: key);
  final StatusTask statusEnum;
  final TaskModel taskModel;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 4.0,
      ),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        horizontalTitleGap: 5,
        minLeadingWidth: 0,
        minVerticalPadding: 0,
        leading: Container(
          margin: EdgeInsets.all(1),
          decoration: BoxDecoration(
            // border: Border.all(),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            color: ColorsApp.getColorStatusTask(statusEnum),
          ),
          width: 25,
        ),
        onTap: onTap,
        title: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '${taskModel.task!.activity!.title}',
                ),
                Text('${taskModel.task!.description}')
              ],
            ),
            Visibility(
              visible: taskModel.status == "notAnswered" &&
                  taskModel.task!.startDate!.isAfter(DateTime.now()),
              child: Align(
                alignment: Alignment.centerRight,
                child: Transform.scale(
                  scale: 0.9,
                  child: IconButton(
                    onPressed: () {
                      Utils.showMyDialog(
                        context,
                        content: ChangeStatusTask(
                          task: taskModel,
                        ),
                        title: 'change_status'.tr,
                      );
                    },
                    icon: Icon(Icons.menu),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: Visibility(
                visible: !(taskModel.task!.startDate!.millisecondsSinceEpoch >
                        DateTime.now().millisecondsSinceEpoch &&
                    DateTime.now().millisecondsSinceEpoch <
                        taskModel.task!.endDate!.millisecondsSinceEpoch),
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(90))),
                ),
              ),
            ),
            Visibility(
              visible: taskModel.task!.endDate!
                          .subtract(Duration(minutes: 15))
                          .millisecondsSinceEpoch <
                      DateTime.now().millisecondsSinceEpoch &&
                  (taskModel.status == StatusTask.accept.name ||
                      taskModel.status == StatusTask.done.name) &&
                  taskModel.task!.endDate!
                          .add(Duration(hours: 24))
                          .millisecondsSinceEpoch >
                      DateTime.now().millisecondsSinceEpoch,
              child: Align(
                alignment: Alignment.centerRight,
                child: Transform.scale(
                  scale: 0.9,
                  child: IconButton(
                    onPressed: () {
                      Utils.showMyDialog(
                        context,
                        content: CheckIn(
                          task: taskModel,
                        ),
                        title: 'check_in'.tr,
                      );
                    },
                    icon: Icon(Icons.camera),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
