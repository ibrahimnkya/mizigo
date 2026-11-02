import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

/// Formats whole-shilling input with thousands separators as you type
/// ("1500000" → "1,500,000"), keeping the cursor at the end.
class ThousandsSeparatorFormatter extends TextInputFormatter {
  static final _fmt = NumberFormat('#,###', 'en_US');

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final digits = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (digits.isEmpty) return const TextEditingValue();
    final trimmed = digits.length > 12 ? digits.substring(0, 12) : digits;
    final text = _fmt.format(int.parse(trimmed));
    return TextEditingValue(text: text, selection: TextSelection.collapsed(offset: text.length));
  }
}

/// Parses a formatted amount ("1,500,000") back to a number.
double? parseMoney(String? text) => double.tryParse((text ?? '').replaceAll(RegExp(r'[^0-9.]'), ''));
