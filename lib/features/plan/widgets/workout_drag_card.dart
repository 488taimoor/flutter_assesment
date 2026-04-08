import 'package:flutter/material.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';
import '../models/training_workout.dart';

/// A draggable workout card with drag handle, category tag, name, and duration.
///
/// Uses [LongPressDraggable] so users can long-press and drag
/// the card to reorder workouts across days.
class WorkoutDragCard extends StatelessWidget {
  const WorkoutDragCard({
    super.key,
    required this.workout,
    required this.weekIndex,
    required this.dayIndex,
  });

  final TrainingWorkout workout;
  final int weekIndex;
  final int dayIndex;

  @override
  Widget build(BuildContext context) {
    final data = {'weekIndex': weekIndex, 'dayIndex': dayIndex};

    return LongPressDraggable<Map<String, int>>(
      data: data,
      feedback: Material(
        color: Colors.transparent,
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.75,
          child: Opacity(
            opacity: 0.85,
            child: _CardContent(workout: workout),
          ),
        ),
      ),
      childWhenDragging: Opacity(
        opacity: 0.3,
        child: _CardContent(workout: workout),
      ),
      child: _CardContent(workout: workout),
    );
  }
}

/// Inner card content — pixel-perfect match to Figma reference.
class _CardContent extends StatelessWidget {
  const _CardContent({required this.workout});

  final TrainingWorkout workout;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(14),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // White left bar — rounded with the card's top-left & bottom-left
            Container(
              width: 4,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14),
                  bottomLeft: Radius.circular(14),
                ),
              ),
            ),

            // Card content with padding
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 16,
                  top: 14,
                  bottom: 14,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Dot grid icon — aligned to top
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Image.asset(
                        'assets/Frame (1).png',
                        width: 22,
                        height: 22,
                      ),
                    ),

                    const SizedBox(width: 8),

                    // Category tag + workout name
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Category tag
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: workout.categoryColor,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  workout.categoryIconAsset,
                                  width: 14,
                                  height: 14,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  workout.category,
                                  style: AppTextStyles.bodySmall.copyWith(
                                    color: workout.categoryTextColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 6),

                          // Workout name
                          Text(
                            workout.name,
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: const Color(0xFFFBFBFB),
                              height: 16.8 / 14,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Duration — vertically centered
                    Text(
                      workout.durationLabel,
                      style: AppTextStyles.bodySmall.copyWith(fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
