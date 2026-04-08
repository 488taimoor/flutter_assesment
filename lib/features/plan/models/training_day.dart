import 'training_workout.dart';

/// A single day in the training calendar.
class TrainingDay {
  TrainingDay({
    required this.dayName,
    required this.date,
    this.workout,
  });

  final String dayName;
  final int date;
  TrainingWorkout? workout;

  bool get hasWorkout => workout != null;
}
