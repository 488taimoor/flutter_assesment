import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../core/extensions/context_extensions.dart';
import '../provider/home_provider.dart';
import 'month_calendar_sheet.dart';

/// Top header row with notification bell and tappable "Week  X/Y" indicator.
///
/// Tapping the week indicator opens the month calendar bottom sheet.
class WeekSelector extends StatelessWidget {
  const WeekSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    final l10n = context.l10n;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Notification bell
        Image.asset(
          'assets/Frame (12).png',
          width: 28,
          height: 28,
        ),

        // Week indicator — tappable to open calendar
        GestureDetector(
          onTap: () => _showMonthCalendar(context),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.access_time,
                  color: AppColors.textPrimary,
                  size: 16,
                ),
                const SizedBox(width: 6),
                Text(
                  l10n.weekProgress(provider.currentWeek, provider.totalWeeks),
                  style: AppTextStyles.bodyMedium,
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.textPrimary,
                  size: 18,
                ),
              ],
            ),
          ),
        ),

        // Spacer to balance the bell icon
        const SizedBox(width: 28),
      ],
    );
  }

  void _showMonthCalendar(BuildContext context) {
    final provider = context.read<HomeProvider>();
    provider.resetCalendarToSelectedDate();

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => ChangeNotifierProvider.value(
        value: provider,
        child: const MonthCalendarSheet(),
      ),
    );
  }
}
