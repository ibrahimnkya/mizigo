import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';

// ─── Steps ────────────────────────────────────────────────────────────────────

enum _ForgotStep { identifier, verify, reset }

// ─── Country model ────────────────────────────────────────────────────────────

class _Country {
  final String name;
  final String code;
  final String dialCode;
  final String flag;
  const _Country({
    required this.name,
    required this.code,
    required this.dialCode,
    required this.flag,
  });
}

const List<_Country> _fpCountries = [
  _Country(name: 'Tanzania', code: 'TZ', dialCode: '+255', flag: '🇹🇿'),
  _Country(name: 'Kenya', code: 'KE', dialCode: '+254', flag: '🇰🇪'),
  _Country(name: 'Uganda', code: 'UG', dialCode: '+256', flag: '🇺🇬'),
  _Country(name: 'Rwanda', code: 'RW', dialCode: '+250', flag: '🇷🇼'),
  _Country(name: 'Ethiopia', code: 'ET', dialCode: '+251', flag: '🇪🇹'),
  _Country(name: 'South Africa', code: 'ZA', dialCode: '+27', flag: '🇿🇦'),
  _Country(name: 'Nigeria', code: 'NG', dialCode: '+234', flag: '🇳🇬'),
  _Country(name: 'Ghana', code: 'GH', dialCode: '+233', flag: '🇬🇭'),
  _Country(name: 'United States', code: 'US', dialCode: '+1', flag: '🇺🇸'),
  _Country(name: 'United Kingdom', code: 'GB', dialCode: '+44', flag: '🇬🇧'),
];

// ─── OTP Input Widget ─────────────────────────────────────────────────────────

class _OtpInput extends StatefulWidget {
  final int length;
  final ValueChanged<String> onCompleted;
  final VoidCallback? onChanged;

  const _OtpInput({
    super.key,
    this.length = 4,
    required this.onCompleted,
    this.onChanged,
  });

  @override
  State<_OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<_OtpInput> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers =
        List.generate(widget.length, (_) => TextEditingController());
    _focusNodes = List.generate(widget.length, (_) => FocusNode());

    for (var fn in _focusNodes) {
      fn.addListener(() => setState(() {}));
    }
  }

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    for (var fn in _focusNodes) {
      fn.dispose();
    }
    super.dispose();
  }

  String get _value =>
      _controllers.map((c) => c.text).join();

  void clear() {
    for (var c in _controllers) {
      c.clear();
    }
    _focusNodes.first.requestFocus();
    setState(() {});
  }

  void _onChanged(int index, String value) {
    if (value.length > 1) {
      // Handle paste: distribute digits across cells
      final digits = value.replaceAll(RegExp(r'\D'), '');
      for (var i = 0; i < widget.length && i < digits.length; i++) {
        _controllers[i].text = digits[i];
      }
      final next = (digits.length - 1).clamp(0, widget.length - 1);
      _focusNodes[next].requestFocus();
      setState(() {});
    } else if (value.isNotEmpty) {
      if (index < widget.length - 1) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
      }
    }
    widget.onChanged?.call();
    if (_value.length == widget.length) {
      widget.onCompleted(_value);
    }
    setState(() {});
  }

  void _onKeyEvent(int index, KeyEvent event) {
    if (event is KeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.backspace) {
      if (_controllers[index].text.isEmpty && index > 0) {
        _controllers[index - 1].clear();
        _focusNodes[index - 1].requestFocus();
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(widget.length, (i) {
        final isFocused = _focusNodes[i].hasFocus;
        final isFilled = _controllers[i].text.isNotEmpty;

        return KeyboardListener(
          focusNode: FocusNode(),
          onKeyEvent: (e) => _onKeyEvent(i, e),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: 68,
            height: 72,
            decoration: BoxDecoration(
              color: isFocused
                  ? theme.cardColor
                  : isFilled
                      ? theme.primaryColor.withValues(alpha: 0.1)
                      : theme.cardColor.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isFocused
                    ? theme.primaryColor
                    : isFilled
                        ? theme.primaryColor.withValues(alpha: 0.5)
                        : theme.dividerColor,
                width: isFocused ? 2.0 : 1.5,
              ),
              boxShadow: isFocused
                  ? [
                      BoxShadow(
                        color: theme.primaryColor.withValues(alpha: 0.1),
                        blurRadius: 0,
                        spreadRadius: 3,
                      ),
                    ]
                  : [],
            ),
            child: Center(
              child: TextField(
                controller: _controllers[i],
                focusNode: _focusNodes[i],
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                maxLength: 2, // allow paste of multiple digits
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                style: GoogleFonts.outfit(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: theme.textTheme.titleLarge?.color,
                  letterSpacing: 0,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  counterText: '',
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                ),
                onChanged: (v) => _onChanged(i, v),
              ),
            ),
          ),
        );
      }),
    );
  }
}

