import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../theme/staff_palette.dart';
import '../../widgets/auth/clerk_auth_widgets.dart';
import '../../widgets/profile/premium_settings_components.dart';

/// Forgot PIN — sends a temporary 6-digit PIN by SMS
/// (`POST /auth/operator/reset-otp`), then hands off to `/verify`. Signing in
/// with the temporary PIN forces a PIN change via the router.
class ForgotPinScreen extends StatefulWidget {
  const ForgotPinScreen({super.key, this.initialPhone});

  /// E.164 number carried over from the login screen, if one was typed.
  final String? initialPhone;

  @override
  State<ForgotPinScreen> createState() => _ForgotPinScreenState();
}

class _ForgotPinScreenState extends State<ForgotPinScreen> {
  final _phoneController = TextEditingController();
  final _phoneFocus = FocusNode();
  Timer? _ticker;

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(() => setState(() {}));
    final initial = widget.initialPhone;
    if (initial != null) _phoneController.text = clerkPhoneFieldText(initial);
    // Re-render each second so a rate-limit countdown stays live.
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) setState(() {});
    });
  }

  /// Seconds before this number may request another code (server-enforced).
  int get _waitSeconds {
    final phone = clerkPhoneE164(_phoneController.text);
    return phone == null ? 0 : context.read<AuthProvider>().otpWaitSeconds(phone);
  }

  static String _clock(int s) => '${s ~/ 60}:${(s % 60).toString().padLeft(2, '0')}';

  @override
  void dispose() {
    _ticker?.cancel();
    _phoneController.dispose();
    _phoneFocus.dispose();
    super.dispose();
  }

  Future<void> _sendCode() async {
    final auth = context.read<AuthProvider>();
    if (auth.loading) return;

    final phone = clerkPhoneE164(_phoneController.text);
    if (phone == null) {
      MizigoToasts.showError(context, 'Enter a valid phone number');
      _phoneFocus.requestFocus();
      return;
    }

    FocusScope.of(context).unfocus();
    final ok = await auth.sendOtp(phone);
    if (!mounted) return;
    if (ok) {
      MizigoToasts.showSuccess(context, 'Temporary PIN sent to $phone');
      context.push('/verify', extra: phone);
    } else {
      MizigoToasts.showError(context, auth.error ?? 'Could not send the code');
    }
  }

  @override
  Widget build(BuildContext context) {
    final loading = context.watch<AuthProvider>().loading;
    final wait = _waitSeconds;

    return ClerkAuthScaffold(
      title: 'Forgot PIN',
      description: 'Enter your registered phone number and we’ll text you a temporary PIN.',
      leading: IconButton(
        onPressed: () => context.pop(),
        tooltip: 'Back',
        icon: HugeIcon(icon: HugeIcons.strokeRoundedArrowLeft02, color: StaffPalette.of(context).fg(), size: 24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClerkPhoneField(
            controller: _phoneController,
            focusNode: _phoneFocus,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => _sendCode(),
          ),
          const Gap(14),
          Text(
            'The temporary PIN is valid for 5 minutes. You’ll set a new PIN right after signing in. '
            'Code requests are limited per hour and per day.',
            style: GoogleFonts.outfit(fontSize: 14, height: 1.4, color: StaffPalette.of(context).fg(0.65)),
          ),
          const Gap(28),
          ClerkPrimaryButton(
            label: wait > 0 ? 'Try again in ${_clock(wait)}' : 'Send Code',
            loading: loading,
            visible: clerkPhoneE164(_phoneController.text) != null,
            enabled: wait == 0,
            onPressed: _sendCode,
          ),
          const Gap(8),
          TextButton(
            onPressed: () => context.pop(),
            style: TextButton.styleFrom(foregroundColor: StaffPalette.of(context).fg(0.85)),
            child: Text('Back to Sign In', style: GoogleFonts.outfit(fontSize: 15, fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}
