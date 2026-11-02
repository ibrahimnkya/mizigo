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

/// Set a new 6-digit Safety PIN. The router forces this after signing in with
/// a temporary PIN (Forgot PIN or an admin-issued first PIN).
class ChangePinScreen extends StatefulWidget {
  const ChangePinScreen({super.key});

  @override
  State<ChangePinScreen> createState() => _ChangePinScreenState();
}

class _ChangePinScreenState extends State<ChangePinScreen> {
  static const _pinLength = 6;

  final _newPinCtrl = TextEditingController();
  final _newFocus = FocusNode();
  bool _obscure = true;

  @override
  void initState() {
    super.initState();
    _newPinCtrl.addListener(_refresh);
  }

  @override
  void dispose() {
    _newPinCtrl.dispose();
    _newFocus.dispose();
    super.dispose();
  }

  void _refresh() => setState(() {});

  /// Rejects PINs that are trivially guessable: 111111, 123456, 654321…
  static bool _isWeak(String pin) {
    if (pin.split('').toSet().length == 1) return true;
    var up = true, down = true;
    for (var i = 1; i < pin.length; i++) {
      final d = pin.codeUnitAt(i) - pin.codeUnitAt(i - 1);
      if (d != 1) up = false;
      if (d != -1) down = false;
    }
    return up || down;
  }

  String? get _newPinError {
    final pin = _newPinCtrl.text;
    if (pin.length == _pinLength && _isWeak(pin)) {
      return 'Too easy to guess — avoid repeated or sequential digits';
    }
    return null;
  }

  bool get _ready => _newPinCtrl.text.length == _pinLength && _newPinError == null;

  Future<void> _submit() async {
    final auth = context.read<AuthProvider>();
    if (!_ready || auth.loading) return;

    FocusScope.of(context).unfocus();
    final ok = await auth.changeOperatorOtp(_newPinCtrl.text);
    if (!mounted) return;
    if (ok) {
      MizigoToasts.showSuccess(context, 'Your new PIN is set');
      context.go('/home');
    } else {
      MizigoToasts.showError(context, auth.error ?? 'Failed to update PIN');
    }
  }

  Future<void> _signOut() async {
    await context.read<AuthProvider>().logout();
    if (mounted) context.go('/login');
  }

  Widget _label(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Text(
      text,
      style: GoogleFonts.outfit(fontSize: 15, fontWeight: FontWeight.w500, color: StaffPalette.of(context).fg(0.85)),
    ),
  );

  Widget _error(String? message) => AnimatedSize(
    duration: const Duration(milliseconds: 150),
    child: message == null
        ? const SizedBox(width: double.infinity)
        : Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(message, style: GoogleFonts.outfit(fontSize: 13, color: const Color(0xFFF87171))),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final loading = context.watch<AuthProvider>().loading;

    return ClerkAuthScaffold(
      title: 'Set New PIN',
      description: 'Create a 6-digit PIN you’ll use to sign in.',
      leading: IconButton(
        onPressed: _signOut,
        tooltip: 'Cancel and sign out',
        icon: HugeIcon(icon: HugeIcons.strokeRoundedCancel01, color: StaffPalette.of(context).fg(), size: 24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(child: _label('New PIN')),
              GestureDetector(
                onTap: () => setState(() => _obscure = !_obscure),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10, left: 8),
                  child: Row(
                    children: [
                      HugeIcon(
                        icon: _obscure ? HugeIcons.strokeRoundedView : HugeIcons.strokeRoundedViewOff,
                        color: StaffPalette.of(context).fg(0.7),
                        size: 18,
                      ),
                      const Gap(6),
                      Text(
                        _obscure ? 'Show' : 'Hide',
                        style: GoogleFonts.outfit(fontSize: 14, color: StaffPalette.of(context).fg(0.7)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ClerkCodeField(
            controller: _newPinCtrl,
            focusNode: _newFocus,
            length: _pinLength,
            obscure: _obscure,
            hasError: _newPinError != null,
            // No auto-submit: the user can review the PIN (tap "Show")
            // and press "Save PIN". To auto-submit instead, use:
            // onCompleted: (_) { if (_ready) _submit(); },
            onCompleted: (_) {},
          ),
          _error(_newPinError),
          const Gap(28),
          ClerkPrimaryButton(label: 'Save PIN', loading: loading, visible: _ready, onPressed: _submit),
        ],
      ),
    );
  }
}