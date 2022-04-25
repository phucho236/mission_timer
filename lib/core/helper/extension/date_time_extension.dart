extension DateTimeExtention on DateTime {
  bool isSameDay(DateTime date) {
    return this.year == date.year &&
        this.month == date.month &&
        this.day == date.day;
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
