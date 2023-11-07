

import 'package:flutter/services.dart';

class TextInputFormatterWithRange extends TextInputFormatter {
  final int min;
  final int max;

  TextInputFormatterWithRange(this.min, this.max);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final int newValueAsInt = int.tryParse(newValue.text) ?? 0;
    if (newValueAsInt < min) {
      return TextEditingValue(
        text: min.toString(),
        selection: TextSelection.collapsed(offset: min.toString().length),
      );
    } else if (newValueAsInt > max) {
      return TextEditingValue(
        text: max.toString(),
        selection: TextSelection.collapsed(offset: max.toString().length),
      );
    }
    return newValue;
  }
}