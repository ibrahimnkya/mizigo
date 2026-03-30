import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import '../../providers/auth_provider.dart';
import '../../theme/app_theme.dart';

// ─── Password rule model ──────────────────────────────────────────────────────

class _PasswordRule {
  final String label;
  final bool Function(String) check;
  const _PasswordRule({required this.label, required this.check});
}

final _passwordRules = [
  _PasswordRule(
    label: 'At least 8 characters',
    check: (v) => v.length >= 8,
  ),
  _PasswordRule(
    label: 'One uppercase letter (A–Z)',
    check: (v) => v.contains(RegExp(r'[A-Z]')),
  ),
  _PasswordRule(
    label: 'One number (0–9)',
    check: (v) => v.contains(RegExp(r'[0-9]')),
  ),
  _PasswordRule(
    label: 'One special character (!@#\$...)',
    check: (v) => v.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>_\-+=\[\]\\\/]')),
  ),
];

// ─── Profile Setup Screen ─────────────────────────────────────────────────────

class ProfileSetupScreen extends StatefulWidget {
  final String? email;
  final String? phone;

  const ProfileSetupScreen({
    super.key,
    this.email,
    this.phone,
  });

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _passwordTouched = false;
  File? _avatarFile;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      if (!_passwordTouched && _passwordController.text.isNotEmpty) {
        setState(() => _passwordTouched = true);
      } else {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // ── Image picker ────────────────────────────────────────────────────────────

  Future<void> _pickImage(ImageSource source) async {
    Navigator.of(context).pop(); // close sheet
    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: source,
      imageQuality: 85,
      maxWidth: 800,
    );
    if (picked != null && mounted) {
      setState(() => _avatarFile = File(picked.path));
    }
  }

  void _showImagePickerSheet() {
    final theme = Theme.of(context);
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.fromLTRB(0, 12, 0, 36),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // drag handle
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFE2E8F0),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const Gap(8),

