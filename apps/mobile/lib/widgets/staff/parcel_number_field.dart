import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../theme/staff_palette.dart';
import 'staff_settings.dart';

/// Parcel number input used by Home search, the Track page and the scanner's
/// manual entry. Tracking numbers are 3 letters + 3 digits (e.g. ABC123), so
/// input is uppercased, limited to letters/digits/dashes, with no autocorrect
/// or suggestions.
class ParcelNumberField extends StatefulWidget {
  const ParcelNumberField({
    super.key,
    required this.controller,
    required this.onSubmitted,
    this.loading = false,
    this.onDark = false,
    this.autofocus = false,
    this.onChanged,
    this.onCleared,
    this.focusNode,
    this.freeText = false,
  });

  final TextEditingController controller;
  final ValueChanged<String> onSubmitted;
  final bool loading;

  /// White-on-dark colors (e.g. over the camera) regardless of theme.
  final bool onDark;
  final bool autofocus;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onCleared;
  final FocusNode? focusNode;

  /// Allow any text (names, places, "dar to dodoma") for smart search
  /// instead of tracking-number characters only.
  final bool freeText;

  static const hint = 'Parcel number, e.g. ABC123';
  static const freeTextHint = 'Parcel number, place or name';

  @override
  State<ParcelNumberField> createState() => _ParcelNumberFieldState();
}

class _ParcelNumberFieldState extends State<ParcelNumberField> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_rebuild);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_rebuild);
    super.dispose();
  }

  void _rebuild() => setState(() {});

  void _submit() {
    final value = widget.controller.text.trim();
    if (value.isEmpty) return;
    FocusScope.of(context).unfocus();
    widget.onSubmitted(value);
  }

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    Color fg(double a) => widget.onDark ? Colors.white.withValues(alpha: a) : palette.fg(a);
    final fill = widget.onDark ? Colors.white.withValues(alpha: 0.08) : palette.surface(0.06);
    OutlineInputBorder border(Color c, [double w = 1]) =>
        OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: c, width: w));

    final hasText = widget.controller.text.isNotEmpty;

    return SizedBox(
      height: 48,
      child: TextField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        // Tracking mode: visible-password keyboard (letters + digits, no
        // suggestions), uppercased. Free-text mode: normal text keyboard.
        keyboardType: widget.freeText ? TextInputType.text : TextInputType.visiblePassword,
        textCapitalization: widget.freeText ? TextCapitalization.none : TextCapitalization.characters,
        textInputAction: TextInputAction.search,
        autocorrect: false,
        enableSuggestions: false,
        inputFormatters: widget.freeText
            ? [LengthLimitingTextInputFormatter(80)]
            : [
                FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z0-9-]')),
                _UpperCaseFormatter(),
                LengthLimitingTextInputFormatter(32),
              ],
        onChanged: widget.onChanged,
        onSubmitted: (_) => _submit(),
        cursorColor: kStaffAccent,
        style: GoogleFonts.outfit(fontSize: 17, letterSpacing: hasText && !widget.freeText ? 1.5 : 0, color: fg(1)),
        decoration: InputDecoration(
          filled: true,
          fillColor: fill,
          hintText: widget.freeText ? ParcelNumberField.freeTextHint : ParcelNumberField.hint,
          hintStyle: GoogleFonts.outfit(fontSize: 16, color: fg(0.5)),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 12, right: 10),
            child: HugeIcon(icon: HugeIcons.strokeRoundedSearch01, color: fg(0.85), size: 22),
          ),
          prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
          suffixIcon: widget.loading
              ? const Padding(
                  padding: EdgeInsets.all(14),
                  child: SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2, color: kStaffAccent),
                  ),
                )
              : hasText
                  ? IconButton(
                      tooltip: 'Clear',
                      onPressed: () {
                        widget.controller.clear();
                        widget.onCleared?.call();
                      },
                      icon: HugeIcon(icon: HugeIcons.strokeRoundedCancel01, color: fg(0.6), size: 20),
                    )
                  : null,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          border: border(fg(0.4)),
          enabledBorder: border(fg(0.4)),
          focusedBorder: border(kStaffAccent, 1.5),
        ),
      ),
    );
  }
}

class _UpperCaseFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) =>
      newValue.copyWith(text: newValue.text.toUpperCase());
}
