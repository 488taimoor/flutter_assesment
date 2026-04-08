import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../features/home/provider/home_provider.dart';
import '../features/home/screens/home_screen.dart';
import '../features/mood/provider/mood_provider.dart';
import '../features/plan/provider/plan_provider.dart';
import '../l10n/generated/app_localizations.dart';
import 'theme/app_theme.dart';

/// Root application widget.
///
/// Sets up Providers, theming, and localization.
class FitnessApp extends StatelessWidget {
  const FitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => PlanProvider()),
        ChangeNotifierProvider(create: (_) => MoodProvider()),
      ],
      child: MaterialApp(
        title: 'Fitness Tracker',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.dark,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const HomeScreen(),
      ),
    );
  }
}
