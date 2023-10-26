import 'dart:math';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';


class Formatters {

  static String? birthDateValidator(String value) {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy');
    final String formatted = formatter.format(now);
    String str1 = value;
    List<String> str2 = str1.split('-');
    String month = str2.isNotEmpty ? str2[0] : '';
    String day = str2.length > 1 ? str2[1] : '';
    String year = str2.length > 2 ? str2[2] : '';
    if (value.isEmpty) {
      return 'BirthDate is Empty';
    } else if (int.parse(month) > 13) {
      return 'Month is invalid';
    } else if (int.parse(day) > 32) {
      return 'Day is invalid';
    } else if ((int.parse(year) > int.parse(formatted))) {
      return 'Year is invalid';
    } else if ((int.parse(year) < 1920)) {
      return 'Year is invalid';
    }
    return null;
  }
}

class BirthTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (oldValue.text.length >= newValue.text.length) {
      return newValue;
    }
    var dateText = _addSeparator(newValue.text, '-');
    return newValue.copyWith(
        text: dateText, selection: updateCursorPosition(dateText));
  }

  String _addSeparator(String value, String separator) {
    value = value.replaceAll('-', '');
    var newString = '';
    for (int i = 0; i < value.length; i++) {
      newString += value[i];
      if (i == 1) {
        newString += separator;
      }
      if (i == 3) {
        newString += separator;
      }
    }

    return newString;
  }

  TextSelection updateCursorPosition(String text) {
    return TextSelection.fromPosition(TextPosition(offset: text.length));
  }
}

class DecimalTextInputFormatter extends TextInputFormatter {
  DecimalTextInputFormatter({required this.decimalRange})
      : assert(decimalRange == null || decimalRange > 0);

  final int decimalRange;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, // unused.
    TextEditingValue newValue,
  ) {
    TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    if (decimalRange != null) {
      String value = newValue.text;

      if (value.contains(".") &&
          value.substring(value.indexOf(".") + 1).length > decimalRange) {
        truncated = oldValue.text;
        newSelection = oldValue.selection;
      } else if (value == ".") {
        truncated = "0.";

        newSelection = newValue.selection.copyWith(
          baseOffset: min(truncated.length, truncated.length + 1),
          extentOffset: min(truncated.length, truncated.length + 1),
        );
      }

      return TextEditingValue(
        text: truncated,
        selection: newSelection,
        composing: TextRange.empty,
      );
    }
    return newValue;
  }
}

class CustomLengthFormatter extends TextInputFormatter {
  final int maxLength;

  CustomLengthFormatter({required this.maxLength});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final String formattedValue = newValue.text.replaceAll(',', '');
    final List<String> parts = formattedValue.split('.');
    final int wholeLength = parts.first.length;
    final int decimalLength = parts.length > 1 ? parts.last.length : 0;
    final int length = wholeLength + decimalLength;
    if (wholeLength > maxLength) {
      return oldValue;
    }
    return TextEditingValue(
      text: formattedValue,
      selection: newValue.selection.copyWith(
        baseOffset: newValue.selection.baseOffset > length
            ? length
            : newValue.selection.baseOffset,
        extentOffset: newValue.selection.extentOffset > length
            ? length
            : newValue.selection.extentOffset,
      ),
    );
  }
}