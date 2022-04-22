import 'dart:collection';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mission_timer/core/helper/utils/app_colors.dart';
import 'package:mission_timer/core/model/event.dart';
import 'package:mission_timer/core/model/task_model.dart';
import 'package:mission_timer/src/repositories/user/user_repository.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreenController extends GetxController {
  UserRepository ur = UserRepository();
  Map<DateTime, List<Event>> eventSource = {};
  LinkedHashMap<DateTime, List<Event>> events = LinkedHashMap();
  void getData() async {
    List<TaskModel>? data = await ur.getTask();

    if (data != null) {
      initEventSource(data);
    }
  }

  void initEventSource(List<TaskModel> tasks) {
    eventSource = Map.fromIterable(
        List.generate(tasks.length, (index) => index),
        key: (item) => DateTime.utc(item.task.startDate.year,
            item.task.startDate.month, item.task.startDate.day),
        value: (item) => List.generate(
            tasks.length,
            (index) => Event(
                'Event ${tasks[index].task?.description} | ${index + 1}', index,
                color: ColorsApp.blue)));

    initEvents();
  }

  void initEvents() {
    events = LinkedHashMap<DateTime, List<Event>>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(eventSource);
  }
}

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
