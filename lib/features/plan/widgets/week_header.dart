import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../core/constants/app_spacing.dart';
import '../models/training_week.dart';

/// Week section header: "Week 2/8", date range, total time, teal divider.
class WeekHeader extends StatelessWidget {
  const WeekHeader({super.key, required this.week});

  final TrainingWeek week;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Teal top line
        Container(
          height: 3,
          color: AppColors.teal,
        ),

        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Week ${week.weekNumber}/${week.totalWeeks}',
                style: AppTextStyles.heading3,
              ),
              const SizedBox(height: AppSpacing.xs),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    week.dateRange,
                    style: AppTextStyles.bodySmall,
                  ),
                  Text(
                    'Total: ${week.totalMinutes}min',
                    style: AppTextStyles.bodySmall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
