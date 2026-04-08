import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/extensions/context_extensions.dart';
import '../provider/home_provider.dart';

/// Hydration tracker card with percentage, water chart, and "Log Now" action.
class HydrationCard extends StatelessWidget {
  const HydrationCard({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    final l10n = context.l10n;

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
      ),
      child: Column(
        children: [
          // Main content with padding
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left side: percentage + label
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${provider.hydrationPercent}%',
                        style: AppTextStyles.metricLarge.copyWith(
                          fontWeight: FontWeight.w700,
                          height: 1.0,
                          color: AppColors.teal,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Text(
                        l10n.hydration,
                        style: AppTextStyles.heading3.copyWith(
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFEBEBEB),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      GestureDetector(
                        onTap: () => provider.addWater(),
                        child: Text(
                          l10n.logNow,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.textTertiary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Right side: water level chart
                Expanded(
                  child: _WaterLevelChart(
                    progress: provider.hydrationProgress,
                    currentMl: provider.waterIntakeMl,
                  ),
                ),
              ],
            ),
          ),

          // Water log status bar — flush at the bottom
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.md,
            ),
            color: const Color(0xFF1B3D45),
            child: Text(
              l10n.addedToWaterLog(500),
              style: AppTextStyles.bodySmall.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 14.4 / 12,
                color: const Color(0xFFEBEBEB),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

/// Vertical water level chart with blue pill markers, gray dashes,
/// and a horizontal line from 0L to the ml value.
class _WaterLevelChart extends StatelessWidget {
  const _WaterLevelChart({
    required this.progress,
    required this.currentMl,
  });

  final double progress;
  final int currentMl;

  static const _blue = Color(0xFF5B9BD5);
  static const _dashColor = Color(0xFF3A3A3C);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Column(
        children: [
          // Top row: "2 L" + blue pill
          Row(
            children: [
              Text('2 L', style: AppTextStyles.bodySmall),
              const SizedBox(width: 6),
              _bluePill(),
            ],
          ),

          // Upper dashes — fill space between top pill and middle pill
          ..._buildExpandedDashes(4),

          // Middle blue pill
          Padding(
            padding: const EdgeInsets.only(left: 28),
            child: Align(
              alignment: Alignment.centerLeft,
              child: _bluePill(),
            ),
          ),

          // Lower dashes — fill space between middle pill and bottom pill
          ..._buildExpandedDashes(4),

          // Bottom row: "0 L" + blue pill + horizontal line + "0ml"
          Row(
            children: [
              Text('0 L', style: AppTextStyles.bodySmall),
              const SizedBox(width: 6),
              _bluePill(),
              Expanded(
                child: Container(
                  height: 1,
                  color: AppColors.textTertiary,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${currentMl}ml',
                style: AppTextStyles.heading2.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFEBEBEB),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Blue rounded pill marker.
  Widget _bluePill() {
    return Container(
      width: 16,
      height: 6,
      decoration: BoxDecoration(
        color: _blue,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  /// Builds expanded dash widgets that fill available vertical space evenly.
  List<Widget> _buildExpandedDashes(int count) {
    return List.generate(count, (i) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 28),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 8,
              height: 3,
              decoration: BoxDecoration(
                color: _dashColor,
                borderRadius: BorderRadius.circular(1.5),
              ),
            ),
          ),
        ),
      );
    });
  }
}
