import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:smart_auth/smart_auth.dart';
import '../../providers/auth_provider.dart';
import '../../theme/app_theme.dart';
import '../../theme/staff_palette.dart';
import '../../widgets/auth/clerk_auth_widgets.dart';
import '../../widgets/profile/premium_settings_components.dart';

/// Forgot PIN, step 2: enter the temporary 6-digit code sent by SMS.
///
/// Signing in with it marks the account for a PIN change, so the router sends
/// the clerk on to `/auth/change-pin` (step 3).
class VerificationScreen extends StatefulWidget {
  final String phoneNumber;
  const VerificationScreen({super.key, required this.phoneNumber});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  static const _codeLength = 6;
  static const _resendSeconds = 60;

  final _codeController = TextEditingController();
  final _codeFocus = FocusNode();
  Timer? _timer;
  int _secondsLeft = _resendSeconds;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _codeController.addListener(() {
      if (_hasError) setState(() => _hasError = false);
      setState(() {});
    });
    _startCountdown();
    _listenForSms();
  }

  /// Android: SMS User Consent API — when the code SMS arrives the system asks
  /// once to share it, then the code fills in and submits. No SMS permission or
  /// server-side app hash needed. iOS fills it via the keyboard
  /// (`AutofillHints.oneTimeCode` on the code field).
  Future<void> _listenForSms() async {
    if (!Platform.isAndroid) return;
    final res = await SmartAuth.instance.getSmsWithUserConsentApi(matcher: '\\d{$_codeLength}');
    if (!mounted || !res.hasData) return;
    final code = res.requireData.code;
    if (code != null && code.length == _codeLength) {
      _codeController.value = TextEditingValue(
        text: code,
        selection: TextSelection.collapsed(offset: code.length),
      );
    }
  }

  @override
  void dispose() {
    if (Platform.isAndroid) SmartAuth.instance.removeUserConsentApiListener();
    _timer?.cancel();
    _codeController.dispose();
    _codeFocus.dispose();
    super.dispose();
  }

  /// Counts down to when Resend is allowed: the server-reported wait for this
  /// number if longer than the default 60 s.
  void _startCountdown() {
    _timer?.cancel();
    final serverWait = context.read<AuthProvider>().otpWaitSeconds(widget.phoneNumber);
    setState(() => _secondsLeft = serverWait > _resendSeconds ? serverWait : _resendSeconds);
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_secondsLeft <= 1) {
        t.cancel();
        setState(() => _secondsLeft = 0);
      } else {
        setState(() => _secondsLeft--);
      }
    });
  }

  Future<void> _resend() async {
    final auth = context.read<AuthProvider>();
    if (_secondsLeft > 0 || auth.loading) return;

    final ok = await auth.sendOtp(widget.phoneNumber);
    if (!mounted) return;
    if (ok) {
      _codeController.clear();
      _codeFocus.requestFocus();
      _startCountdown();
      MizigoToasts.showSuccess(context, 'New code sent to ${clerkMaskPhone(widget.phoneNumber)}');
      if (Platform.isAndroid) {
        await SmartAuth.instance.removeUserConsentApiListener();
        if (mounted) _listenForSms();
      }
    } else {
      MizigoToasts.showError(context, auth.error ?? 'Failed to resend code');
      // Rate-limited: show the server's wait on the resend timer.
      if (auth.otpWaitSeconds(widget.phoneNumber) > 0) _startCountdown();
    }
  }

  Future<void> _verify() async {
    final auth = context.read<AuthProvider>();
    if (_codeController.text.length != _codeLength || auth.loading) return;

    _codeFocus.unfocus();
    final ok = await auth.verifyOtp(widget.phoneNumber, _codeController.text);
    if (!mounted) return;
    if (ok) {
      context.go('/home'); // Router redirects to /auth/change-pin for reset accounts
    } else {
      setState(() => _hasError = true);
      MizigoToasts.showError(context, auth.error ?? 'That code didn’t work');
      _codeController.clear();
      _codeFocus.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final loading = context.watch<AuthProvider>().loading;
    final complete = _codeController.text.length == _codeLength;
    final countdown = '${_secondsLeft ~/ 60}:${(_secondsLeft % 60).toString().padLeft(2, '0')}';

    return ClerkAuthScaffold(
      title: 'Verify Code',
      description: 'Enter the 6-digit code sent to ${clerkMaskPhone(widget.phoneNumber)}',
      leading: IconButton(
        onPressed: () => context.pop(),
        tooltip: 'Back',
        icon: HugeIcon(icon: HugeIcons.strokeRoundedArrowLeft02, color: StaffPalette.of(context).fg(), size: 24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClerkCodeField(
            controller: _codeController,
            focusNode: _codeFocus,
            length: _codeLength,
            hasError: _hasError,
            onCompleted: (_) => _verify(),
          ),
          const Gap(18),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Didn’t get the code?',
                style: GoogleFonts.outfit(fontSize: 14, color: StaffPalette.of(context).fg(0.6)),
              ),
              const Gap(6),
              _secondsLeft > 0
                  ? Text(
                      'Resend in $countdown',
                      style: GoogleFonts.outfit(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: StaffPalette.of(context).fg(0.85),
                        fontFeatures: const [FontFeature.tabularFigures()],
                      ),
                    )
                  : GestureDetector(
                      onTap: _resend,
                      child: Text(
                        'Resend code',
                        style: GoogleFonts.outfit(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.tecOrange,
                        ),
                      ),
                    ),
            ],
          ),
          const Gap(28),
          ClerkPrimaryButton(label: 'Verify', loading: loading, visible: complete, onPressed: _verify),
          const Gap(8),
          TextButton(
            onPressed: () => context.go('/login'),
            style: TextButton.styleFrom(foregroundColor: StaffPalette.of(context).fg(0.85)),
            child: Text('Back to Sign In', style: GoogleFonts.outfit(fontSize: 15, fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}
