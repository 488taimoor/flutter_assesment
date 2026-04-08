import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../common/widgets/app_card.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/extensions/context_extensions.dart';
import '../provider/home_provider.dart';

/// Displays calorie intake with a progress bar.
class CaloriesCard extends StatelessWidget {
  const CaloriesCard({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    final l10n = context.l10n;

    return Expanded(
      flex: 1,
      child: AppCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Metric row: "550 Calories"
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  '${provider.caloriesConsumed}',
                  style: AppTextStyles.metricLarge.copyWith(
                    fontWeight: FontWeight.w600,
                    height: 1.0,
                    color: const Color(0xFFEBEBEB),
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  l10n.calories,
                  style: AppTextStyles.metricUnit.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    height: 21.6 / 18,
                    color: const Color(0xFFEBEBEB),
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppSpacing.xs),

            // "1950 Remaining"
            Text(
              '${provider.caloriesRemaining} ${l10n.remaining}',
              style: AppTextStyles.bodySmall,
            ),

            const Spacer(),

            // Progress bar labels
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('0', style: AppTextStyles.bodySmall),
                Text('${HomeProvider.caloriesGoal}', style: AppTextStyles.bodySmall),
              ],
            ),

            const SizedBox(height: AppSpacing.xs),

            // Gradient progress bar
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Stack(
                children: [
                  // Track
                  Container(
                    height: 6,
                    decoration: BoxDecoration(
                      color: AppColors.progressTrack,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  // Fill with gradient
                  FractionallySizedBox(
                    widthFactor: provider.caloriesProgress.clamp(0.0, 1.0),
                    child: Container(
                      height: 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF7BBDE2),
                            Color(0xFF69C0B1),
                            Color(0xFF60C198),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
