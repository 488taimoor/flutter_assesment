import 'dart:ui';

/// A workout that can be assigned to a training day.
class TrainingWorkout {
  const TrainingWorkout({
    required this.id,
    required this.name,
    required this.category,
    required this.categoryColor,
    required this.categoryTextColor,
    required this.categoryIconAsset,
    required this.durationMin,
    required this.durationMax,
  });

  final String id;
  final String name;
  final String category;
  final Color categoryColor;
  final Color categoryTextColor;
  final String categoryIconAsset;
  final int durationMin;
  final int durationMax;

  String get durationLabel => '${durationMin}m - ${durationMax}m';

  int get totalMinutes => durationMax;
}
