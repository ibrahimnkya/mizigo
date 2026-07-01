import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../providers/printer_provider.dart';
import '../../theme/app_theme.dart';
import '../../widgets/common/shimmer_utils.dart';

class _HubAction {
  final String title;
  final String subtitle;
  final dynamic icon;
  final Color color;
  final VoidCallback onTap;

  const _HubAction({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });
}

class OperationsHubScreen extends StatefulWidget {
  const OperationsHubScreen({super.key});

  @override
  State<OperationsHubScreen> createState() => _OperationsHubScreenState();
}

class _OperationsHubScreenState extends State<OperationsHubScreen> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) setState(() => _loading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    final role = auth.user?.role?.toUpperCase() ?? '';

    final List<_HubAction> actions = [];

    if (role == 'CLERK') {
      actions.add(_HubAction(
        title: 'Receive Parcel',
        subtitle: 'Register incoming items',
        icon: HugeIcons.strokeRoundedPackageReceive,
        color: const Color(0xFF3B82F6),
        onTap: () => context.push('/receive-parcel'),
      ));
      actions.add(_HubAction(
        title: 'Deliver Parcel',
        subtitle: 'Hand over to customer',
        icon: HugeIcons.strokeRoundedCheckmarkBadge01,
        color: const Color(0xFF10B981),
        onTap: () => context.push('/deliver-parcel'),
      ));
      actions.add(_HubAction(
        title: 'Reports',
        subtitle: 'View daily analytics',
        icon: HugeIcons.strokeRoundedAnalytics01,
        color: const Color(0xFF8B5CF6),
        onTap: () => context.push('/operator-reports'),
      ));
    } else if (role == 'TRAIN_GUARD') {
      actions.add(_HubAction(
        title: 'Offload Parcel',
        subtitle: 'Mark as arrived at station',
        icon: HugeIcons.strokeRoundedPackageReceive,
        color: const Color(0xFF6366F1),
        onTap: () => context.push('/offload-parcel'),
      ));
      actions.add(_HubAction(
        title: 'Dispatch Parcel',
        subtitle: 'Send to next terminal',
        icon: HugeIcons.strokeRoundedSpeedTrain02,
        color: const Color(0xFFF59E0B),
        onTap: () => context.push('/send-parcel'),
      ));
      actions.add(_HubAction(
        title: 'Reports',
        subtitle: 'View daily analytics',
        icon: HugeIcons.strokeRoundedAnalytics01,
        color: const Color(0xFF8B5CF6),
        onTap: () => context.push('/operator-reports'),
      ));
    } else if (role == 'STATION_MASTER') {
      actions.add(_HubAction(
        title: 'Receive Parcel',
        subtitle: 'Register incoming items',
        icon: HugeIcons.strokeRoundedPackageReceive,
        color: const Color(0xFF3B82F6),
        onTap: () => context.push('/receive-parcel'),
      ));
      actions.add(_HubAction(
        title: 'Send Parcel',
        subtitle: 'Send to next terminal',
        icon: HugeIcons.strokeRoundedSpeedTrain02,
        color: const Color(0xFFF59E0B),
        onTap: () => context.push('/send-parcel'),
      ));
      actions.add(_HubAction(
        title: 'Deliver Parcel',
        subtitle: 'Hand over to customer',
        icon: HugeIcons.strokeRoundedCheckmarkBadge01,
        color: const Color(0xFF10B981),
        onTap: () => context.push('/deliver-parcel'),
      ));
    } else {
      // Fallback
      actions.add(_HubAction(
        title: 'Receive Parcel',
        subtitle: 'Register incoming items',
        icon: HugeIcons.strokeRoundedPackageReceive,
        color: const Color(0xFF3B82F6),
        onTap: () => context.push('/receive-parcel'),
      ));
      actions.add(_HubAction(
        title: 'Dispatch Parcel',
        subtitle: 'Send to next terminal',
        icon: HugeIcons.strokeRoundedSpeedTrain02,
        color: const Color(0xFFF59E0B),
        onTap: () => context.push('/send-parcel'),
      ));
      actions.add(_HubAction(
        title: 'Offload Parcel',
        subtitle: 'Mark as arrived at station',
        icon: HugeIcons.strokeRoundedPackageReceive,
        color: const Color(0xFF6366F1),
        onTap: () => context.push('/offload-parcel'),
      ));
      actions.add(_HubAction(
        title: 'Deliver Parcel',
        subtitle: 'Hand over to customer',
        icon: HugeIcons.strokeRoundedCheckmarkBadge01,
        color: const Color(0xFF10B981),
        onTap: () => context.push('/deliver-parcel'),
      ));
    }

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: ShimmerLoading(
          isLoading: _loading,
          child: _loading
              ? _HubSkeleton(count: actions.isNotEmpty ? actions.length : 3)
              : CustomScrollView(
                  slivers: [
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
                                    color: AppTheme.textPrimary,
                                  ),
                                ),
                                const Gap(4),
                                Text(
                                  'Manage your daily parcel workflows',
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    color: AppTheme.textSecondary,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Consumer<PrinterProvider>(
                                  builder: (context, printer, _) => GestureDetector(
                                    onTap: () => context.push('/profile/printer-settings'),
                                    child: Container(
                                      width: 48,
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: AppTheme.surface,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppTheme.border,
                                        ),
                                      ),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          HugeIcon(
                                            icon: HugeIcons.strokeRoundedPrinter,
                                            color: AppTheme.textPrimary,
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
                                                border: Border.all(
                                                  color: AppTheme.surface,
                                                  width: 1.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const Gap(8),
                                GestureDetector(
                                  onTap: () => _showHubHelp(context),
                                  child: Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: AppTheme.surface,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: AppTheme.border,
                                      ),
                                    ),
                                    child: Center(
                                      child: HugeIcon(
                                        icon: HugeIcons.strokeRoundedHelpCircle,
                                        color: AppTheme.textPrimary,
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

                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      sliver: SliverGrid(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.85,
                        ),
                        delegate: SliverChildListDelegate(
                          actions.map((action) => _hubCard(
                            context,
                            title: action.title,
                            subtitle: action.subtitle,
                            icon: action.icon,
                            color: action.color,
                            onTap: action.onTap,
                          )).toList(),
                        ),
                      ),
                    ),

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
                                  AppTheme.cPrimary.withValues(alpha: 0.1),
                                  AppTheme.accent.withValues(alpha: 0.1),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: AppTheme.border,
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: AppTheme.cPrimary,
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
                                        'Overall Performance',
                                        style: GoogleFonts.inter(
                                          color: AppTheme.textPrimary,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        'You have processed 120 parcels overall',
                                        style: GoogleFonts.inter(
                                          color: AppTheme.textSecondary,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const HugeIcon(
                                  icon: HugeIcons.strokeRoundedArrowRight01,
                                  color: Color(0xFF64748B),
                                  size: 20,
                                ),
                              ],
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
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppTheme.border,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF0F172A).withValues(alpha: 0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
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
                color: AppTheme.textPrimary,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            const Gap(4),
            Text(
              subtitle,
              style: GoogleFonts.inter(
                color: AppTheme.textSecondary,
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
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
          border: Border(
            top: BorderSide(color: AppTheme.border),
            left: BorderSide(color: AppTheme.border),
            right: BorderSide(color: AppTheme.border),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF0F172A).withValues(alpha: 0.08),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(8),
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppTheme.border,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const Gap(24),
            Text(
              'Operations Guide',
              style: GoogleFonts.outfit(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: AppTheme.textPrimary,
              ),
            ),
            const Gap(8),
            Text(
              'Learn how to manage parcel efficiently.',
              style: GoogleFonts.inter(
                color: AppTheme.textSecondary,
                fontSize: 14,
              ),
            ),
            const Gap(32),
            Expanded(
              child: ListView(
                children: [
                  _helpItem(
                    context,
                    'Receiving Parcel',
                    'Scan or enter Tracking ID to register incoming parcels to your station.',
                    HugeIcons.strokeRoundedPackageReceive,
                  ),
                  _helpItem(
                    context,
                    'Delivering Parcel',
                    'Verify the receiver and mark the parcel as delivered to complete the journey.',
                    HugeIcons.strokeRoundedDeliveryTruck01,
                  ),
                  _helpItem(
                    context,
                    'Printer Setup',
                    'Ensure your thermal printer is connected via Bluetooth or USB for ticket printing.',
                    HugeIcons.strokeRoundedPrinter,
                  ),
                  _helpItem(
                    context,
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

  Widget _helpItem(BuildContext context, String title, String desc, dynamic icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.background,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: AppTheme.border,
              ),
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
                  style: GoogleFonts.outfit(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.textPrimary,
                  ),
                ),
                const Gap(4),
                Text(
                  desc,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: AppTheme.textSecondary,
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
}

class _HubSkeleton extends StatelessWidget {
  final int count;
  const _HubSkeleton({this.count = 3});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24.0),
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BoxSkeleton(width: 180, height: 40),
                const Gap(8),
                const BoxSkeleton(width: 220, height: 16),
              ],
            ),
            Row(
              children: [
                const CircleSkeleton(size: 48),
                const Gap(8),
                const CircleSkeleton(size: 48),
              ],
            ),
          ],
        ),
        const Gap(32),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.85,
          children: List.generate(count, (index) => const BoxSkeleton(borderRadius: 24)),
        ),
        const Gap(32),
        const BoxSkeleton(width: 180, height: 22),
        const Gap(16),
        const BoxSkeleton(height: 100, borderRadius: 24),
      ],
    );
  }
}
