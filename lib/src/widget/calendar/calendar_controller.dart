import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:mission_timer/core/helper/utils/util.dart';
import 'package:mission_timer/core/model/event.dart';
import 'package:mission_timer/src/screen/home/home_screen_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarController extends GetxController {
  late List<Event> selectedEvents;
  CalendarFormat calendarFormat = CalendarFormat.month;
  RangeSelectionMode rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
  DateTime? rangeStart;
  DateTime? rangeEnd;
  @override
  void onInit() {
    super.onInit();
    selectedDay = focusedDay;
    selectedEvents = getEventsForDay(selectedDay!);
  }

  @override
  void onClose() {
    super.onClose();
  }

  List<Event> getEventsForDay(DateTime day) {
    return Get.find<HomeScreenController>().events[day] ?? [];
  }

  List<Event> getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);
    return [
      for (final d in days) ...getEventsForDay(d),
    ];
  }

  void onDaySelected(DateTime selectedDayTMP, DateTime focusedDayTMP) {
    if (!isSameDay(selectedDay, selectedDayTMP)) {
      selectedDay = selectedDayTMP;
      focusedDay = focusedDayTMP;
      rangeStart = null; // Important to clean those
      rangeEnd = null;
      rangeSelectionMode = RangeSelectionMode.toggledOff;
      selectedEvents = getEventsForDay(selectedDayTMP);
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

  void onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    selectedDay = null;
    focusedDay = focusedDay;
    rangeStart = start;
    rangeEnd = end;
    rangeSelectionMode = RangeSelectionMode.toggledOn;

    update(['/calendar', '/events']);
    if (start != null && end != null) {
      selectedEvents = getEventsForRange(start, end);
    } else if (start != null) {
      selectedEvents = getEventsForDay(start);
    } else if (end != null) {
      selectedEvents = getEventsForDay(end);
    }
  }
}
