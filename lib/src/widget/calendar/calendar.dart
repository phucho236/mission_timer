import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mission_timer/core/helper/extension/date_time_extension.dart';

import 'package:mission_timer/core/helper/toast/toast.dart';
import 'package:mission_timer/core/helper/utils/app_colors.dart';
import 'package:mission_timer/core/helper/utils/base64.dart';
import 'package:mission_timer/core/helper/utils/const.dart';
import 'package:mission_timer/core/helper/utils/theme_data.dart';
import 'package:mission_timer/core/helper/utils/util.dart';
import 'package:mission_timer/core/model/task_model.dart';
import 'package:mission_timer/src/widget/calendar/calendar_controller.dart';
import 'package:mission_timer/src/widget/calendar/calendar_mixin.dart';
import 'package:mission_timer/src/widget/dialog/change_status_task/change_status_task_body.dart';
import 'package:mission_timer/src/widget/dialog/check_in/check_in.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar>
    with ThemeDataMixin, CalendarMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<CalendarController>(
            init: CalendarController(),
            id: '/calendar',
            builder: (calendarCtr) {
              bool buildmakersed = false;
              return TableCalendar<TaskModel>(
                availableCalendarFormats: {
                  CalendarFormat.month: 'week'.tr,
                  CalendarFormat.twoWeeks: 'month'.tr,
                  CalendarFormat.week: '2 ' + 'week'.tr
                },
                calendarBuilders: CalendarBuilders(
                    singleMarkerBuilder: (context, dateTime, taskModel) =>
                        calendarMaker(calendarCtr, () {
                          buildmakersed = true;
                        }, buildmakersed, dateTime, taskModel)),
                locale: Get.locale!.languageCode,
                firstDay: calendarCtr.firstDay,
                lastDay: calendarCtr.lastDay,
                focusedDay: calendarCtr.focusedDay,
                selectedDayPredicate: (day) =>
                    isSameDay(calendarCtr.selectedDay, day),
                rangeStartDay: calendarCtr.rangeStart,
                rangeEndDay: calendarCtr.rangeEnd,
                calendarFormat: calendarCtr.calendarFormat,
                rangeSelectionMode: calendarCtr.rangeSelectionMode,
                eventLoader: calendarCtr.getEventsForDay,
                startingDayOfWeek: StartingDayOfWeek.monday,
                calendarStyle: CalendarStyle(
                  outsideDaysVisible: false,
                  markersMaxCount: 3,
                ),
                onDaySelected: calendarCtr.onDaySelected,
                onRangeSelected: calendarCtr.onRangeSelected,
                onFormatChanged: (format) => calendarCtr.changeFormat(format),
                onPageChanged: (focusedDay) =>
                    calendarCtr.onPageChanged(focusedDay),
              );
            }),
        const SizedBox(height: 8.0),
        Expanded(child: SingleChildScrollView(child: BuildPanelList())),
      ],
    );
  }
}

class BuildPanelList extends StatelessWidget with ThemeDataMixin {
  const BuildPanelList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalendarController>(
      id: '/events',
      builder: (controller) {
        return Column(
          children: List.generate(
            controller.selectedTasks.length,
            (index) {
              StatusTask statusEnum = StatusTask.values.firstWhere((e) =>
                  e.toString() ==
                  'StatusTask.' + controller.selectedTasks[index].status!);
              final TaskModel taskModel = controller.selectedTasks[index];
              return ExpansionPanelCustom(
                headerBuilder: TaskWidget(
                  statusEnum,
                  taskModel,
                  () {
                    controller.updateExpanded(index, taskModel.isExpanded);
                  },
                ),
                body: Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${taskModel.task!.startDate!.toLocal().getTime()}-',
                              style: textTheme.bodyLarge,
                            ),
                            Text(
                              '${taskModel.task!.endDate!.toLocal().getTime()}',
                              style: textTheme.bodyLarge,
                            ),
                            taskModel.imageBase64 != null &&
                                    taskModel.imageBase64!.isNotEmpty
                                ? Container(
                                    child: Image.memory(
                                      Base64.decode(taskModel.imageBase64!),
                                    ),
                                  )
                                : SizedBox()
                          ],
                        ),
                        Text(
                          "${'status'.tr}: ${getNameStatusTask(taskModel.status!)}",
                          style: textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
                isExpanded: taskModel.isExpanded,
              );
            },
          ),
        );
      },
    );
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
            Visibility(
              visible: taskModel.task!.endDate!
                          .subtract(Duration(minutes: 15))
                          .millisecondsSinceEpoch <
                      DateTime.now().millisecondsSinceEpoch &&
                  taskModel.status == StatusTask.accept.name,
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
