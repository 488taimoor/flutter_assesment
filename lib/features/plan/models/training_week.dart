import 'training_day.dart';

/// A week in the training calendar containing 7 days.
class TrainingWeek {
  TrainingWeek({
    required this.weekNumber,
    required this.totalWeeks,
    required this.dateRange,
    required this.days,
  });

  final int weekNumber;
  final int totalWeeks;
  final String dateRange;
  final List<TrainingDay> days;

  /// Sum of all workout durations (max) in this week.
  int get totalMinutes => days.fold(
        0,
        (sum, day) => sum + (day.workout?.totalMinutes ?? 0),
      );
}
