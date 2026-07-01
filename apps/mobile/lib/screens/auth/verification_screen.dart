import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/profile/premium_settings_components.dart';
import '../../theme/app_theme.dart';

class VerificationScreen extends StatefulWidget {
  final String phoneNumber;

  const VerificationScreen({super.key, required this.phoneNumber});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController _pinController = TextEditingController();
  final FocusNode _pinFocusNode = FocusNode();
  
  // ── Resend countdown ──────────────────────────────────────────────────────
  static const _countdownSeconds = 60;
  int _secondsLeft = _countdownSeconds;
  Timer? _timer;

  // ── Temporarily visible digit state ──────────────────────────────────────
  int? _visibleIndex;
  Timer? _obscureTimer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
    
    _pinController.addListener(_onPinChanged);
    
    // Auto-focus the field
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pinFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _obscureTimer?.cancel();
    _pinController.dispose();
    _pinFocusNode.dispose();
    super.dispose();
  }

  void _onPinChanged() {
    final text = _pinController.text;
    if (text.isNotEmpty) {
      final newIndex = text.length - 1;
      _obscureTimer?.cancel();
      setState(() {
        _visibleIndex = newIndex;
      });
      _obscureTimer = Timer(const Duration(seconds: 1), () {
        if (mounted) {
          setState(() {
            _visibleIndex = null;
          });
        }
      });
    } else {
      _obscureTimer?.cancel();
      setState(() {
        _visibleIndex = null;
      });
    }
  }

  void _startCountdown() {
    _timer?.cancel();
    setState(() => _secondsLeft = _countdownSeconds);
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
    if (_secondsLeft > 0) return;
    
    final auth = context.read<AuthProvider>();
    final ok = await auth.sendOtp(widget.phoneNumber);
    
    if (!mounted) return;
    
    if (ok) {
      _pinController.clear();
      _pinFocusNode.requestFocus();
      _startCountdown();
      MizigoToasts.showSuccess(
        context,
        'Verification code resent to ${widget.phoneNumber}',
      );
    } else {
      MizigoToasts.showError(
        context,
        auth.error ?? 'Failed to resend code',
      );
    }
  }

  void _verify() async {
    final auth = context.read<AuthProvider>();
    if (_pinController.text.length == 6 && !auth.loading) {
      _pinFocusNode.unfocus();
      
      final ok = await auth.verifyOtp(widget.phoneNumber, _pinController.text);
      
      if (mounted) {
        if (ok) {
          // Success! Go to Home
          context.go('/home');
        } else {
          MizigoToasts.showError(
            context,
            auth.error ?? 'Verification failed',
          );
          _pinController.clear();
          _pinFocusNode.requestFocus();
        }
      }
    }
  }

  String get _countdownLabel {
    if (_secondsLeft <= 0) return '';
    final m = _secondsLeft ~/ 60;
    final s = _secondsLeft % 60;
    return m > 0
        ? '$m:${s.toString().padLeft(2, '0')}'
        : '0:${s.toString().padLeft(2, '0')}';
  }

  void _showHelpModal() {
    final theme = Theme.of(context);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          color: theme.cardTheme.color ?? theme.colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          border: Border.all(
            color: theme.colorScheme.outline.withValues(alpha: 0.2),
          ),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Verification Help',
                  style: GoogleFonts.outfit(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: theme.textTheme.titleLarge?.color ?? AppTheme.textPrimary,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close_rounded, color: theme.textTheme.bodySmall?.color ?? AppTheme.textSecondary),
                ),
              ],
            ),
            const Gap(8),
            Text(
              'Follow these instructions for a smooth verification experience.',
              style: GoogleFonts.inter(
                color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.6) ?? AppTheme.textSecondary,
                fontSize: 14,
              ),
            ),
            const Gap(24),
            Expanded(
              child: ListView(
                children: [
                  _helpItem(
                    'Verification',
                    'OTP is a One-Time Password sent to your phone to verify your identity. Check your messages and enter the 6-digit code.',
                    HugeIcons.strokeRoundedMessageNotification01,
                  ),
                  _helpItem(
                    'How to reset?',
                    'Wait for the timer to count down, then click "Forgot OTP? Reset" to receive a new code.',
                    HugeIcons.strokeRoundedTime02,
                  ),
                  _helpItem(
                    'Reset Policy',
                    'You can request a new OTP up to 3 times per day for security reasons.',
                    HugeIcons.strokeRoundedShield01,
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
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 0,
                ),
                child: Text(
                  'Close Help',
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
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: HugeIcon(icon: icon, color: theme.colorScheme.primary, size: 22),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: theme.textTheme.titleMedium?.color ?? AppTheme.textPrimary,
                  ),
                ),
                const Gap(4),
                Text(
                  desc,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.7) ?? AppTheme.textSecondary,
                    height: 1.5,
                  ),
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
    final theme = Theme.of(context);
    final auth = context.watch<AuthProvider>();
    final canResend = _secondsLeft == 0;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.appBarTheme.backgroundColor ?? theme.primaryColor,
          elevation: 0,
          leading: IconButton(
                onPressed: () => context.pop(),
                icon: HugeIcon(
                  icon: HugeIcons.strokeRoundedArrowLeft01,
                  color: theme.appBarTheme.iconTheme?.color ?? Colors.white,
                  size: 24,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: _showHelpModal,
                  icon: HugeIcon(
                    icon: HugeIcons.strokeRoundedHelpCircle,
                    color: theme.appBarTheme.actionsIconTheme?.color ?? theme.appBarTheme.iconTheme?.color ?? Colors.white,
                    size: 24,
                  ),
                ),
                const Gap(8),
              ],
            ),
            body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        const Gap(40),
                        Text(
                          'Verification Process 🔐',
                          style: GoogleFonts.outfit(
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            color: theme.textTheme.bodyLarge?.color ?? AppTheme.textPrimary,
                          ),
                        ),
                        const Gap(12),
                        Text(
                          'Please Enter your OTP to continue',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.7) ?? AppTheme.textSecondary,
                            height: 1.5,
                          ),
                        ),

                        const Gap(48),

                        // PIN Input 6 boxes
                        GestureDetector(
                          onTap: () => _pinFocusNode.requestFocus(),
                          child: Stack(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(6, (index) {
                                  final hasDigit = _pinController.text.length > index;
                                  String digit = '';
                                  if (hasDigit) {
                                    if (index == _visibleIndex) {
                                      digit = _pinController.text[index];
                                    } else {
                                      digit = '•';
                                    }
                                  }
                                  final isFocused = _pinFocusNode.hasFocus && _pinController.text.length == index;
                                  
                                  return Container(
                                    width: 45,
                                    height: 56,
                                    margin: const EdgeInsets.symmetric(horizontal: 4),
                                    decoration: BoxDecoration(
                                      color: isFocused 
                                          ? theme.colorScheme.primary.withValues(alpha: 0.1)
                                          : (theme.cardTheme.color ?? theme.colorScheme.surface).withValues(alpha: 0.5),
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                        color: isFocused ? theme.colorScheme.primary : theme.colorScheme.outline.withValues(alpha: 0.5),
                                        width: isFocused ? 2.0 : 1.5,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        digit,
                                        style: GoogleFonts.inter(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: theme.textTheme.bodyLarge?.color ?? AppTheme.textPrimary,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                              Positioned.fill(
                                child: Opacity(
                                  opacity: 0,
                                  child: TextField(
                                    controller: _pinController,
                                    focusNode: _pinFocusNode,
                                    keyboardType: TextInputType.number,
                                    maxLength: 6,
                                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                    decoration: const InputDecoration(counterText: ''),
                                    onChanged: (_) => setState(() {}),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const Gap(40),
                      ],
                    ),
                  ),
                ),
                
                // Bottom CTA
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 58,
                        child: AnimatedBuilder(
                          animation: _pinController,
                          builder: (context, _) {
                            final isValid = _pinController.text.length == 6;

                            return FilledButton(
                              onPressed: (auth.loading || !isValid) ? null : _verify,
                              style: FilledButton.styleFrom(
                                backgroundColor: theme.colorScheme.primary,
                                disabledBackgroundColor: theme.colorScheme.primary.withValues(alpha: 0.2),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                                elevation: 0,
                              ),
                              child: auth.loading
                                ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5))
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Verify Account',
                                        style: TextStyle(
                                          fontSize: 16, 
                                          fontWeight: FontWeight.bold,
                                          color: (auth.loading || !isValid) ? Colors.white54 : Colors.white,
                                        ),
                                      ),
                                      const Gap(8),
                                      HugeIcon(
                                        icon: HugeIcons.strokeRoundedLockPassword, 
                                        color: (auth.loading || !isValid) ? Colors.white54 : Colors.white, 
                                        size: 20
                                      ),
                                    ],
                                  ),
                            );
                          }
                        ),
                      ),

                      const Gap(32),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Forgot OTP? ",
                            style: GoogleFonts.inter(
                              color: theme.textTheme.bodySmall?.color ?? AppTheme.textMuted,
                            ),
                          ),
                          if (canResend)
                            GestureDetector(
                              onTap: _resend,
                              child: Text(
                                'Reset',
                                style: GoogleFonts.inter(
                                  color: theme.colorScheme.secondary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          else
                            Text(
                              'Reset in $_countdownLabel',
                              style: GoogleFonts.inter(
                                color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.6) ?? AppTheme.textSecondary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                        ],
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

// ── Blinking cursor widget ────────────────────────────────────────────────────

class _BlinkingCursor extends StatefulWidget {
  final Color cursorColor;
  const _BlinkingCursor({required this.cursorColor});

  @override
  State<_BlinkingCursor> createState() => _BlinkingCursorState();
}

class _BlinkingCursorState extends State<_BlinkingCursor>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: Container(
        width: 2.5,
        height: 22,
        decoration: BoxDecoration(
          color: widget.cursorColor,
          borderRadius: BorderRadius.circular(1.5),
        ),
      ),
    );
  }
}