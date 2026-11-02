import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../theme/app_theme.dart';
import '../common/country_selector.dart';
import '../common/station_header_art.dart';
import '../../theme/staff_palette.dart';

/// Shared building blocks for the Station Clerk auth screens
/// (Figma "2 On-Boarding 11–14"): sunset header, outlined fields, orange CTA.

const double _headerHeight = 277;
const int _localPhoneDigits = 9;

String _dialDigits(Country c) => c.dialCode.replaceAll('+', '');

Country _countryForDigits(String digits, Country fallback) {
  for (final c in countries) {
    if (digits.startsWith(_dialDigits(c))) return c;
  }
  return fallback;
}

/// Returns the E.164 number (e.g. `+255712345678`) for what was typed in a
/// [ClerkPhoneField], or null when it isn't a complete number yet.
String? clerkPhoneE164(String text) {
  final digits = text.replaceAll(RegExp(r'\D'), '');
  final country = _countryForDigits(digits, countries.first);
  final dial = _dialDigits(country);
  if (digits.startsWith(dial) && digits.length == dial.length + _localPhoneDigits) {
    return '+$digits';
  }
  // Local number typed without a leading 0 or country code.
  if (digits.length == _localPhoneDigits && !digits.startsWith('0')) {
    return '+${_dialDigits(countries.first)}$digits';
  }
  return null;
}

/// Digits to prefill a [ClerkPhoneField] with from a stored E.164 number.
String clerkPhoneFieldText(String e164) => e164.replaceAll(RegExp(r'\D'), '');

/// Page shell: maroon background, train-on-bridge header art with a top bar
/// (leading action + centered title) and a centered description, the form,
/// and the Terms / Privacy footer pinned to the bottom.
class ClerkAuthScaffold extends StatelessWidget {
  const ClerkAuthScaffold({
    super.key,
    required this.title,
    required this.description,
    required this.leading,
    required this.child,
    this.footerLead = 'By continuing, you agree to our',
  });

  final String title;
  final String description;
  final Widget leading;
  final Widget child;

