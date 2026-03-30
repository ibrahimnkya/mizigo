import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import '../../providers/printer_provider.dart';
import '../../theme/app_theme.dart';
import '../../models/operation_model.dart';

class OperationsHubScreen extends StatelessWidget {
  const OperationsHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.cBlackMain,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Header
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Operations',
                          style: GoogleFonts.outfit(
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        const Gap(4),
                        Text(
                          'Manage your daily cargo workflows',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: const Color(0xFF94A3B8),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        // Printer Status Icon — comes first
                        Consumer<PrinterProvider>(
                          builder: (context, printer, _) => GestureDetector(
                            onTap: () => context.push('/profile/printer-settings'),
                            child: Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: const Color(0xFF1E293B),
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  const HugeIcon(
                                    icon: HugeIcons.strokeRoundedPrinter,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  Positioned(
                                    right: 10,
                                    top: 10,
                                    child: Container(
                                      width: 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        color: printer.isConnected
                                            ? const Color(0xFF10B981)
                                            : printer.isLoading
                                                ? const Color(0xFFF59E0B)
                                                : const Color(0xFFEF4444),
                                        shape: BoxShape.circle,
                                        border: Border.all(color: const Color(0xFF1E293B), width: 1.5),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Gap(8),
                        // Help Icon — same circular style as home screen
                        GestureDetector(
                          onTap: () => _showHubHelp(context),
                          child: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: const Color(0xFF1E293B),
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
                            ),
                            child: const Center(
                              child: HugeIcon(
                                icon: HugeIcons.strokeRoundedHelpCircle,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Main Actions Grid
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.85,
                ),
                delegate: SliverChildListDelegate([
                  _hubCard(
                    context,
                    title: 'Receive Cargo',
                    subtitle: 'Register incoming parcels',
                    icon: HugeIcons.strokeRoundedPackageReceive,
                    color: const Color(0xFF3B82F6),
                    onTap: () => context.push('/receive-cargo'),
                  ),
                  _hubCard(
                    context,
                    title: 'Send to Station',
                    subtitle: 'Dispatch to next hub',
                    icon: HugeIcons.strokeRoundedSpeedTrain02,
                    color: const Color(0xFFF59E0B),
                    onTap: () => context.push('/send-cargo'),
                  ),
                  _hubCard(
                    context,
                    title: 'Deliver',
                    subtitle: 'Hand over to customer',
                    icon: HugeIcons.strokeRoundedCheckmarkBadge01,
                    color: const Color(0xFF10B981),
                    onTap: () => context.push('/deliver-cargo'),
                  ),
                  _hubCard(
                    context,
                    title: 'Quick Scan',
                    subtitle: 'Scan tracking code',
                    icon: HugeIcons.strokeRoundedQrCode01,
                    color: const Color(0xFF6366F1),
                    onTap: () => context.push('/scanner', extra: ParcelOperation.view),
                  ),
                ]),
              ),
            ),

            // Secondary Actions / Stats Placeholder
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: GestureDetector(
                  onTap: () => context.push('/bookings', extra: {'filter': 'today'}),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF3B82F6).withValues(alpha: 0.1),
                        const Color(0xFF06B6D4).withValues(alpha: 0.1),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFF3B82F6),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const HugeIcon(
                          icon: HugeIcons.strokeRoundedChartBarLine,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      const Gap(16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Daily Performance',
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'You have processed 12 parcels today',
                              style: GoogleFonts.inter(
                                color: const Color(0xFF94A3B8),
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.chevron_right_rounded, color: Colors.white24),
                    ],
                  ),
                ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _hubCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required dynamic icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: HugeIcon(icon: icon, color: color, size: 28),
            ),
            const Spacer(),
            Text(
              title,
              style: GoogleFonts.outfit(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            const Gap(4),
            Text(
              subtitle,
              style: GoogleFonts.inter(
                color: const Color(0xFF64748B),
                fontSize: 12,
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showHubHelp(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: const BoxDecoration(
          color: Color(0xFF0F172A),
          borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(8),
            Center(child: Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(2)))),
            const Gap(24),
            Text(
              'Operations Guide',
              style: GoogleFonts.outfit(fontSize: 24, fontWeight: FontWeight.w800, color: Colors.white),
            ),
            const Gap(8),
            Text(
              'Learn how to manage cargo efficiently.',
              style: GoogleFonts.inter(color: Colors.white38, fontSize: 14),
            ),
            const Gap(32),
            Expanded(
              child: ListView(
                children: [
                  _helpItem(
                    'Receiving Cargo',
                    'Scan or enter Tracking ID to register incoming parcels to your station.',
                    HugeIcons.strokeRoundedPackageReceive,
                  ),
                  _helpItem(
                    'Delivering Cargo',
                    'Verify the receiver and mark the cargo as delivered to complete the journey.',
                    HugeIcons.strokeRoundedDeliveryTruck01,
                  ),
                  _helpItem(
                    'Printer Setup',
                    'Ensure your thermal printer is connected via Bluetooth or USB for ticket printing.',
                    HugeIcons.strokeRoundedPrinter,
                  ),
                  _helpItem(
                    'Real-time Reports',
                    'Monitor your daily volume and performance metrics in the Reports section.',
                    HugeIcons.strokeRoundedAnalytics01,
                  ),
                ],
              ),
            ),
            const Gap(16),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: FilledButton(
                onPressed: () => Navigator.pop(context),
                style: FilledButton.styleFrom(
                  backgroundColor: AppTheme.cPrimary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: Text('Got it', style: GoogleFonts.inter(fontWeight: FontWeight.w800, color: Colors.white)),
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
              color: Colors.white.withValues(alpha: 0.03),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
            ),
            child: HugeIcon(icon: icon, color: AppTheme.cPrimary, size: 22),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
                ),
                const Gap(4),
                Text(
                  desc,
                  style: GoogleFonts.inter(fontSize: 13, color: Colors.white38, height: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
