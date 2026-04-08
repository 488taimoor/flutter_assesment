import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../models/training_day.dart';
import '../models/training_week.dart';
import '../models/training_workout.dart';

/// Manages the training calendar state including
/// workout assignments and drag-drop operations.
class PlanProvider extends ChangeNotifier {
  PlanProvider() {
    _initMockData();
  }

  List<TrainingWeek> _weeks = [];
  List<TrainingWeek> get weeks => _weeks;

  /// Moves a workout from one day to another.
  ///
  /// Swaps workouts if the target day already has one.
  void moveWorkout({
    required int fromWeekIndex,
    required int fromDayIndex,
    required int toWeekIndex,
    required int toDayIndex,
  }) {
    final fromDay = _weeks[fromWeekIndex].days[fromDayIndex];
    final toDay = _weeks[toWeekIndex].days[toDayIndex];

    // Swap workouts
    final temp = fromDay.workout;
    fromDay.workout = toDay.workout;
    toDay.workout = temp;

    notifyListeners();
  }

  void _initMockData() {
    const armBlaster = TrainingWorkout(
      id: 'w1',
      name: 'Arm Blaster',
      category: 'Arms Workout',
      categoryColor: AppColors.workoutGreenTag,
      categoryTextColor: AppColors.workoutGreenText,
      categoryIconAsset: 'assets/Frame (2).png',
      durationMin: 25,
      durationMax: 30,
    );

    const legDayBlitz = TrainingWorkout(
      id: 'w2',
      name: 'Leg Day Blitz',
      category: 'Leg Workout',
      categoryColor: AppColors.workoutPurpleTag,
      categoryTextColor: AppColors.workoutPurpleText,
      categoryIconAsset: 'assets/Frame (3).png',
      durationMin: 25,
      durationMax: 30,
    );

    _weeks = [
      TrainingWeek(
        weekNumber: 2,
        totalWeeks: 8,
        dateRange: 'December 8-14',
        days: [
          TrainingDay(dayName: 'Mon', date: 8, workout: armBlaster),
          TrainingDay(dayName: 'Tue', date: 9),
          TrainingDay(dayName: 'Wed', date: 10),
          TrainingDay(dayName: 'Thu', date: 11, workout: legDayBlitz),
          TrainingDay(dayName: 'Fri', date: 12),
          TrainingDay(dayName: 'Sat', date: 13),
          TrainingDay(dayName: 'Sun', date: 14),
        ],
      ),
      TrainingWeek(
        weekNumber: 3,
        totalWeeks: 8,
        dateRange: 'December 14-22',
        days: [
          TrainingDay(dayName: 'Mon', date: 14),
          TrainingDay(dayName: 'Tue', date: 15),
          TrainingDay(dayName: 'Wed', date: 16),
          TrainingDay(dayName: 'Thu', date: 17),
          TrainingDay(dayName: 'Fri', date: 18),
          TrainingDay(dayName: 'Sat', date: 19),
          TrainingDay(dayName: 'Sun', date: 20),
        ],
      ),
    ];
  }
}
