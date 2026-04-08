import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/theme/app_text_styles.dart';
import '../../../common/widgets/app_card.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/extensions/context_extensions.dart';
import '../provider/home_provider.dart';

/// Displays current weight and change indicator.
class WeightCard extends StatelessWidget {
  const WeightCard({super.key});

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
            // Metric row: "75 kg"
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  '${provider.currentWeight.toInt()}',
                  style: AppTextStyles.metricLarge.copyWith(
                    fontWeight: FontWeight.w700,
                    height: 1.0,
                    color: const Color(0xFFEBEBEB),
                  ),
                ),
                const SizedBox(width: 2),
                Text(
                  'kg',
                  style: AppTextStyles.metricUnit.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    height: 19.2 / 16,
                    color: const Color(0xFFEBEBEB),
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppSpacing.sm),

            // Change indicator: "+1.6kg"
            Row(
              children: [
                Image.asset(
                  'assets/Frame (11).png',
                  width: 20,
                  height: 20,
                ),
                const SizedBox(width: AppSpacing.xs),
                Text(
                  '+${provider.weightChange}kg',
                  style: AppTextStyles.bodySmall,
                ),
              ],
            ),

            const Spacer(),

            // Label
            Text(
              l10n.weight,
              style: AppTextStyles.heading3,
            ),
          ],
        ),
      ),
    );
  }
}