  /// Text before the "Terms & Conditions and Privacy Policy" links.
  final String footerLead;

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).padding.top;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: StaffPalette.of(context).overlayStyle,
      child: Scaffold(
        backgroundColor: StaffPalette.of(context).splashBackground,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          behavior: HitTestBehavior.translucent,
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: _headerHeight + topInset,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          StationHeaderArt(
                        height: _headerHeight,
                        // Short fade into the page background so the art has no hard bottom edge.
                        fadeColor: StaffPalette.of(context).splashBackground,
                        fadeStart: 0.85,
                      ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(8, topInset + 12, 8, 0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: 48, child: leading),
                                    Expanded(
                                      child: Text(
                                        title,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.outfit(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                          color: StaffPalette.of(context).fg(),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 48),
                                  ],
                                ),
                                const Gap(16),
                                // Figma: 231pt-wide centered block, Regular 16, white 60%.
                                ConstrainedBox(
                                  constraints: const BoxConstraints(maxWidth: 231),
                                  child: Text(
                                    description,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.outfit(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      height: 1.25,
                                      color: StaffPalette.of(context).fg(0.6),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: const EdgeInsets.fromLTRB(16, 8, 16, 24), child: child),
                    const Spacer(),
                    SafeArea(
                      top: false,
                      minimum: const EdgeInsets.fromLTRB(24, 0, 24, 16),
                      child: _LegalFooter(lead: footerLead),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LegalFooter extends StatelessWidget {
  const _LegalFooter({required this.lead});

  final String lead;

  @override
  Widget build(BuildContext context) {
    final base = GoogleFonts.outfit(fontSize: 13, height: 1.5, color: StaffPalette.of(context).fg(0.6));

    InlineSpan link(String label, String type) => WidgetSpan(
      alignment: PlaceholderAlignment.baseline,
      baseline: TextBaseline.alphabetic,
      child: Semantics(
        link: true,
        child: GestureDetector(
          onTap: () => context.push('/legal/$type'),
          child: Text(
            label,
            style: base.copyWith(color: AppTheme.tecOrange, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );

    return Text.rich(
      TextSpan(
        style: base,
        children: [
          TextSpan(text: '$lead '),
          link('Terms & Conditions', 'terms'),
          const TextSpan(text: ' and '),
          link('Privacy Policy', 'privacy'),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}

/// Outlined white-on-maroon text field from the design.
class ClerkTextField extends StatelessWidget {
  const ClerkTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.leading,
    this.focusNode,
    this.trailing,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.onSubmitted,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final String hint;
  final Widget leading;
  final Widget? trailing;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder border(Color color, [double width = 1]) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color, width: width),
    );

    return TextField(
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText,
      obscuringCharacter: '●',
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      onSubmitted: onSubmitted,
      cursorColor: AppTheme.tecOrange,
      style: GoogleFonts.outfit(fontSize: 16, color: StaffPalette.of(context).fg(), letterSpacing: obscureText ? 3 : 0.2),
      decoration: InputDecoration(
        filled: true,
        fillColor: StaffPalette.of(context).fg(0.03),
        hintText: hint,
        hintStyle: GoogleFonts.outfit(fontSize: 16, color: StaffPalette.of(context).fg(0.5), letterSpacing: 0),
        prefixIcon: Padding(padding: const EdgeInsets.only(left: 14, right: 10), child: leading),
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        suffixIcon: trailing,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
        border: border(StaffPalette.of(context).fg(0.35)),
        enabledBorder: border(StaffPalette.of(context).fg(0.35)),
        focusedBorder: border(AppTheme.tecOrange, 1.5),
      ),
    );
  }
}

/// Phone field holding the full international number as digits. Typing a
/// leading `0` swaps it for the country code (`0…` → `255…`); the flag follows
/// the typed code and can be tapped to pick another country.
class ClerkPhoneField extends StatefulWidget {
  const ClerkPhoneField({
    super.key,
    required this.controller,
    this.focusNode,
    this.textInputAction = TextInputAction.next,
    this.onSubmitted,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onSubmitted;

  @override
  State<ClerkPhoneField> createState() => _ClerkPhoneFieldState();
}

class _ClerkPhoneFieldState extends State<ClerkPhoneField> {
  Country _country = countries.first;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_syncCountry);
    _syncCountry();
  }

  @override
  void dispose() {
    widget.controller.removeListener(_syncCountry);
    super.dispose();
  }

  void _syncCountry() {
    final next = _countryForDigits(widget.controller.text, _country);
    if (next != _country) setState(() => _country = next);
  }

  Future<void> _pickCountry() async {
    final result = await showModalBottomSheet<Country>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const CountryPickerSheet(),
    );
    if (result == null) return;
    final dial = _dialDigits(result);
    setState(() => _country = result);
    widget.controller.value = TextEditingValue(
      text: dial,
      selection: TextSelection.collapsed(offset: dial.length),
    );
    widget.focusNode?.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return ClerkTextField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      hint: 'Phone Number',
      keyboardType: TextInputType.phone,
      textInputAction: widget.textInputAction,
      onSubmitted: widget.onSubmitted,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        _LeadingZeroToDialCode(() => _dialDigits(_country)),
        LengthLimitingTextInputFormatter(_dialDigits(_country).length + _localPhoneDigits),
      ],
      leading: Semantics(
        button: true,
        label: 'Country: ${_country.name}',
        child: GestureDetector(
          onTap: _pickCountry,
          child: Container(
            width: 22,
            height: 22,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            clipBehavior: Clip.antiAlias,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Text(_country.flag, style: const TextStyle(fontSize: 28, height: 1)),
            ),
          ),
        ),
      ),
    );
  }
}

class _LeadingZeroToDialCode extends TextInputFormatter {
  _LeadingZeroToDialCode(this.dialDigits);

  final String Function() dialDigits;

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (!newValue.text.startsWith('0')) return newValue;
    final text = dialDigits() + newValue.text.substring(1);
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}

/// PIN field with an always-visible show/hide toggle.
class ClerkPinField extends StatefulWidget {
  const ClerkPinField({
    super.key,
    required this.controller,
    this.focusNode,
    this.hint = 'PIN',
    this.length = 6,
    this.textInputAction = TextInputAction.done,
    this.onSubmitted,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final String hint;
  final int length;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onSubmitted;

  @override
  State<ClerkPinField> createState() => _ClerkPinFieldState();
}

class _ClerkPinFieldState extends State<ClerkPinField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return ClerkTextField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      hint: widget.hint,
      obscureText: _obscure,
      keyboardType: TextInputType.number,
      textInputAction: widget.textInputAction,
      onSubmitted: widget.onSubmitted,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(widget.length)],
      leading: HugeIcon(
        icon: HugeIcons.strokeRoundedSquareLock02,
        color: StaffPalette.of(context).fg(0.85),
        size: 20,
      ),
      trailing: IconButton(
        onPressed: () => setState(() => _obscure = !_obscure),
        tooltip: _obscure ? 'Show PIN' : 'Hide PIN',
        icon: HugeIcon(
          icon: _obscure ? HugeIcons.strokeRoundedView : HugeIcons.strokeRoundedViewOff,
          color: StaffPalette.of(context).fg(0.7),
          size: 20,
        ),
      ),
    );
  }
}

/// Orange call-to-action with a press-down scale and inline loading spinner.
class ClerkPrimaryButton extends StatefulWidget {
  const ClerkPrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.loading = false,
    this.visible = true,
    this.enabled = true,
  });

  final String label;
  final VoidCallback onPressed;
  final bool loading;

  /// When false the button fades out and ignores taps; its space is kept so
  /// the layout doesn't jump as the user finishes typing.
  final bool visible;

  /// When false the button stays visible but dimmed and ignores taps
  /// (e.g. "Try again in 0:45" while rate-limited).
  final bool enabled;

  @override
  State<ClerkPrimaryButton> createState() => _ClerkPrimaryButtonState();
}

class _ClerkPrimaryButtonState extends State<ClerkPrimaryButton> {
  bool _pressed = false;

  void _setPressed(bool value) => setState(() => _pressed = value);

  @override
  Widget build(BuildContext context) {
    final shown = widget.visible || widget.loading;
    return IgnorePointer(
      ignoring: !shown,
      child: ExcludeSemantics(
        excluding: !shown,
        child: AnimatedOpacity(
          opacity: shown ? 1 : 0,
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOut,
          child: AnimatedSlide(
            offset: shown ? Offset.zero : const Offset(0, 0.25),
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOutCubic,
            child: _button(),
          ),
        ),
      ),
    );
  }

  Widget _button() {
    return GestureDetector(
      onTapDown: (_) => _setPressed(true),
      onTapCancel: () => _setPressed(false),
      onTapUp: (_) => _setPressed(false),
      child: AnimatedScale(
        scale: _pressed && !widget.loading && widget.enabled ? 0.97 : 1,
        duration: const Duration(milliseconds: 120),
        child: SizedBox(
          height: 52,
          child: ElevatedButton(
            onPressed: widget.loading ? () {} : (widget.enabled ? widget.onPressed : null),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.tecOrange,
              foregroundColor: Colors.white,
              disabledBackgroundColor: AppTheme.tecOrange.withValues(alpha: 0.35),
              disabledForegroundColor: Colors.white.withValues(alpha: 0.85),
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: widget.loading
                  ? const SizedBox(
                      key: ValueKey('loading'),
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(strokeWidth: 2.5, color: Colors.white),
                    )
                  : Text(
                      widget.label,
                      key: const ValueKey('label'),
                      style: GoogleFonts.outfit(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Six-box one-time code input. A single hidden [TextField] does the typing
/// (so paste and SMS autofill work); the boxes just mirror its value.
class ClerkCodeField extends StatefulWidget {
  const ClerkCodeField({
    super.key,
    required this.controller,
    this.focusNode,
    this.length = 6,
    this.obscure = false,
    this.hasError = false,
    this.autofocus = true,
    this.foreground,
    this.onCompleted,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final int length;
  final bool obscure;
  final bool hasError;
  final bool autofocus;

  /// Digit/border color: white on the maroon auth screens; pass the theme's
  /// text color when used on a light surface (e.g. Daylight sheets).
  final Color? foreground;
  final ValueChanged<String>? onCompleted;

  @override
  State<ClerkCodeField> createState() => _ClerkCodeFieldState();
}

class _ClerkCodeFieldState extends State<ClerkCodeField> {
  late final FocusNode _focus = widget.focusNode ?? FocusNode();

  Color get _fg => widget.foreground ?? StaffPalette.of(context).fg();

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onChanged);
    _focus.addListener(_rebuild);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onChanged);
    _focus.removeListener(_rebuild);
    if (widget.focusNode == null) _focus.dispose();
    super.dispose();
  }

  void _rebuild() => setState(() {});

  void _onChanged() {
    setState(() {});
    final text = widget.controller.text;
    if (text.length == widget.length) widget.onCompleted?.call(text);
  }

  @override
  Widget build(BuildContext context) {
    final text = widget.controller.text;
    final focused = _focus.hasFocus;

    return GestureDetector(
      onTap: () => _focus.requestFocus(),
      child: Stack(
        children: [
          // Invisible input that owns the keyboard, paste and autofill.
          Positioned.fill(
            child: Opacity(
              opacity: 0,
              child: TextField(
                controller: widget.controller,
                focusNode: _focus,
                autofocus: widget.autofocus,
                keyboardType: TextInputType.number,
                autofillHints: const [AutofillHints.oneTimeCode],
                showCursor: false,
                enableInteractiveSelection: false,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(widget.length),
                ],
              ),
            ),
          ),
          Row(
            children: [
              for (var i = 0; i < widget.length; i++) ...[
                if (i > 0) const Gap(8),
                Expanded(child: _box(i, text, focused)),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _box(int i, String text, bool focused) {
    final filled = i < text.length;
    final active = focused && (i == text.length || (i == widget.length - 1 && text.length == widget.length));
    final borderColor = widget.hasError
        ? const Color(0xFFF87171)
        : active
            ? AppTheme.tecOrange
            : _fg.withValues(alpha: filled ? 0.6 : 0.3);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      height: 56,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: _fg.withValues(alpha: filled ? 0.08 : 0.03),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: active ? 1.5 : 1),
      ),
      child: filled
          ? Text(
              widget.obscure ? '●' : text[i],
              style: GoogleFonts.outfit(
                fontSize: widget.obscure ? 16 : 22,
                fontWeight: FontWeight.w600,
                color: _fg,
              ),
            )
          : null,
    );
  }
}

/// `+255712345678` → `+255 7•• ••• 678`
String clerkMaskPhone(String e164) {
  final digits = e164.replaceAll(RegExp(r'\D'), '');
  if (digits.length < 7) return e164;
  final country = _countryForDigits(digits, countries.first);
  final dial = _dialDigits(country);
  final local = digits.startsWith(dial) ? digits.substring(dial.length) : digits;
  if (local.length < 4) return e164;
  final masked = '${local[0]}${'•' * (local.length - 4)}${local.substring(local.length - 3)}';
  final grouped = masked.length == 9 ? '${masked.substring(0, 3)} ${masked.substring(3, 6)} ${masked.substring(6)}' : masked;
  return '+$dial $grouped';
}
