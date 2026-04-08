import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/theme/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../provider/plan_provider.dart';
import '../widgets/day_row.dart';
import '../widgets/plan_header.dart';
import '../widgets/week_header.dart';

/// Training Calendar screen showing weekly workout schedules
/// with drag-and-drop reordering.
class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PlanProvider>();

    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: SafeArea(
        child: Column(
          children: [
            // Fixed header
            const Padding(
              padding: EdgeInsets.fromLTRB(
                AppSpacing.lg,
                AppSpacing.lg,
                AppSpacing.lg,
                AppSpacing.md,
              ),
              child: PlanHeader(),
            ),

            // Scrollable week content
            Expanded(
              child: ListView.builder(
                itemCount: provider.weeks.length,
                itemBuilder: (context, weekIndex) {
                  final week = provider.weeks[weekIndex];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WeekHeader(week: week),
                      ...List.generate(
                        week.days.length,
                        (dayIndex) => DayRow(
                          day: week.days[dayIndex],
                          weekIndex: weekIndex,
                          dayIndex: dayIndex,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.lg),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
