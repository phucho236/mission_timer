import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:mission_timer/core/helper/utils/app_colors.dart';
import 'package:table_calendar/table_calendar.dart';

/// Example event class.
class Event {
  final String title;
  final Color? color;
  final int index;
  const Event(this.title, this.index, {this.color});

  @override
  String toString() => title;
}

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = Map.fromIterable(List.generate(20, (index) => index),
    key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
    value: (item) => List.generate(
        item % 4 + 1,
        (index) =>
            Event('Event $item | ${index + 1}', index, color: ColorsApp.blue)))
  ..addAll({
    kToday: [
      Event('Today\'s Event 1', 0, color: ColorsApp.red),
      Event('Today\'s Event 2', 1, color: ColorsApp.gray),
      Event('Today\'s Event 1', 2, color: ColorsApp.red),
      Event('Today\'s Event 2', 3, color: ColorsApp.gray),
      Event('Today\'s Event 1', 4, color: ColorsApp.red),
      Event('Today\'s Event 2', 5, color: ColorsApp.gray),
    ],
  });

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
