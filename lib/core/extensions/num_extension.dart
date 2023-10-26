import 'package:intl/intl.dart';

extension NumExtension on num {
  String toCurrencyString(
      {String symbol = 'SAR', String locale = 'ar_SA', int decimalDigits = 2}) {
    return NumberFormat.currency(
            symbol: symbol, locale: locale, decimalDigits: decimalDigits)
        .format(this);
  }
}
