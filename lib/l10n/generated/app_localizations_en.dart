// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Fitness Tracker';

  @override
  String get today => 'Today';

  @override
  String get week => 'Week';

  @override
  String weekProgress(int current, int total) {
    return 'Week $current/$total';
  }

  @override
  String get workouts => 'Workouts';

  @override
  String get myInsights => 'My Insights';

  @override
  String get calories => 'Calories';

  @override
  String get remaining => 'Remaining';

  @override
  String get weight => 'Weight';

  @override
  String get hydration => 'Hydration';

  @override
  String get logNow => 'Log Now';

  @override
  String addedToWaterLog(int amount) {
    return '$amount ml added to water log';
  }

  @override
  String get nutrition => 'Nutrition';

  @override
  String get plan => 'Plan';

  @override
  String get mood => 'Mood';

  @override
  String get profile => 'Profile';

  @override
  String get upperBody => 'Upper Body';

  @override
  String get monday => 'M';

  @override
  String get tuesday => 'TU';

  @override
  String get wednesday => 'W';

  @override
  String get thursday => 'TH';

  @override
  String get friday => 'F';

  @override
  String get saturday => 'SA';

  @override
  String get sunday => 'SU';

  @override
  String get startYourDay => 'Start your day';

  @override
  String get howFeeling => 'How are you feeling at the Moment?';

  @override
  String get moodCalm => 'Calm';

  @override
  String get moodContent => 'Content';

  @override
  String get moodHappy => 'Happy';

  @override
  String get moodPeaceful => 'Peaceful';

  @override
  String get continueButton => 'Continue';
}
