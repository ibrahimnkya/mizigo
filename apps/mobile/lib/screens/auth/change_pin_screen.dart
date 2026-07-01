import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../theme/app_theme.dart';
import '../../widgets/profile/premium_settings_components.dart';

class ChangePinScreen extends StatefulWidget {
  const ChangePinScreen({super.key});

  @override
  State<ChangePinScreen> createState() => _ChangePinScreenState();
}

class _ChangePinScreenState extends State<ChangePinScreen> {
  final _newPinCtrl = TextEditingController();
  final _confirmPinCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _obscureNew = true;
  bool _obscureConfirm = true;
  bool _saving = false;

  @override
  void dispose() {
    _newPinCtrl.dispose();
    _confirmPinCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    
    setState(() => _saving = true);
    final auth = context.read<AuthProvider>();
    
    final ok = await auth.changeOperatorOtp(_newPinCtrl.text.trim());
    
    if (mounted) {
      setState(() => _saving = false);
      if (ok) {
        MizigoToasts.showSuccess(context, 'Safety PIN updated successfully!');
        context.go('/home');
      } else {
        MizigoToasts.showError(context, auth.error ?? 'Failed to update Safety PIN');
      }
    }
  }

  InputDecoration _inputDecoration({
    required String hint,
    required dynamic prefixIcon,
    Widget? suffix,
  }) {
    final theme = Theme.of(context);
    return InputDecoration(
      hintText: hint,
      hintStyle: GoogleFonts.inter(
        color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.5) ?? Colors.black38,
        fontSize: 15,
      ),
      prefixIcon: Padding(
        padding: const EdgeInsets.all(12.0),
        child: HugeIcon(
          icon: prefixIcon,
          size: 20,
          color: theme.iconTheme.color?.withValues(alpha: 0.5) ?? const Color(0xFF94A3B8),
        ),
      ),
      suffixIcon: suffix,
      filled: true,
      fillColor: theme.cardTheme.color?.withValues(alpha: 0.3) ?? theme.colorScheme.surface.withValues(alpha: 0.3),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: theme.colorScheme.outline.withValues(alpha: 0.5),
          width: 1.5,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: theme.colorScheme.primary,
          width: 2.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: theme.colorScheme.error,
          width: 1.5,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: theme.colorScheme.error,
          width: 2.0,
        ),
      ),
      errorStyle: GoogleFonts.inter(
        fontSize: 12,
        color: theme.colorScheme.error,
      ),
    );
  }

  Widget _inputLabel(String label) {
    final theme = Theme.of(context);
    return Text(
      label,
      style: GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.8) ?? const Color(0xFF475569),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bottomPad = MediaQuery.of(context).viewInsets.bottom;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: theme.appBarTheme.backgroundColor ?? theme.primaryColor,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Text(
            'Security Update',
            style: GoogleFonts.outfit(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: theme.appBarTheme.titleTextStyle?.color ?? Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(24, 24, 24, bottomPad + 16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(24),
                        Center(
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primary.withValues(alpha: 0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: HugeIcon(
                                icon: HugeIcons.strokeRoundedLockPassword,
                                color: theme.colorScheme.primary,
                                size: 36,
                              ),
                            ),
                          ),
                        ),
                        const Gap(24),
                        Center(
                          child: Text(
                            'Set New Safety PIN',
                            style: GoogleFonts.outfit(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: theme.textTheme.bodyLarge?.color ?? AppTheme.textPrimary,
                            ),
                          ),
                        ),
                        const Gap(8),
                        Center(
                          child: Text(
                            'Please configure your permanent 6-digit Safety PIN for secure access.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.6) ?? AppTheme.textSecondary,
                              height: 1.5,
                            ),
                          ),
                        ),
                        const Gap(32),
                        _inputLabel('New Safety PIN (6 digits)'),
                        const Gap(8),
                        TextFormField(
                          controller: _newPinCtrl,
                          obscureText: _obscureNew,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(6),
                          ],
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: theme.textTheme.bodyLarge?.color,
                          ),
                          decoration: _inputDecoration(
                            hint: 'Enter 6-digit PIN',
                            prefixIcon: HugeIcons.strokeRoundedLockPassword,
                            suffix: IconButton(
                              icon: HugeIcon(
                                icon: _obscureNew ? HugeIcons.strokeRoundedView : HugeIcons.strokeRoundedViewOffSlash,
                                size: 20,
                                color: theme.iconTheme.color?.withValues(alpha: 0.5) ?? const Color(0xFF94A3B8),
                              ),
                              onPressed: () => setState(() => _obscureNew = !_obscureNew),
                            ),
                          ),
                          validator: (v) => (v == null || v.length != 6) ? 'Safety PIN must be exactly 6 digits' : null,
                        ),
                        const Gap(20),
                        _inputLabel('Confirm Safety PIN'),
                        const Gap(8),
                        TextFormField(
                          controller: _confirmPinCtrl,
                          obscureText: _obscureConfirm,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(6),
                          ],
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: theme.textTheme.bodyLarge?.color,
                          ),
                          decoration: _inputDecoration(
                            hint: 'Confirm 6-digit PIN',
                            prefixIcon: HugeIcons.strokeRoundedLockPassword,
                            suffix: IconButton(
                              icon: HugeIcon(
                                icon: _obscureConfirm ? HugeIcons.strokeRoundedView : HugeIcons.strokeRoundedViewOffSlash,
                                size: 20,
                                color: theme.iconTheme.color?.withValues(alpha: 0.5) ?? const Color(0xFF94A3B8),
                              ),
                              onPressed: () => setState(() => _obscureConfirm = !_obscureConfirm),
                            ),
                          ),
                          validator: (v) {
                            if (v == null || v.length != 6) {
                              return 'Safety PIN must be exactly 6 digits';
                            }
                            if (v != _newPinCtrl.text) {
                              return 'PINs do not match';
                            }
                            return null;
                          },
                        ),
                        const Gap(40),
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: FilledButton(
                            onPressed: _saving ? null : _submit,
                            style: FilledButton.styleFrom(
                              backgroundColor: theme.colorScheme.primary,
                              disabledBackgroundColor: theme.colorScheme.primary.withValues(alpha: 0.2),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                              elevation: 0,
                            ),
                            child: _saving
                                ? const SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2.5,
                                    ),
                                  )
                                : Text(
                                    'Save & Continue',
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
}
}

