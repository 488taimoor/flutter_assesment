export 'num_extension.dart';

extension BoolExtensions on int? {
  bool toBool() {
    if (this == 1) {
      return true;
    } else {
      return false;
    }
  }
}

extension BetweenExtensioin on num {
  bool between(num from, num to) {
    return this >= from && this <= to;
  }
}
