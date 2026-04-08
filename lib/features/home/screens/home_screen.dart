import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../common/widgets/section_header.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../mood/screens/mood_screen.dart';
import '../../plan/screens/plan_screen.dart';
import '../provider/home_provider.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/calories_card.dart';
import '../widgets/hydration_card.dart';
import '../widgets/week_selector.dart';
import '../widgets/weekly_calendar.dart';
import '../widgets/weight_card.dart';
import '../widgets/workout_card.dart';

/// Shell screen that hosts all tabs and switches based on bottom nav index.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navIndex = context.watch<HomeProvider>().currentNavIndex;

    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: IndexedStack(
        index: navIndex,
        children: const [
          _NutritionContent(),
          PlanScreen(),
          MoodScreen(),
          _PlaceholderTab(title: 'Profile'),
        ],
      ),
      bottomNavigationBar: const AppBottomNavBar(),
    );
  }
}

/// The original home/nutrition content (formerly the entire HomeScreen body).
class _NutritionContent extends StatelessWidget {
  const _NutritionContent();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    final l10n = context.l10n;

    return SafeArea(
      child: SingleChildScrollView(
        padding: AppSpacing.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSpacing.md),
            const WeekSelector(),
            const WeeklyCalendar(),

            SectionHeader(
              title: l10n.workouts,
              trailing: const _WeatherWidget(),
            ),
            ...provider.workouts.map(
              (workout) => WorkoutCard(workout: workout),
            ),

            SectionHeader(title: l10n.myInsights),

            const SizedBox(
              height: 190,
              child: Row(
                children: [
                  CaloriesCard(),
                  SizedBox(width: AppSpacing.md),
                  WeightCard(),
                ],
              ),
            ),

            const SizedBox(height: AppSpacing.md),
            const HydrationCard(),
            const SizedBox(height: AppSpacing.xxl),
          ],
        ),
      ),
    );
  }
}

/// Placeholder tab for unimplemented screens.
class _PlaceholderTab extends StatelessWidget {
  const _PlaceholderTab({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title, style: AppTextStyles.heading2),
    );
  }
}

/// Weather display widget shown next to "Workouts" header.
class _WeatherWidget extends StatelessWidget {
  const _WeatherWidget();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.wb_sunny_outlined,
          color: AppColors.textPrimary,
          size: 22,
        ),
        SizedBox(width: AppSpacing.sm),
        Text(
          '9\u00B0',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
