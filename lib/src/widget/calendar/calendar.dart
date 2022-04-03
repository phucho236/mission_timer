import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mission_timer/core/config/language/localization_service.dart';
import 'package:mission_timer/core/helper/toast/toast.dart';
import 'package:mission_timer/core/helper/utils/util.dart';
import 'package:mission_timer/src/widget/calendar/calendar_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalendarController>(
      init: CalendarController(),
      builder: (controller) {
        return Column(
          children: [
            GetBuilder<CalendarController>(
                id: '/calendar',
                builder: (calendarCtr) {
                  return TableCalendar<Event>(
                    availableCalendarFormats: {
                      CalendarFormat.month: 'week'.tr,
                      CalendarFormat.twoWeeks: 'month'.tr,
                      CalendarFormat.week: '2 ' + 'week'.tr
                    },
                    headerStyle: HeaderStyle(),
                    locale: Get.locale != null
                        ? Get.locale!.languageCode
                        : LocalizationService.locale.languageCode,
                    firstDay: kFirstDay,
                    lastDay: kLastDay,
                    focusedDay: controller.focusedDay,
                    selectedDayPredicate: (day) =>
                        isSameDay(controller.selectedDay, day),
                    rangeStartDay: controller.rangeStart,
                    rangeEndDay: controller.rangeEnd,
                    calendarFormat: controller.calendarFormat,
                    rangeSelectionMode: controller.rangeSelectionMode,
                    eventLoader: controller.getEventsForDay,
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    calendarStyle: CalendarStyle(
                      outsideDaysVisible: false,
                    ),
                    onDaySelected: controller.onDaySelected,
                    onRangeSelected: controller.onRangeSelected,
                    onFormatChanged: (format) =>
                        calendarCtr.changeFormat(format),
                    onPageChanged: (focusedDay) =>
                        controller.onPageChanged(focusedDay),
                  );
                }),
            const SizedBox(height: 8.0),
            Expanded(
              child: GetBuilder<CalendarController>(
                id: '/events',
                builder: (eventsCtr) {
                  return ListView.builder(
                    itemCount: eventsCtr.selectedEvents.length,
                    itemBuilder: (context, index) {
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
                          onTap: () => {
                            Toast().showToat(
                                '${eventsCtr.selectedEvents[index]} handle click')
                          },
                          title: Text('${eventsCtr.selectedEvents[index]}'),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}