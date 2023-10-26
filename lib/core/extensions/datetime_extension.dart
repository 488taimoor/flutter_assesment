import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/l10n/app_localizations_extension.dart';

extension DateTimeExtension on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  bool isToday() {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  DateTime appendTimeOfDay(TimeOfDay timeOfDay) {
    return DateTime(
      year,
      month,
      day,
      timeOfDay.hour,
      timeOfDay.minute,
    );
  }

  bool? isAfterOrEqualTo(DateTime dateTime) {
    final isAtSameMomentAs = dateTime.isAtSameMomentAs(this);
    return isAtSameMomentAs | isAfter(dateTime);
  }

  String? formatDateToString({String? format}) {
    var outputFormat = DateFormat(format ?? 'dd MMMM, yyyy');
    var outputDate = outputFormat.format(this);
    return outputDate.toString();
  }

  bool? isBeforeOrEqualTo(DateTime dateTime) {
    final isAtSameMomentAs = dateTime.isAtSameMomentAs(this);
    return isAtSameMomentAs | isBefore(dateTime);
  }

  String formatDayWiseWithTime(BuildContext context) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(const Duration(days: 1));

    if (isAtSameMomentAs(today)) {
      /// Today
      final formattedTime = DateFormat('hh:mm a').format(this);
      return '${"Today at"} $formattedTime';
    } else if (isAtSameMomentAs(tomorrow)) {
      /// Tomorrow
      final formattedDate = DateFormat('dd MMMM, yyyy').format(this);
      return '${"Tomorrow"} $formattedDate';
    } else {
      /// Other days
      final formattedDateTime =
          DateFormat('dd MMMM, yyyy hh:mm a').format(this);
      return formattedDateTime;
    }
  }

  String formatDayWise(BuildContext context) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(const Duration(days: 1));

    if (isAtSameMomentAs(today)) {
      return 'Today';
    } else if (isAtSameMomentAs(tomorrow)) {
      return 'Tomorrow';
    } else {
      return DateFormat('dd MMMM, yyyy').format(this);
    }
  }

  bool? isBetween(
    DateTime startDateTime,
    DateTime endDateTime,
  ) {
    final isAfter = isAfterOrEqualTo(startDateTime) ?? false;
    final isBefore = isBeforeOrEqualTo(endDateTime) ?? false;
    return isAfter && isBefore;
  }

  String toFormattedDateString() {
    var outputFormat = DateFormat('yyyy-MM-dd');
    var outputDate = outputFormat.format(this);
    return outputDate.toString();
  }
}
