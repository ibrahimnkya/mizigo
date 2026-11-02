import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../providers/auth_provider.dart';
import '../../theme/staff_palette.dart';
import '../../widgets/auth/clerk_auth_widgets.dart';
import '../../widgets/profile/premium_settings_components.dart';
import '../../theme/app_theme.dart';

/// Station Clerk Login — Figma "2 On-Boarding 11–14".
///
/// Phone number + 6-digit Safety PIN on one screen; signs in through the
/// existing operator PIN login ([AuthProvider.verifyOtp]).
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static const _rememberedPhoneKey = 'login_remembered_phone';
  static const _pinLength = 6;

  final _phoneController = TextEditingController();
  final _pinController = TextEditingController();
  final _phoneFocus = FocusNode();
  final _pinFocus = FocusNode();

  bool _rememberMe = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && context.read<AuthProvider>().consumeSessionExpired()) {
        MizigoToasts.showError(context, 'Your session expired. Please sign in again.');
      }
    });
    _phoneController.addListener(_refresh);
    _pinController.addListener(_refresh);
    _loadRememberedPhone();
  }

  void _refresh() => setState(() {});

  bool get _canSubmit => clerkPhoneE164(_phoneController.text) != null && _pinController.text.length == _pinLength;

  @override
  void dispose() {
    _phoneController.dispose();
    _pinController.dispose();
    _phoneFocus.dispose();
    _pinFocus.dispose();
    super.dispose();
  }

  Future<void> _loadRememberedPhone() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_rememberedPhoneKey);
    if (saved == null || !mounted) return;
    _phoneController.text = clerkPhoneFieldText(saved);
  }

  Future<void> _signIn() async {
    final auth = context.read<AuthProvider>();
    if (auth.loading) return;

    final phone = clerkPhoneE164(_phoneController.text);
    if (phone == null) {
      MizigoToasts.showError(context, 'Enter a valid phone number');
      _phoneFocus.requestFocus();
      return;
    }
    if (_pinController.text.length != _pinLength) {
      MizigoToasts.showError(context, 'Enter your 6-digit PIN');
      _pinFocus.requestFocus();
      return;
    }

    FocusScope.of(context).unfocus();

    final prefs = await SharedPreferences.getInstance();
    if (_rememberMe) {
      await prefs.setString(_rememberedPhoneKey, phone);
    } else {
      await prefs.remove(_rememberedPhoneKey);
    }

    final ok = await auth.verifyOtp(phone, _pinController.text);
    if (!mounted) return;
    if (ok) {
      context.go('/home'); // Router redirects to PIN change when required
    } else {
      MizigoToasts.showError(context, auth.error ?? 'Sign in failed');
      _pinController.clear();
      _pinFocus.requestFocus();
    }
  }

  void _openForgotPin() {
    context.push('/forgot-pin', extra: clerkPhoneE164(_phoneController.text));
  }

  void _showHelpModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          color: StaffPalette.of(context).navBackground,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Station Clerk Help',
                  style: GoogleFonts.outfit(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: StaffPalette.of(context).fg(),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close_rounded, color: StaffPalette.of(context).fg(0.6)),
                ),
              ],
            ),
            const Gap(8),
            Text(
              'Follow these instructions for a smooth login experience.',
              style: GoogleFonts.inter(color: StaffPalette.of(context).fg(0.6), fontSize: 14),
            ),
            const Gap(24),
            Expanded(
              child: ListView(
                children: [
                  _helpItem(
                    'Onboarding',
                    'Your account is registered by an administrator. There is no self-registration for staff.',
                    HugeIcons.strokeRoundedUserAdd01,
                  ),
                  _helpItem(
                    'Forgot your PIN?',
                    'Tap "Forgot PIN?" to get a temporary PIN by SMS, then set a new one.',
                    HugeIcons.strokeRoundedShield01,
                  ),
                  _helpItem(
                    'First sign in',
                    'Use the temporary PIN your admin gave you. You will be asked to set your own PIN right after.',
                    HugeIcons.strokeRoundedLockPassword,
                  ),
                ],
              ),
            ),
            const Gap(16),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.tecOrange,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                child: Text(
                  'Got it',
                  style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _helpItem(String title, String desc, dynamic icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.tecOrange.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: HugeIcon(icon: icon, color: AppTheme.tecOrange, size: 22),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w700, color: StaffPalette.of(context).fg()),
                ),
                const Gap(4),
                Text(
                  desc,
                  style: GoogleFonts.inter(fontSize: 14, color: StaffPalette.of(context).fg(0.6), height: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loading = context.watch<AuthProvider>().loading;

    return ClerkAuthScaffold(
      title: 'Station Clerk Login',
      footerLead: 'By signing in, you agree to our',
      description: 'Sign in to manage parcels and station operations.',
      leading: IconButton(
        onPressed: _showHelpModal,
        tooltip: 'Help',
        icon: HugeIcon(icon: HugeIcons.strokeRoundedHelpCircle, color: StaffPalette.of(context).fg(), size: 24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClerkPhoneField(
            controller: _phoneController,
            focusNode: _phoneFocus,
            onSubmitted: (_) => _pinFocus.requestFocus(),
          ),
          const Gap(10),
          ClerkPinField(
            controller: _pinController,
            focusNode: _pinFocus,
            length: _pinLength,
            onSubmitted: (_) => _signIn(),
          ),
          const Gap(14),
          Row(
            children: [
              InkWell(
                onTap: () => setState(() => _rememberMe = !_rememberMe),
                borderRadius: BorderRadius.circular(6),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 2),
                  child: Row(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          color: _rememberMe ? AppTheme.tecOrange : Colors.transparent,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: _rememberMe ? AppTheme.tecOrange : StaffPalette.of(context).fg(0.5),
                            width: 1.5,
                          ),
                        ),
                        child: _rememberMe ? const Icon(Icons.check_rounded, size: 14, color: Colors.white) : null,
                      ),
                      const Gap(10),
                      Text(
                        'Remember Me',
                        style: GoogleFonts.outfit(fontSize: 14, color: StaffPalette.of(context).fg(0.85)),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: _openForgotPin,
                style: TextButton.styleFrom(
                  foregroundColor: AppTheme.tecOrange,
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  minimumSize: const Size(0, 36),
                ),
                child: Text('Forgot PIN?', style: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
          const Gap(28),
          ClerkPrimaryButton(label: 'Sign In', loading: loading, visible: _canSubmit, onPressed: _signIn),
        ],
      ),
    );
  }
}
