import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../core/constants/app_spacing.dart';
import '../models/training_day.dart';
import '../provider/plan_provider.dart';
import 'workout_drag_card.dart';

/// A single day row in the training calendar.
///
/// Shows day name + date on the left, and either an empty slot
/// or a draggable workout card. Acts as a [DragTarget] to receive
/// workouts dropped from other days.
class DayRow extends StatelessWidget {
  const DayRow({
    super.key,
    required this.day,
    required this.weekIndex,
    required this.dayIndex,
  });

  final TrainingDay day;
  final int weekIndex;
  final int dayIndex;

  @override
  Widget build(BuildContext context) {
    return DragTarget<Map<String, int>>(
      onWillAcceptWithDetails: (details) => true,
      onAcceptWithDetails: (details) {
        final from = details.data;
        context.read<PlanProvider>().moveWorkout(
              fromWeekIndex: from['weekIndex']!,
              fromDayIndex: from['dayIndex']!,
              toWeekIndex: weekIndex,
              toDayIndex: dayIndex,
            );
      },
      builder: (context, candidateData, rejectedData) {
        final isHovering = candidateData.isNotEmpty;

        return Container(
          decoration: BoxDecoration(
            border: isHovering
                ? Border.all(color: AppColors.teal, width: 1.5)
                : null,
            borderRadius: BorderRadius.circular(AppSpacing.cardRadiusSm),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg,
                  vertical: AppSpacing.sm,
                ),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Day label + date
                    SizedBox(
                      // width: 50,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            day.dayName,
                            style: AppTextStyles.bodyMedium.copyWith(
                              fontWeight: FontWeight.w700,
                              height: 16.8 / 14,
                              color: day.hasWorkout
                                  ? AppColors.textPrimary
                                  : AppColors.textTertiary,
                            ),
                          ),
                          Text(
                            '${day.date}',
                            style: AppTextStyles.bodyLarge.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              height: 24 / 20,
                              color: day.hasWorkout
                                  ? AppColors.textPrimary
                                  : AppColors.textTertiary,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 12),

                    // Workout card
                    if (day.hasWorkout)
                      Expanded(
                        child: WorkoutDragCard(
                          workout: day.workout!,
                          weekIndex: weekIndex,
                          dayIndex: dayIndex,
                        ),
                      ),
                  ],
                ),
              ),

              // Divider under every day
              const Divider(
                color: AppColors.divider,
                height: 1,
                indent: AppSpacing.lg,
                endIndent: AppSpacing.lg,
              ),
            ],
          ),
        );
      },
    );
  }
}
