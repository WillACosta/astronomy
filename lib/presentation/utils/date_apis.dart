extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) =>
      year == other.year && month == other.month && day == other.day;
}
