import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/common/country_selector.dart';
import '../../theme/app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();
  
  Country _selectedCountry = countries.first;
  
  // Real-time validation state
  bool? _isAvailable; // null = initial, true = success, false = error
  String? _foundName;
  bool _isChecking = false;
  Timer? _debounce;
  final FocusNode _phoneFocusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(_onPhoneChanged);
    _phoneFocusNode.addListener(() {
      setState(() {
        _isFocused = _phoneFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _phoneFocusNode.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onPhoneChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    
    String val = _phoneController.text.trim();
    // Normalize: Handle leading '0'
    if (val.startsWith('0')) {
      val = val.substring(1);
    }

    if (val.length < 9) {
      if (_isAvailable != null || _isChecking) {
        setState(() {
          _isAvailable = null;
          _foundName = null;
          _isChecking = false;
        });
      }
      return;
    }

    setState(() {
      _isChecking = true;
      _isAvailable = null;
      _foundName = null;
    });
    _debounce = Timer(const Duration(milliseconds: 600), () async {
      final auth = context.read<AuthProvider>();
      // Use the normalized 9-digit sequence
      final normalizedVal = val.length > 9 ? val.substring(0, 9) : val;
      final result = await auth.checkPhoneNumberAvailability('${_selectedCountry.dialCode}$normalizedVal');
      if (mounted) {
        setState(() {
          _isAvailable = result?['available'] as bool? ?? false;
          _foundName = result?['name'] as String?;
          _isChecking = false;
        });
      }
    });
  }

  Future<void> _handleNext() async {
    if (_isAvailable != true) return;

    // Phone Flow
    String val = _phoneController.text.trim();
    if (val.startsWith('0')) val = val.substring(1);
    
    if (val.length < 9) return;
    
    final fullPhone = '${_selectedCountry.dialCode}$val';
    
    // Unfocus keyboard
    FocusScope.of(context).unfocus();
    
    context.push('/verify', extra: fullPhone);
  }

  void _showHelpModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Staff Login Help',
                  style: GoogleFonts.outfit(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF0F172A),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close_rounded, color: Color(0xFF64748B)),
                ),
              ],
            ),
            const Gap(8),
            Text(
              'Follow these instructions for a smooth login experience.',
              style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 14),
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
                    'Account Recovery',
                    'If you forgotten your access credentials, please contact your administrative supervisor for a reset.',
                    HugeIcons.strokeRoundedShield01,
                  ),
                  _helpItem(
                    'OTP Not Received?',
                    'Ensure your network signal is strong. If issues persist, your admin can trigger a manual OTP reset for your account.',
                    HugeIcons.strokeRoundedMessageNotification01,
                  ),
                ],
              ),
            ),
            const Gap(16),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3B82F6),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 0,
                ),
                child: Text(
                  'Got it, Close Help',
                  style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.white),
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
              color: const Color(0xFF3B82F6).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: HugeIcon(icon: icon, color: const Color(0xFF3B82F6), size: 22),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w700, color: const Color(0xFF0F172A)),
                ),
                const Gap(4),
                Text(
                  desc,
                  style: GoogleFonts.inter(fontSize: 14, color: const Color(0xFF64748B), height: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showCountryPicker() async {
    final result = await showModalBottomSheet<Country>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const CountryPickerSheet(),
    );
    if (result != null) {
      setState(() {
        _selectedCountry = result;
        _phoneController.clear();
        _isAvailable = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    final theme = Theme.of(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
            child: Column(
              children: [
                // ── Header Area ──────────────────────────────────────────────────
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: HugeIcon(
                          icon: HugeIcons.strokeRoundedArrowLeft01, 
                          color: theme.iconTheme.color ?? AppTheme.textPrimary,
                          size: 28,
                        ),
                        onPressed: () => context.pop(),
                      ),
                      IconButton(
                        icon: HugeIcon(
                          icon: HugeIcons.strokeRoundedInformationCircle,
                          color: theme.iconTheme.color ?? AppTheme.textPrimary, 
                          size: 28,
                        ),
                        onPressed: _showHelpModal,
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Gap(24),

                        // ── Big Emoji / Status Indicator ──
                        Center(
                          child: _isChecking
                            ? const SizedBox(
                                width: 80,
                                height: 80,
                                child: CircularProgressIndicator(strokeWidth: 4, color: Color(0xFF3B82F6)),
                              )
                            : AnimatedSwitcher(
                                duration: const Duration(milliseconds: 300),
                                child: Text(
                                  _isAvailable == null ? '🤩' : (_isAvailable! ? '😊' : '😕'),
                                  key: ValueKey(_isAvailable),
                                  style: const TextStyle(fontSize: 80),
                                ),
                              ),
                        ),

                        const Gap(24),
                        
                        // Centered Title & Dynamic Greeting
                        Column(
                          children: [
                            Text(
                              'Staff Login',
                              style: GoogleFonts.outfit(
                                fontSize: 28,
                                fontWeight: FontWeight.w800,
                                color: theme.textTheme.bodyLarge?.color ?? AppTheme.textPrimary,
                                letterSpacing: -0.5,
                              ),
                            ),
                            const Gap(8),
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              child: Text(
                                _isAvailable == null 
                                  ? 'Welcome back, sign in to continue' 
                                  : (_isAvailable! ? 'Account confirmed! Welcome back, ${_foundName ?? "Team"}! 👋' : 'Account not found, please check number'),
                                key: ValueKey(_isAvailable),
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: _isAvailable == false 
                                      ? Colors.redAccent 
                                      : (theme.textTheme.bodyMedium?.color ?? AppTheme.textSecondary),
                                  fontWeight: _isAvailable == true ? FontWeight.w600 : FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const Gap(40),

                        // Form Content
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _inputLabel('Phone Number'),
                            const Gap(8),
                            _phoneInputField(auth),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),

                // Bottom CTA & Security Text
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 58,
                        child: AnimatedBuilder(
                          animation: _phoneController,
                          builder: (context, _) {
                            final phoneVal = _phoneController.text.trim();
                            final normalizedPhone = phoneVal.startsWith('0') ? phoneVal.substring(1) : phoneVal;
                            final bool isValid = normalizedPhone.length == 9;

                            return FilledButton(
                              onPressed: (auth.loading || !isValid || _isAvailable != true) ? null : _handleNext,
                              style: FilledButton.styleFrom(
                                backgroundColor: theme.colorScheme.primary,
                                disabledBackgroundColor: theme.colorScheme.primary.withValues(alpha: 0.2),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                elevation: 0,
                              ),
                              child: auth.loading
                                ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5))
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Continue',
                                        style: TextStyle(
                                          fontSize: 16, 
                                          fontWeight: FontWeight.bold,
                                          color: (auth.loading || !isValid || _isAvailable != true) ? Colors.white54 : Colors.white,
                                        ),
                                      ),
                                      const Gap(8),
                                      HugeIcon(
                                        icon: HugeIcons.strokeRoundedArrowRight01, 
                                        color: (auth.loading || !isValid || _isAvailable != true) ? Colors.white54 : Colors.white, 
                                        size: 20
                                      ),
                                    ],
                                  ),
                            );
                          }
                        ),
                      ),
                      const Gap(16),
                      Center(
                        child: Text(
                          'Secured by MiziGO Guard 🛡️',
                          style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF94A3B8), letterSpacing: 0.5),
                        ),
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

  Widget _phoneInputField(AuthProvider auth) {
    final theme = Theme.of(context);
    Color borderColor = theme.colorScheme.outline.withValues(alpha: 0.5);
    if (_isAvailable == false) {
      borderColor = Colors.redAccent.withValues(alpha: 0.5);
    } else if (_isAvailable == true) {
      borderColor = const Color(0xFF10B981).withValues(alpha: 0.5);
    } else if (_isFocused) {
      borderColor = theme.colorScheme.primary;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: theme.cardTheme.color ?? theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: borderColor,
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
              if (_isAvailable == true)
                BoxShadow(
                  color: const Color(0xFF10B981).withValues(alpha: 0.05),
                  blurRadius: 10,
                  spreadRadius: 1,
                )
              else if (_isFocused)
                BoxShadow(
                  color: theme.colorScheme.primary.withValues(alpha: 0.05),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
            ],
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: _showCountryPicker,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border(right: BorderSide(color: theme.colorScheme.outline.withValues(alpha: 0.5), width: 1.5)),
                  ),
                  child: Row(
                    children: [
                      Text(_selectedCountry.flag, style: const TextStyle(fontSize: 20)),
                      const Gap(8),
                      Text(
                        _selectedCountry.dialCode,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700, 
                          color: theme.textTheme.bodyLarge?.color ?? AppTheme.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _phoneController,
                  focusNode: _phoneFocusNode,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(9),
                  ],
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: theme.textTheme.bodyLarge?.color ?? AppTheme.textPrimary, 
                    letterSpacing: 1,
                  ),
                  cursorColor: theme.colorScheme.primary,
                  decoration: InputDecoration(
                    hintText: '712 345 678',
                    hintStyle: TextStyle(
                      color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.5) ?? AppTheme.textMuted,
                    ),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}