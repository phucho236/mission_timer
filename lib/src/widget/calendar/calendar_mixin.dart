import 'package:flutter/material.dart';
import 'package:mission_timer/core/helper/extension/date_time_extension.dart';
import 'package:mission_timer/core/helper/utils/app_colors.dart';
import 'package:mission_timer/core/helper/utils/const.dart';
import 'package:mission_timer/core/model/task_model.dart';
import 'package:mission_timer/src/widget/calendar/calendar_controller.dart';

mixin CalendarMixin {
  Widget? calendarMaker(CalendarController controller, Function changeBuildMaker,bool buildmakersed,
      DateTime dateTime, TaskModel taskmodel) {
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
