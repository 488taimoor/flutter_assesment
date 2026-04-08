import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/theme/app_text_styles.dart';
import '../../../core/extensions/context_extensions.dart';
import '../provider/home_provider.dart';

/// Bottom navigation bar with 4 tabs: Nutrition, Plan, Mood, Profile.
class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    final l10n = context.l10n;

    return BottomNavigationBar(
      currentIndex: provider.currentNavIndex,
      onTap: provider.setNavIndex,
      selectedLabelStyle: AppTextStyles.navLabel,
      unselectedLabelStyle: AppTextStyles.navLabel,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/Frame (7).png', width: 24, height: 24),
          activeIcon: Image.asset('assets/Frame (8).png', width: 24, height: 24),
          label: l10n.nutrition,
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/Frame (9).png', width: 24, height: 24),
          activeIcon: Image.asset('assets/Frame (6).png', width: 24, height: 24),
          label: l10n.plan,
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/Frame (5).png', width: 24, height: 24),
          activeIcon: Image.asset('assets/Frame (10).png', width: 24, height: 24),
          label: l10n.mood,
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/Frame (4).png', width: 24, height: 24),
          activeIcon: Image.asset('assets/Frame (4).png', width: 24, height: 24),
          label: l10n.profile,
        ),
      ],
    );
  }
}
