
class Constants {
  Constants._();

  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const double textHeight = 1.5;
  static const Duration userSessionTimeOutDuration = Duration(minutes: 5);
  static bool isGuest = false;
  static const channel = 'flutter_channel';
  static const timeFormatter = 'hh:mm a'; // formats in AM/PM
  static const dateFormatter = 'dd MMMM, yyyy'; // formats in 12 August, 2023

  /// * App Extras ***/
  static const String dateTimeFormat = 'yyyy-mm-dd hh:mm';

}