// ─── Forgot Password Screen ───────────────────────────────────────────────────

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen>
    with SingleTickerProviderStateMixin {
  _ForgotStep _step = _ForgotStep.identifier;

  late TabController _tabController;
  bool get _isPhone => _tabController.index == 1;

  // Identifier
  final _identifierFormKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  _Country _selectedCountry = _fpCountries.first;
  bool _sendingCode = false;

  // Verify
  final _otpKey = GlobalKey<_OtpInputState>();
  String _otpValue = '';
  static const _countdownSecs = 60;
  int _secondsLeft = _countdownSecs;
  Timer? _timer;
  bool _verifying = false;
  String? _otpError;

  // Reset
  final _resetFormKey = GlobalKey<FormState>();
  final _newPassCtrl = TextEditingController();
  final _confirmPassCtrl = TextEditingController();
  bool _obscureNew = true;
  bool _obscureConfirm = true;
  bool _resetting = false;
  bool _resetDone = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tabController.dispose();
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    _newPassCtrl.dispose();
    _confirmPassCtrl.dispose();
    _timer?.cancel();
    super.dispose();
  }

  // ── Countdown ────────────────────────────────────────────────────────────────

  void _startCountdown() {
    _timer?.cancel();
    setState(() => _secondsLeft = _countdownSecs);
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_secondsLeft <= 1) {
        t.cancel();
        setState(() => _secondsLeft = 0);
      } else {
        setState(() => _secondsLeft--);
      }
    });
  }

  String get _countdownLabel {
    final m = _secondsLeft ~/ 60;
    final s = _secondsLeft % 60;
    return '$m:${s.toString().padLeft(2, '0')}';
  }

  // ── Country picker ────────────────────────────────────────────────────────────

  Future<void> _pickCountry() async {
    final result = await showModalBottomSheet<_Country>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _FpCountryPickerSheet(
          selected: _selectedCountry, countries: _fpCountries),
    );
    if (result != null) setState(() => _selectedCountry = result);
  }

  // ── Actions ───────────────────────────────────────────────────────────────────

  Future<void> _sendCode() async {
    if (!_identifierFormKey.currentState!.validate()) return;
    setState(() => _sendingCode = true);

    final auth = context.read<AuthProvider>();
    final identifier =
        _isPhone ? _phoneCtrl.text : _emailCtrl.text;
    final data =
        await auth.initiateForgotPassword(identifier, _isPhone);

    if (!mounted) return;
    setState(() => _sendingCode = false);

    if (data != null) {
      if (data.containsKey('code')) {
        debugPrint('DEV: Reset code is ${data['code']}');
      }
      setState(() {
        _step = _ForgotStep.verify;
        _otpValue = '';
        _otpError = null;
      });
      _startCountdown();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(auth.error ?? 'Failed to send reset code'),
          backgroundColor: const Color(0xFFEF4444),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)),
        ),
      );
    }
  }

  Future<void> _verifyCode() async {
    if (_otpValue.length < 4) {
      setState(() => _otpError = 'Please enter the 4-digit code');
      return;
    }
    setState(() {
      _verifying = true;
      _otpError = null;
    });
    await Future.delayed(const Duration(milliseconds: 600));
    if (!mounted) return;
    setState(() {
      _verifying = false;
      _step = _ForgotStep.reset;
    });
  }

  void _resendCode() {
    if (_secondsLeft > 0) return;
    _otpKey.currentState?.clear();
    setState(() {
      _otpValue = '';
      _otpError = null;
    });
    _sendCode();
  }

  Future<void> _resetPassword() async {
    if (!_resetFormKey.currentState!.validate()) return;
    setState(() => _resetting = true);

    final auth = context.read<AuthProvider>();
    final identifier =
        _isPhone ? _phoneCtrl.text : _emailCtrl.text;
    final success = await auth.completePasswordReset(
      identifier: identifier,
      isPhone: _isPhone,
      code: _otpValue,
      newPassword: _newPassCtrl.text,
    );

    if (!mounted) return;
    setState(() => _resetting = false);

    if (success) {
      setState(() => _resetDone = true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(auth.error ?? 'Failed to reset password'),
          backgroundColor: const Color(0xFFEF4444),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)),
        ),
      );
    }
  }

  // ── Shared widgets ────────────────────────────────────────────────────────────

  InputDecoration _inputDecoration({
    required String hint,
    required List<List<dynamic>> prefixIcon,
    Widget? suffix,
  }) {
    final theme = Theme.of(context);
    return InputDecoration(
      hintText: hint,
      hintStyle:
          GoogleFonts.inter(color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.5), fontSize: 14),
      prefixIcon: Padding(
        padding: const EdgeInsets.all(12.0),
        child: HugeIcon(icon: prefixIcon, size: 20, color: theme.iconTheme.color?.withValues(alpha: 0.6) ?? const Color(0xFF94A3B8)),
      ),
      suffixIcon: suffix,
      filled: true,
      fillColor: WidgetStateColor.resolveWith(
        (s) => s.contains(WidgetState.focused)
            ? (theme.brightness == Brightness.dark ? theme.cardColor : Colors.white)
            : theme.cardColor.withValues(alpha: 0.5),
      ),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide:
            BorderSide(color: theme.dividerColor, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide:
            BorderSide(color: theme.primaryColor, width: 2.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide:
            BorderSide(color: theme.colorScheme.error, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide:
            BorderSide(color: theme.colorScheme.error, width: 2.0),
      ),
      errorStyle: GoogleFonts.inter(
          fontSize: 12, color: theme.colorScheme.error),
    );
  }

  Widget _label(String text) {
    final theme = Theme.of(context);
    return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.7),
            letterSpacing: 0.2,
          ),
        ),
      );
  }

  Widget _ctaButton({
    required String label,
    required VoidCallback? onPressed,
    bool loading = false,
  }) {
    final theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: const Color(0xFF3B82F6),
          disabledBackgroundColor: theme.dividerColor.withValues(alpha: 0.1),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)),
          elevation: 0,
          shadowColor: Colors.transparent,
        ).copyWith(
          overlayColor: WidgetStateProperty.resolveWith(
            (s) => s.contains(WidgetState.pressed)
                ? Colors.white.withValues(alpha: 0.1)
                : null,
          ),
        ),
        child: loading
            ? const SizedBox.square(
                dimension: 22,
                child: CircularProgressIndicator(
                    color: Colors.white, strokeWidth: 2.5),
              )
            : Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }

  String get _appBarTitle => switch (_step) {
        _ForgotStep.identifier => 'Forgot Password',
        _ForgotStep.verify => 'Verify Code',
        _ForgotStep.reset => 'New Password',
      };

  // ── Step indicator ────────────────────────────────────────────────────────────

  Widget _stepIndicator() {
    final steps = _ForgotStep.values;
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: steps.asMap().entries.map((e) {
        final idx = e.key;
        final s = e.value;
        final isActive = s == _step;
        final isDone = steps.indexOf(_step) > idx;
        return Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: isActive ? 28 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: isDone
                    ? const Color(0xFF10B981)
                    : isActive
                        ? theme.primaryColor
                        : theme.dividerColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            if (idx < steps.length - 1) const Gap(6),
          ],
        );
      }).toList(),
    );
  }

  // ── Step 1: Identifier ────────────────────────────────────────────────────────

  Widget _buildIdentifierStep() {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: HugeIcon(icon: HugeIcons.strokeRoundedLockPassword,
              size: 34, color: theme.primaryColor),
        ),
        const Gap(20),
        Text(
          'Reset your password',
          style: GoogleFonts.outfit(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: theme.textTheme.titleLarge?.color),
        ),
        const Gap(6),
        Text(
          "Enter your email or phone number and we'll send you a reset code.",
          style: GoogleFonts.inter(
              fontSize: 14, color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.6), height: 1.5),
        ),
        const Gap(28),

        // Tab switcher
        Container(
          height: 48,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(13),
          ),
          child: TabBar(
            controller: _tabController,
            indicator: BoxDecoration(
              color: theme.brightness == Brightness.dark
                  ? theme.primaryColor.withValues(alpha: 0.2)
                  : Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.07),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
            labelColor: theme.textTheme.titleLarge?.color,
            unselectedLabelColor: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.5),
            labelStyle: GoogleFonts.inter(
                fontWeight: FontWeight.w700, fontSize: 14),
            unselectedLabelStyle: GoogleFonts.inter(
                fontWeight: FontWeight.w500, fontSize: 14),
            tabs: const [Tab(text: 'Email'), Tab(text: 'Phone')],
          ),
        ),
        const Gap(20),

        Form(
          key: _identifierFormKey,
          child: _isPhone ? _buildPhoneField() : _buildEmailField(),
        ),
        const Gap(28),
        _ctaButton(
          label: 'Send Reset Code',
          onPressed: _sendingCode ? null : _sendCode,
          loading: _sendingCode,
        ),
      ],
    );
  }

  Widget _buildEmailField() {
    final theme = Theme.of(context);
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _label('Email address'),
          TextFormField(
            controller: _emailCtrl,
            keyboardType: TextInputType.emailAddress,
            style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: theme.textTheme.bodyLarge?.color),
            decoration: _inputDecoration(
              hint: 'you@example.com',
              prefixIcon: HugeIcons.strokeRoundedMail01,
            ),
            validator: (v) => (v == null || !v.contains('@'))
                ? 'Enter a valid email'
                : null,
          ),
        ],
      );
  }

  Widget _buildPhoneField() {
    final theme = Theme.of(context);
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _label('Phone number'),
          Container(
            decoration: BoxDecoration(
              color: theme.cardColor.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                  color: theme.dividerColor, width: 1.5),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: _pickCountry,
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 18),
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                            color: theme.dividerColor, width: 1.5),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(_selectedCountry.flag,
                            style: const TextStyle(fontSize: 20)),
                        const Gap(6),
                        Text(
                          _selectedCountry.dialCode,
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: theme.textTheme.bodyLarge?.color),
                        ),
                        const Gap(2),
                        HugeIcon(icon: HugeIcons.strokeRoundedArrowDown01,
                            size: 16, color: theme.iconTheme.color?.withValues(alpha: 0.5) ?? const Color(0xFF94A3B8)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    controller: _phoneCtrl,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(12),
                    ],
                    style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: theme.textTheme.bodyLarge?.color,
                        letterSpacing: 1.2),
                    decoration: InputDecoration(
                      hintText: '712 345 678',
                      hintStyle: GoogleFonts.inter(
                          color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.3),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      filled: false,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 18),
                      errorStyle: const TextStyle(height: 0),
                    ),
                    validator: (v) => (v == null || v.length < 7)
                        ? 'Enter a valid number'
                        : null,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
  }

  // ── Step 2: Verify ────────────────────────────────────────────────────────────

  Widget _buildVerifyStep() {
    final theme = Theme.of(context);
    final identifier = _isPhone
        ? '${_selectedCountry.dialCode} ${_phoneCtrl.text}'
        : _emailCtrl.text;
    final canResend = _secondsLeft == 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFEFF6FF), Color(0xFFDBEAFE)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const HugeIcon(icon: HugeIcons.strokeRoundedMail01,
              size: 34, color: Color(0xFF3B82F6)),
        ),
        const Gap(20),
        Text(
          'Enter the code',
          style: GoogleFonts.outfit(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: theme.textTheme.titleLarge?.color),
        ),
        const Gap(6),
        RichText(
          text: TextSpan(
            style: GoogleFonts.inter(
                fontSize: 14,
                color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
                height: 1.5),
            children: [
              const TextSpan(text: 'We sent a 4-digit code to\n'),
              TextSpan(
                text: identifier,
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    color: theme.textTheme.bodyLarge?.color),
              ),
            ],
          ),
        ),

        const Gap(32),

        // ── OTP cells ───────────────────────────────────────────
        _OtpInput(
          key: _otpKey,
          length: 4,
          onChanged: () => setState(() => _otpError = null),
          onCompleted: (v) {
            setState(() => _otpValue = v);
          },
        ),

        // Error message
        AnimatedSize(
          duration: const Duration(milliseconds: 200),
          child: _otpError != null
              ? Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      const HugeIcon(icon: HugeIcons.strokeRoundedInformationCircle,
                          size: 14, color: Color(0xFFEF4444)),
                      const Gap(6),
                      Text(
                        _otpError!,
                        style: GoogleFonts.inter(
                            fontSize: 12,
                            color: const Color(0xFFEF4444)),
                      ),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
        ),

        const Gap(20),

        // Resend row
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Didn't receive the code? ",
              style: GoogleFonts.inter(
                  fontSize: 13, color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.5)),
            ),
            if (canResend)
              GestureDetector(
                onTap: _resendCode,
                child: Text(
                  'Resend',
                  style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: theme.primaryColor),
                ),
              )
            else
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  _countdownLabel,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF64748B),
                    fontFeatures: [
                      const FontFeature.tabularFigures()
                    ],
                  ),
                ),
              ),
          ],
        ),

        const Gap(28),

        _ctaButton(
          label: 'Verify Code',
          onPressed: _verifying ? null : _verifyCode,
          loading: _verifying,
        ),

        const Gap(16),

        Center(
          child: TextButton(
            onPressed: () {
              _timer?.cancel();
              setState(() => _step = _ForgotStep.identifier);
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              _isPhone ? 'Change phone number' : 'Change email address',
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF64748B),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ── Step 3: Reset ─────────────────────────────────────────────────────────────

  Widget _buildResetStep() {
    final theme = Theme.of(context);
    if (_resetDone) return _buildSuccessState();

    return Form(
      key: _resetFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: const Color(0xFFF0FDF4),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const HugeIcon(icon: HugeIcons.strokeRoundedLockPassword,
                size: 34, color: Color(0xFF10B981)),
          ),
          const Gap(20),
          Text(
            'Create new password',
            style: GoogleFonts.outfit(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: theme.textTheme.titleLarge?.color),
          ),
          const Gap(6),
          Text(
            'Your new password must be at least 8 characters long.',
            style: GoogleFonts.inter(
                fontSize: 14,
                color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
                height: 1.5),
          ),
          const Gap(28),

          _label('New password'),
          TextFormField(
            controller: _newPassCtrl,
            obscureText: _obscureNew,
            style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: theme.textTheme.bodyLarge?.color),
            decoration: _inputDecoration(
              hint: 'Enter new password',
              prefixIcon: HugeIcons.strokeRoundedLockPassword,
              suffix: IconButton(
                icon: HugeIcon(
                  icon: _obscureNew
                      ? HugeIcons.strokeRoundedView
                      : HugeIcons.strokeRoundedViewOffSlash,
                  size: 20,
                  color: theme.iconTheme.color?.withValues(alpha: 0.5) ?? const Color(0xFF94A3B8),
                ),
                onPressed: () =>
                    setState(() => _obscureNew = !_obscureNew),
                splashRadius: 20,
              ),
            ),
            validator: (v) =>
                (v == null || v.length < 8) ? 'Minimum 8 characters' : null,
          ),

          const Gap(16),

          _label('Confirm password'),
          TextFormField(
            controller: _confirmPassCtrl,
            obscureText: _obscureConfirm,
            style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: theme.textTheme.bodyLarge?.color),
            decoration: _inputDecoration(
              hint: 'Confirm new password',
              prefixIcon: HugeIcons.strokeRoundedLockPassword,
              suffix: IconButton(
                icon: HugeIcon(
                  icon: _obscureConfirm
                      ? HugeIcons.strokeRoundedView
                      : HugeIcons.strokeRoundedViewOffSlash,
                  size: 20,
                  color: theme.iconTheme.color?.withValues(alpha: 0.5) ?? const Color(0xFF94A3B8),
                ),
                onPressed: () =>
                    setState(() => _obscureConfirm = !_obscureConfirm),
                splashRadius: 20,
              ),
            ),
            validator: (v) => v != _newPassCtrl.text
                ? 'Passwords do not match'
                : null,
          ),

          const Gap(28),

          _ctaButton(
            label: 'Reset Password',
            onPressed: _resetting ? null : _resetPassword,
            loading: _resetting,
          ),
        ],
      ),
    );
  }

  // ── Success ───────────────────────────────────────────────────────────────────

  Widget _buildSuccessState() {
    final theme = Theme.of(context);
    return Column(
      children: [
        const Gap(24),
        Center(
          child: Container(
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              color: theme.brightness == Brightness.dark
                  ? Colors.green.withValues(alpha: 0.1)
                  : const Color(0xFFF0FDF4),
              shape: BoxShape.circle,
            ),
            child: HugeIcon(icon: HugeIcons.strokeRoundedCheckmarkCircle01,
                size: 48, color: theme.brightness == Brightness.dark ? Colors.green : const Color(0xFF10B981)),
          ),
        ),
        const Gap(28),
        Text(
          'Password reset!',
          textAlign: TextAlign.center,
          style: GoogleFonts.outfit(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: theme.textTheme.titleLarge?.color),
        ),
        const Gap(8),
        Text(
          'Your password has been updated successfully.\nYou can now sign in with your new password.',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
              fontSize: 14,
              color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
              height: 1.6),
        ),
        const Gap(40),
        _ctaButton(
          label: 'Back to Sign In',
          onPressed: () => context.go('/login'),
        ),
      ],
    );
  }

  // ── Build ─────────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bottomPad = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: HugeIcon(
            icon: HugeIcons.strokeRoundedArrowLeft01,
            color: theme.textTheme.titleLarge?.color,
            size: 20,
          ),
          onPressed: () {
            if (_step == _ForgotStep.identifier || _resetDone) {
              context.pop();
            } else {
              _timer?.cancel();
              final idx = _ForgotStep.values.indexOf(_step);
              setState(() {
                _step = _ForgotStep.values[idx - 1];
              });
            }
          },
        ),
        title: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: Text(
            _appBarTitle,
            key: ValueKey(_appBarTitle),
            style: GoogleFonts.outfit(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1E293B),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: PopScope(
        canPop: _step == _ForgotStep.identifier || _resetDone,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          _timer?.cancel();
          final idx = _ForgotStep.values.indexOf(_step);
          setState(() => _step = _ForgotStep.values[idx - 1]);
        },
        child: SafeArea(
          child: SingleChildScrollView(
            padding:
                EdgeInsets.fromLTRB(24, 16, 24, bottomPad + 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!_resetDone) ...[
                  Center(child: _stepIndicator()),
                  const Gap(28),
                ],
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  transitionBuilder: (child, anim) => FadeTransition(
                    opacity: anim,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0.04, 0),
                        end: Offset.zero,
                      ).animate(anim),
                      child: child,
                    ),
                  ),
                  child: KeyedSubtree(
                    key: ValueKey(_step),
                    child: switch (_step) {
                      _ForgotStep.identifier => _buildIdentifierStep(),
                      _ForgotStep.verify => _buildVerifyStep(),
                      _ForgotStep.reset => _buildResetStep(),
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Country Picker Sheet ─────────────────────────────────────────────────────

class _FpCountryPickerSheet extends StatefulWidget {
  final _Country selected;
  final List<_Country> countries;
  const _FpCountryPickerSheet(
      {required this.selected, required this.countries});

  @override
  State<_FpCountryPickerSheet> createState() =>
      _FpCountryPickerSheetState();
}

class _FpCountryPickerSheetState extends State<_FpCountryPickerSheet> {
  final TextEditingController _search = TextEditingController();
  late List<_Country> _filtered;

  @override
  void initState() {
    super.initState();
    _filtered = widget.countries;
    _search.addListener(() {
      final q = _search.text.toLowerCase();
      setState(() {
        _filtered = widget.countries
            .where((c) =>
                c.name.toLowerCase().contains(q) ||
                c.dialCode.contains(q))
            .toList();
      });
    });
  }

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: theme.dividerColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Select Country',
            style: GoogleFonts.outfit(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: theme.textTheme.titleLarge?.color),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _search,
              style: GoogleFonts.inter(
                  fontSize: 14, color: theme.textTheme.bodyLarge?.color),
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: GoogleFonts.inter(
                    color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.5), fontSize: 14),
                prefixIcon: HugeIcon(icon: HugeIcons.strokeRoundedSearch01,
                    color: theme.iconTheme.color?.withValues(alpha: 0.5) ?? const Color(0xFF94A3B8), size: 20),
                filled: true,
                fillColor: theme.cardColor,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                      color: theme.dividerColor, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                      color: theme.primaryColor, width: 2.0),
                ),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 12),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: _filtered.length,
              itemBuilder: (_, i) {
                final c = _filtered[i];
                final isSel = c.code == widget.selected.code;
                return ListTile(
                  leading: Text(c.flag,
                      style: const TextStyle(fontSize: 24)),
                  title: Text(
                    c.name,
                    style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: isSel
                            ? FontWeight.w700
                            : FontWeight.w500,
                        color: theme.textTheme.bodyLarge?.color),
                  ),
                  trailing: Text(
                    c.dialCode,
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.6)),
                  ),
                  selected: isSel,
                  selectedTileColor: theme.primaryColor.withValues(alpha: 0.1),
                  onTap: () => Navigator.of(context).pop(c),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}