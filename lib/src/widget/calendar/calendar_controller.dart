import 'package:mission_timer/core/model/task_model.dart';
import 'package:mission_timer/src/screen/home/home_screen_controller.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarController extends GetxController {
  HomeScreenController homeController = Get.find<HomeScreenController>();
  late List<TaskModel> selectedTasks;
  CalendarFormat calendarFormat = CalendarFormat.month;
  RangeSelectionMode rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
  DateTime? rangeStart;
  DateTime? rangeEnd;
  late DateTime today;
  late DateTime firstDay;
  late DateTime lastDay;
  int? oldIndexExpand;
  @override
  void onInit() {
    super.onInit();
    today = DateTime.now();
    firstDay = DateTime(today.year, today.month - 3, today.day);
    lastDay = DateTime(today.year, today.month + 3, today.day);
    selectedDay = focusedDay;
    selectedTasks = getEventsForDay(selectedDay!);
  }

  @override
  void onClose() {
    super.onClose();
  }

  List<TaskModel> getEventsForDay(DateTime day) {
    oldIndexExpand = null;
    return homeController.taskHashMap?[day] ?? [];
  }

  void updateExpanded(int index, bool isExpanded) {
    if (oldIndexExpand != null && oldIndexExpand != index) {
      selectedTasks[oldIndexExpand!].isExpanded = false;
    }
    selectedTasks[index].isExpanded = !isExpanded;
    update(['/events']);
    oldIndexExpand = index;
  }

  List<TaskModel> getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);
    return [
      for (final d in days) ...getEventsForDay(d),
    ];
  }

  void onDaySelected(DateTime selectedDayTMP, DateTime focusedDayTMP) {
    if (oldIndexExpand != null) {
      selectedTasks[oldIndexExpand!].isExpanded = false;
    }
    if (!isSameDay(selectedDay, selectedDayTMP)) {
      selectedDay = selectedDayTMP;
      focusedDay = focusedDayTMP;
      rangeStart = null; // Important to clean those
      rangeEnd = null;
      rangeSelectionMode = RangeSelectionMode.toggledOff;
      selectedTasks = getEventsForDay(selectedDayTMP);
      update(['/calendar', '/events']);
    }
  }

  void changeFormat(format) {
    if (calendarFormat != format) {
      calendarFormat = format;
      update(['/calendar']);
    }
  }

  void onPageChanged(focusedDayTmp) {
    focusedDay = focusedDayTmp;
  }

  List<DateTime> daysInRange(DateTime first, DateTime last) {
    final dayCount = last.difference(first).inDays + 1;
    return List.generate(
      dayCount,
      (index) => DateTime.utc(first.year, first.month, first.day + index),
    );
  }

  void onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    selectedDay = null;
    focusedDay = focusedDay;
    rangeStart = start;
    rangeEnd = end;
    rangeSelectionMode = RangeSelectionMode.toggledOn;

    update(['/calendar', '/events']);
    if (start != null && end != null) {
      selectedTasks = getEventsForRange(start, end);
    } else if (start != null) {
      selectedTasks = getEventsForDay(start);
    } else if (end != null) {
      selectedTasks = getEventsForDay(end);
    }
  }
}
