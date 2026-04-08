import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../common/widgets/app_card.dart';
import '../../../core/constants/app_spacing.dart';
import '../models/workout_model.dart';

/// Workout card with teal left accent border.
class WorkoutCard extends StatelessWidget {
  const WorkoutCard({super.key, required this.workout});

  final WorkoutModel workout;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.zero,
      child: IntrinsicHeight(
        child: Row(
          children: [
            // Teal left accent bar
            Container(
              width: 4,
              decoration: const BoxDecoration(
                color: AppColors.teal,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSpacing.cardRadius),
                  bottomLeft: Radius.circular(AppSpacing.cardRadius),
                ),
              ),
            ),

            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${workout.formattedDate} - ${workout.durationLabel}',
                      style: AppTextStyles.bodySmall,
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      workout.name,
                      style: AppTextStyles.heading2.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        height: 28.8 / 24,
                        letterSpacing: 24 * -0.02,
                        color: const Color(0xFFEBEBEB),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Arrow icon
            const Padding(
              padding: EdgeInsets.only(right: AppSpacing.lg),
              child: Icon(
                Icons.arrow_forward,
                color: AppColors.textPrimary,
                size: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