            // Camera option
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
              leading: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.camera_alt_outlined,
                  color: Color(0xFF3B82F6),
                  size: 22,
                ),
              ),
              title: Text(
                'Camera',
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: theme.textTheme.bodyLarge?.color,
                ),
              ),
              onTap: () => _pickImage(ImageSource.camera),
            ),

            // Gallery option
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
              leading: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFFECFDF5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.photo_outlined,
                  color: Color(0xFF10B981),
                  size: 22,
                ),
              ),
              title: Text(
                'Gallery',
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: theme.textTheme.bodyLarge?.color,
                ),
              ),
              onTap: () => _pickImage(ImageSource.gallery),
            ),
          ],
        ),
      ),
    );
  }

  // ── Password helpers ────────────────────────────────────────────────────────

  bool get _passwordAllValid =>
      _passwordRules.every((r) => r.check(_passwordController.text));

  // ── Registration ────────────────────────────────────────────────────────────

  Future<void> _completeRegistration() async {
    if (!_formKey.currentState!.validate()) return;
    if (!_passwordAllValid) {
      setState(() => _passwordTouched = true);
      return;
    }

    final auth = context.read<AuthProvider>();
    final fullName =
        '${_firstNameController.text.trim()} ${_lastNameController.text.trim()}';

    final success = await auth.register(
      name: fullName,
      email: widget.email ?? '${widget.phone}@mizigo.com',
      password: _passwordController.text,
      phone: widget.phone,
    );

    if (success && mounted) {
      // Persist locally-picked avatar (no backend upload yet)
      if (_avatarFile != null) {
        await auth.saveAvatarPath(_avatarFile!.path);
      }
      if (mounted) {
        context.go('/home');
      }
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(auth.error ?? 'Registration failed'),
          backgroundColor: AppTheme.danger,
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );
    }
  }

  // ── Shared InputDecoration ──────────────────────────────────────────────────

  InputDecoration _inputDecoration({
    required String hint,
    required IconData prefixIcon,
    Widget? suffix,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: GoogleFonts.inter(
        color: Colors.white.withValues(alpha: 0.3),
        fontSize: 15,
      ),
      prefixIcon: Icon(prefixIcon, size: 20),
      prefixIconColor: const Color(0xFF94A3B8),
      suffixIcon: suffix,
      filled: true,
      fillColor: Colors.transparent,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.3), width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF3B82F6), width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFEF4444), width: 1.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFEF4444), width: 1.5),
      ),
      errorStyle: GoogleFonts.inter(fontSize: 12, color: const Color(0xFFEF4444)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final auth = context.watch<AuthProvider>();
    // final mq = MediaQuery.of(context);
    // final isKeyboardOpen = mq.viewInsets.bottom > 0;
    final password = _passwordController.text;

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.close_rounded, color: Colors.white, size: 24),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Complete your profile',
          style: GoogleFonts.outfit(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: PopScope(
        canPop: true,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
        },
        child: SafeArea(
          child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Gap(8),

                          // ── Heading ───────────────────────────────
                          Center(
                            child: Text(
                              'Complete your profile',
                              style: GoogleFonts.outfit(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Gap(8),
                          Center(
                            child: Text(
                              "Let's personalize your account and keep it secure.",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: const Color(0xFF94A3B8),
                                height: 1.4,
                              ),
                            ),
                          ),

                          const Gap(28),

                          // ── Avatar picker ──────────────────────────
                          Center(
                            child: GestureDetector(
                              onTap: _showImagePickerSheet,
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: const Color(0xFF3B82F6).withValues(alpha: 0.1),
                                      border: Border.all(
                                        color: const Color(0xFF3B82F6).withValues(alpha: 0.2),
                                        width: 2,
                                      ),
                                      image: _avatarFile != null
                                          ? DecorationImage(
                                              image: FileImage(_avatarFile!),
                                              fit: BoxFit.cover,
                                            )
                                          : null,
                                    ),
                                    child: _avatarFile == null
                                        ? const Icon(
                                            Icons.person_rounded,
                                            size: 50,
                                            color: Colors.white,
                                          )
                                        : null,
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 4,
                                    child: Container(
                                      width: 32,
                                      height: 32,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF3B82F6),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: const Color(0xFF0F172A), width: 3),
                                      ),
                                      child: const Icon(
                                        Icons.add_rounded,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const Gap(36),

                          // ── First Name ─────────────────────────────
                          TextFormField(
                            controller: _firstNameController,
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                            decoration: _inputDecoration(
                              hint: 'First Name',
                              prefixIcon: Icons.person_outline_rounded,
                            ),
                            validator: (v) =>
                                (v == null || v.trim().isEmpty)
                                    ? 'Enter your first name'
                                    : null,
                          ),

                          const Gap(16),

                          // ── Last Name ──────────────────────────────
                          TextFormField(
                            controller: _lastNameController,
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                            decoration: _inputDecoration(
                              hint: 'Last Name',
                              prefixIcon: Icons.person_outline_rounded,
                            ),
                            validator: (v) =>
                                (v == null || v.trim().isEmpty)
                                    ? 'Enter your last name'
                                    : null,
                          ),

                          const Gap(16),

                          // ── Password ───────────────────────────────
                          TextFormField(
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                            decoration: _inputDecoration(
                              hint: 'Password',
                              prefixIcon: Icons.lock_outline_rounded,
                              suffix: IconButton(
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  size: 20,
                                ),
                                color: const Color(0xFF94A3B8),
                                onPressed: () => setState(
                                    () => _obscurePassword =
                                        !_obscurePassword),
                                splashRadius: 20,
                              ),
                            ),
                            validator: (v) => !_passwordAllValid
                                ? 'Password does not meet requirements'
                                : null,
                          ),

                          // ── Password rules ─────────────────────────
                          if (_passwordTouched) ...[
                            const Gap(10),
                            _PasswordRulesWidget(
                              password: password,
                              rules: _passwordRules,
                            ),
                          ],

                          const Spacer(),
                          const Gap(32),

                          // ── CTA ────────────────────────────────────
                          SizedBox(
                            height: 56,
                            child: FilledButton(
                              onPressed: auth.loading
                                  ? null
                                  : _completeRegistration,
                              style: FilledButton.styleFrom(
                                backgroundColor: const Color(0xFF3B82F6),
                                disabledBackgroundColor:
                                    const Color(0xFFE2E8F0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                elevation: 0,
                                shadowColor: Colors.transparent,
                              ).copyWith(
                                overlayColor:
                                    WidgetStateProperty.resolveWith(
                                  (states) =>
                                      states.contains(WidgetState.pressed)
                                          ? Colors.white.withValues(alpha: 0.1)
                                          : null,
                                ),
                              ),
                              child: auth.loading
                                  ? const SizedBox.square(
                                      dimension: 22,
                                      child: CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 2.5),
                                    )
                                  : Text(
                                      'Create Profile',
                                      style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
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
              ),
            );
          },
        ),
      ),
    ),
  );
}

  Widget _label(String text) {
    final theme = Theme.of(context);
    return Text(
      text,
      style: GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: theme.textTheme.bodySmall?.color ?? const Color(0xFF475569),
        letterSpacing: 0.2,
      ),
    );
  }
}

// ─── Password Rules Widget ────────────────────────────────────────────────────

class _PasswordRulesWidget extends StatelessWidget {
  final String password;
  final List<_PasswordRule> rules;

  const _PasswordRulesWidget({
    required this.password,
    required this.rules,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: rules.map((rule) {
          final passed = rule.check(password);
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: passed
                        ? const Color(0xFF10B981)
                        : const Color(0xFF334155),
                  ),
                  child: Icon(
                    passed ? Icons.check_rounded : Icons.remove_rounded,
                    size: 11,
                    color: passed ? Colors.white : const Color(0xFF94A3B8),
                  ),
                ),
                const Gap(8),
                Text(
                  rule.label,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: passed
                        ? const Color(0xFF10B981)
                        : const Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}