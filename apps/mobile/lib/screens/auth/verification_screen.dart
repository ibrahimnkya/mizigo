import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import '../../theme/app_theme.dart';
import '../../providers/auth_provider.dart';

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

  @override
  void initState() {
    super.initState();
    _startCountdown();
    
    // Listen for PIN completion (6 digits)
    _pinController.addListener(() {
      if (_pinController.text.length == 6) {
        _verify();
      }
    });
    
    // Auto-focus the field
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pinFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pinController.dispose();
    _pinFocusNode.dispose();
    super.dispose();
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Verification code resent to ${widget.phoneNumber}'),
          backgroundColor: const Color(0xFF3B82F6),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(auth.error ?? 'Failed to resend code'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  Future<void> _forgotOtp() async {
    final auth = context.read<AuthProvider>();
    // Re-triggering sendOtp is effectively "Forgot OTP" as it triggers a new SMS
    final ok = await auth.sendOtp(widget.phoneNumber);
    
    if (!mounted) return;
    if (ok) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('A new OTP has been triggered via SMS.')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(auth.error ?? 'Failed to trigger new OTP')),
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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(auth.error ?? 'Verification failed'),
              backgroundColor: Colors.redAccent,
            ),
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
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: const BoxDecoration(
          color: Color(0xFF0F172A),
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
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
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close_rounded, color: Colors.white54),
                ),
              ],
            ),
            const Gap(8),
            Text(
              'Follow these instructions for a smooth verification experience.',
              style: GoogleFonts.inter(color: Colors.white38, fontSize: 14),
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
                onPressed: () {}, // Link to support page
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3B82F6),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 0,
                ),
                child: Text(
                  'Visit Support Page',
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
              color: Colors.white.withValues(alpha: 0.05),
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
                  style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
                ),
                const Gap(4),
                Text(
                  desc,
                  style: GoogleFonts.inter(fontSize: 14, color: Colors.white38, height: 1.5),
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
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: const Color(0xFF0F172A),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: _showHelpModal,
            icon: const HugeIcon(icon: HugeIcons.strokeRoundedHelpCircle, color: Colors.white54, size: 24),
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
                      style: GoogleFonts.outfit(fontSize: 28, fontWeight: FontWeight.w800, color: Colors.white),
                    ),
                    const Gap(12),
                    Text(
                      'Please Enter your OTP to continue',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(fontSize: 15, color: Colors.white60, height: 1.5),
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
                              final digit = hasDigit ? _pinController.text[index] : '';
                              final isFocused = _pinFocusNode.hasFocus && _pinController.text.length == index;
                              
                              return Container(
                                width: 45,
                                height: 56,
                                margin: const EdgeInsets.symmetric(horizontal: 4),
                                decoration: BoxDecoration(
                                  color: theme.cardColor.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: theme.dividerColor,
                                    width: 1,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    digit,
                                    style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
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

                    if (auth.error != null) ...[
                      const Gap(32),
                      Text(
                        auth.error!,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          color: Colors.redAccent,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Gap(8),
                    ] else ...[
                      const Gap(40),
                    ],
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
                              backgroundColor: AppTheme.cPrimary,
                              disabledBackgroundColor: AppTheme.cPrimary.withValues(alpha: 0.2),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
                      Text("Forgot OTP? ", style: GoogleFonts.inter(color: Colors.white38)),
                      if (canResend)
                        GestureDetector(
                          onTap: _resend,
                          child: Text('Reset', style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold)),
                        )
                      else
                        Text(
                          'Reset in $_countdownLabel',
                          style: GoogleFonts.inter(color: Colors.white70, fontWeight: FontWeight.w600),
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