
import 'package:intl/intl.dart';

extension DateTimeExtention on DateTime {
  bool isSameDay(DateTime date) {
    return this.year == date.year &&
        this.month == date.month &&
        this.day == date.day;
  }

  String getTime() {
    // final f = new DateFormat('yyyy-MM-dd hh:mm');
    final f = DateFormat('HH:mm');
    return f.format(this);
  }

  bool isEqua(DateTime date) {
    return this.year == date.year &&
        this.month == date.month &&
        this.day == date.day &&
        this.hour == date.hour &&
        this.minute == date.minute &&
        this.second == date.second;
  }
}
