import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension TimeOfDayComparison on TimeOfDay {
  TimeOfDay addMinutes(int minutesToAdd) {
    int newMinute = minute + minutesToAdd;
    int newHour = hour;
    while (newMinute >= 60) {
      newMinute -= 60;
      newHour++;
    }
    newHour %= 24; // Ensure the hour is within 24-hour format
    return TimeOfDay(hour: newHour, minute: newMinute);
  }

  String format() {
    final now = DateTime.now();
    final dateTime = DateTime(now.year, now.month, now.day, hour, minute);
    final formattedTime = DateFormat('hh:mm a').format(dateTime);
    return formattedTime;
  }

  bool isBefore(TimeOfDay other) {
    return hour < other.hour || (hour == other.hour && minute < other.minute);
  }

  bool isAfter(TimeOfDay other) {
    return hour > other.hour || (hour == other.hour && minute > other.minute);
  }

  bool isSameOrBefore(TimeOfDay other) {
    return hour < other.hour || (hour == other.hour && minute <= other.minute);
  }

  bool isSameOrAfter(TimeOfDay other) {
    return hour > other.hour || (hour == other.hour && minute >= other.minute);
  }
}
