/// Represents a single workout entry.
class WorkoutModel {
  const WorkoutModel({
    required this.name,
    required this.date,
    required this.durationMin,
    required this.durationMax,
  });

  final String name;
  final DateTime date;
  final int durationMin;
  final int durationMax;

  String get formattedDate =>
      '${_monthName(date.month)} ${date.day}';

  String get durationLabel => '${durationMin}m - ${durationMax}m';

  static String _monthName(int month) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December',
    ];
    return months[month - 1];
  }
}
