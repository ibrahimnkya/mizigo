import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import '../../theme/app_theme.dart';

class DeliverySpeedScreen extends StatefulWidget {
  const DeliverySpeedScreen({super.key});

  @override
  State<DeliverySpeedScreen> createState() => _DeliverySpeedScreenState();
}

class _DeliverySpeedScreenState extends State<DeliverySpeedScreen> {
  String _selectedSpeed = '';
  bool _lastMileDelivery = false;

  final List<_SpeedOption> _speeds = [
    _SpeedOption(
      id: 'economy',
      label: 'Economy',
      subtitle: 'Affordable & slower',
      icon: HugeIcons.strokeRoundedLeaf02,
      iconColor: const Color(0xFFADCC3D),
      iconBackground: Colors.white.withValues(alpha: 0.05),
    ),
    _SpeedOption(
      id: 'standard',
      label: 'Standard',
      subtitle: 'Balanced speed & cost',
      icon: HugeIcons.strokeRoundedFlash,
      iconColor: const Color(0xFFFACC15),
      iconBackground: Colors.white.withValues(alpha: 0.05),
    ),
    _SpeedOption(
      id: 'express',
      label: 'Express',
      subtitle: 'Fastest delivery',
      icon: HugeIcons.strokeRoundedFire,
      iconColor: const Color(0xFFF87171),
      iconBackground: Colors.white.withValues(alpha: 0.05),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appBarTheme = theme.appBarTheme;
    final appBarBgColor = appBarTheme.backgroundColor ?? theme.primaryColor;
    final appBarTextColor = appBarTheme.titleTextStyle?.color ?? Colors.white;
    final appBarIconColor = appBarTheme.iconTheme?.color ?? Colors.white;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              // ─── Header ────────────────────────────────────────────────
              Container(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
                color: appBarBgColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Send Package',
                      style: GoogleFonts.outfit(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: appBarTextColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => context.pop(),
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.05),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.close, color: appBarIconColor, size: 20),
                      ),
                    ),
                  ],
                ),
              ),

              // ─── Body ──────────────────────────────────────────────────
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'How would you like to send this package?',
                        style: GoogleFonts.outfit(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.textPrimary,
                          height: 1.3,
                        ),
                      ),
                      const Gap(6),
                      Text(
                        'Choose a delivery speed that fits your needs.',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                      const Gap(28),

                      // ─── Speed Options ────────────────────────────────
                      ..._speeds.map((speed) => _SpeedOptionCard(
                            option: speed,
                            isSelected: _selectedSpeed == speed.id,
                            onTap: () => setState(() => _selectedSpeed = speed.id),
                          )),

                      const Gap(36),

                      // ─── Last Mile Delivery ───────────────────────────
                      Text(
                        'Do you need Last Mile Delivery?',
                        style: GoogleFonts.outfit(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                      const Gap(6),
                      Text(
                        'Delivery from SGR station to recipient\'s door.',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                      const Gap(20),

                      GestureDetector(
                        onTap: () => setState(() => _lastMileDelivery = !_lastMileDelivery),
                        child: Row(
                          children: [
                            // Custom checkbox
                            Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                color: _lastMileDelivery
                                    ? const Color(0xFF3B82F6)
                                    : Colors.transparent,
                                border: Border.all(
                                  color: _lastMileDelivery
                                      ? const Color(0xFF3B82F6)
                                      : AppTheme.border,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: _lastMileDelivery
                                  ? const Icon(Icons.check, color: Colors.white, size: 14)
                                  : null,
                            ),
                            const Gap(12),
                            Text(
                              'Yes, deliver door-to-door',
                              style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: AppTheme.textPrimary,
                              ),
                            ),
                            const Gap(12),
                            GestureDetector(
                              onTap: () {
                                // TODO: show how it works dialog
                              },
                              child: Text(
                                'HOW IT WORKS',
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF3B82F6),
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ─── Continue Button ────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _selectedSpeed.isEmpty
                        ? null
                        : () {
                            context.push('/send-package/vehicle', extra: {
                              'deliverySpeed': _selectedSpeed,
                              'lastMileDelivery': _lastMileDelivery,
                            });
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3B82F6),
                      disabledBackgroundColor: AppTheme.border,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: const StadiumBorder(),
                      elevation: 0,
                    ),
                    child: Text(
                      'Continue',
                      style: GoogleFonts.outfit(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: _selectedSpeed.isEmpty
                            ? AppTheme.textMuted
                            : Colors.white,
                      ),
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

// ─── Speed Option Data ──────────────────────────────────────────────────────
class _SpeedOption {
  final String id;
  final String label;
  final String subtitle;
  final List<List<dynamic>> icon;
  final Color iconColor;
  final Color iconBackground;

  const _SpeedOption({
    required this.id,
    required this.label,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.iconBackground,
  });
}

// ─── Speed Option Card ──────────────────────────────────────────────────────
class _SpeedOptionCard extends StatelessWidget {
  final _SpeedOption option;
  final bool isSelected;
  final VoidCallback onTap;

  const _SpeedOptionCard({
    required this.option,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF3B82F6)
                : AppTheme.border,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF0F172A).withValues(alpha: 0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Icon
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: option.iconBackground,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: HugeIcon(
                  icon: option.icon,
                  color: option.iconColor,
                  size: 22,
                ),
              ),
            ),
            const Gap(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    option.label,
                    style: GoogleFonts.outfit(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  const Gap(2),
                  Text(
                    option.subtitle,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  color: Color(0xFF3B82F6),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 16,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
