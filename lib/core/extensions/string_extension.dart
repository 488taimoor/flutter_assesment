import 'package:intl/intl.dart';

extension StringExtensions on String {
  String get pathLocation => split('/').last;

  String toEnglish() {
    final string = replaceAll("٠", "0")
        .replaceAll("١", "1")
        .replaceAll("٢", "2")
        .replaceAll("٣", "3")
        .replaceAll("٤", "4")
        .replaceAll("٥", "5")
        .replaceAll("٦", "6")
        .replaceAll("٧", "7")
        .replaceAll("٨", "8")
        .replaceAll("٩", "9")
        .replaceAll('٫', '.');

    return string;
  }

  String toFormattedDateString() {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    var inputDate = inputFormat.parse(this);
    var outputFormat = DateFormat('yyyy-MM-dd');
    var outputDate = outputFormat.format(inputDate);
    return outputDate.toString();
  }

  String removeTrailingZeroAfterDecimal() {
    RegExp regExp = RegExp(r'([.]*0+)(?!.*\d)');
    return replaceAll(regExp, '');
  }

  String toFullMonthFormattedDateString() {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    var inputDate = inputFormat.parse(this);
    var outputFormat = DateFormat('yyyy ,dd MMMM');
    var outputDate = outputFormat.format(inputDate);
    return outputDate.toString();
  }

  DateTime toDateTime() {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    var inputDate = inputFormat.parse(this);
    return inputDate;
  }

  String toCurrencyString() {
    if (isEmpty) return "";
    final plainAmount = trim().replaceAll(RegExp('SAR'), '');
    return NumberFormat.currency(symbol: "", locale: 'ar_SA')
        .format(double.parse(plainAmount));
  }

  // get openLink async {
  //   if (!await launchUrlString(this, mode: LaunchMode.inAppWebView)) {
  //     log('Could not launch $this');
  //   }
  // }

  // get openLinkToDownload async {
  //   if (!await launchUrlString(this, mode: LaunchMode.externalApplication)) {
  //     log('Could not launch $this');
  //   }
  // }

  static const Map<String, String> arabicDigits = <String, String>{
    '\u0660': '0',
    '\u0661': '1',
    '\u0662': '2',
    '\u0663': '3',
    '\u0664': '4',
    '\u0665': '5',
    '\u0666': '6',
    '\u0667': '7',
    '\u0668': '8',
    '\u0669': '9',
    '\u066B': '\u002E',
  };
  String arToEn() {
    final number = this;
    final sb = StringBuffer();
    for (var i = 0; i < number.length; i++) {
      sb.write(arabicDigits[number[i]] ?? number[i]);
    }
    return sb.toString();
  }

  String extractDecimalSubstring() {
    int decimalIndex = indexOf('.');
    return (decimalIndex != -1 && decimalIndex + 3 < length)
        ? substring(0, decimalIndex + 3)
        : this;
  }
}
