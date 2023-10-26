import 'package:intl/intl.dart';
export 'num_extension.dart';

extension DoubleExtensions on double {
  String toCurrencyStringMinus() {
    return NumberFormat.currency(symbol: "", locale: 'ar_SA').format(this);
  }
}
