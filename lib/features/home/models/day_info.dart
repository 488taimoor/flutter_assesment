import 'dart:ui';

/// Represents a single day in the weekly calendar strip.
class DayInfo {
  const DayInfo({
    required this.label,
    required this.date,
    this.activityColors = const [],
  });

  final String label;
  final int date;

  /// List of colored dots shown below the day circle.
  /// Each color represents a different activity type.
  final List<Color> activityColors;
}
