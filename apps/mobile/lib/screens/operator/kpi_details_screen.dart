import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../theme/app_theme.dart';

class KpiDetailsScreen extends StatelessWidget {
  final String title;
  final String value;
  final String timeframe;
  final Color color;
  final Widget icon;

  const KpiDetailsScreen({
    super.key,
    required this.title,
    required this.value,
    required this.timeframe,
    required this.color,
    required this.icon,
  });

  void _simulateExport(BuildContext context, String format) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Simulating export to $format...'),
        backgroundColor: color,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.cBlackMain,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 20),
          onPressed: () => context.pop(),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            color: const Color(0xFF1E293B),
            onSelected: (value) => _simulateExport(context, value),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'PDF',
                child: Row(
                  children: [
                    const HugeIcon(icon: HugeIcons.strokeRoundedFile01, color: Colors.white, size: 20),
                    const Gap(12),
                    Text('Export as PDF', style: GoogleFonts.inter(color: Colors.white)),
                  ],
                ),
              ),
              PopupMenuItem<String>(
                value: 'Excel',
                child: Row(
                  children: [
                    const HugeIcon(icon: HugeIcons.strokeRoundedFileDownload, color: Colors.white, size: 20),
                    const Gap(12),
                    Text('Export as Excel', style: GoogleFonts.inter(color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: color.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              iconTheme: IconThemeData(color: color, size: 28),
                            ),
                            child: icon,
                          ),
                        ),
                        const Gap(16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: GoogleFonts.outfit(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '$timeframe Overview',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: Colors.white60,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Gap(24),
                    Text(
                      value,
                      style: GoogleFonts.outfit(
                        fontSize: 48,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        height: 1,
                      ),
                    ),
                    const Gap(8),
                    Text(
                      'Total parcels $title in this period',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.white54,
                      ),
                    ),
                    const Gap(32),
                    Text(
                      'Related Bookings',
                      style: GoogleFonts.outfit(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const Gap(16),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.05),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16),
                        leading: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                          ),
                          child: const HugeIcon(
                            icon: HugeIcons.strokeRoundedPackage,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        title: Text(
                          'Mock Booking #${1000 + index}',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        subtitle: Text(
                          'Processed today at 10:${index.toString().padLeft(2, '0')} AM',
                          style: GoogleFonts.inter(
                            color: Colors.white54,
                            fontSize: 13,
                          ),
                        ),
                        trailing: Icon(Icons.chevron_right, color: Colors.white.withValues(alpha: 0.3)),
                        onTap: () {
                          // Mock click
                        },
                      ),
                    );
                  },
                  childCount: int.tryParse(value) ?? 5, // Show up to the 'value' or 5
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
