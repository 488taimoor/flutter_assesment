// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'متتبع اللياقة';

  @override
  String get today => 'اليوم';

  @override
  String get week => 'Week';

  @override
  String weekProgress(int current, int total) {
    return 'الأسبوع $current/$total';
  }

  @override
  String get workouts => 'التمارين';

  @override
  String get myInsights => 'إحصائياتي';

  @override
  String get calories => 'سعرات حرارية';

  @override
  String get remaining => 'متبقي';

  @override
  String get weight => 'الوزن';

  @override
  String get hydration => 'الترطيب';

  @override
  String get logNow => 'سجل الآن';

  @override
  String addedToWaterLog(int amount) {
    return 'تمت إضافة $amount مل إلى سجل الماء';
  }

  @override
  String get nutrition => 'التغذية';

  @override
  String get plan => 'الخطة';

  @override
  String get mood => 'المزاج';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get upperBody => 'الجزء العلوي';

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
  String get startYourDay => 'ابدأ يومك';

  @override
  String get howFeeling => 'كيف تشعر في هذه اللحظة؟';

  @override
  String get moodCalm => 'هادئ';

  @override
  String get moodContent => 'راضٍ';

  @override
  String get moodHappy => 'سعيد';

  @override
  String get moodPeaceful => 'مسالم';

  @override
  String get continueButton => 'متابعة';
}
