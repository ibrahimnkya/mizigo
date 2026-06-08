import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:gap/gap.dart';
import '../../theme/app_theme.dart';

class EfficiencyScreen extends StatefulWidget {
  final String metricTitle;
  const EfficiencyScreen({super.key, required this.metricTitle});

  @override
  State<EfficiencyScreen> createState() => _EfficiencyScreenState();
}

class _EfficiencyScreenState extends State<EfficiencyScreen> {
  String _selectedPeriod = 'Last 30 Days';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.cBlackMain,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const HugeIcon(icon: HugeIcons.strokeRoundedArrowLeft01, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.metricTitle,
          style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const HugeIcon(icon: HugeIcons.strokeRoundedDownload01, color: Color(0xFF3B82F6), size: 24),
          ),
          const Gap(8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
          // Period Selector
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Select Period', style: GoogleFonts.inter(color: Colors.white38, fontSize: 12)),
                    const Gap(4),
                    Text(_selectedPeriod, style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w700)),
                  ],
                ),
                TextButton(
                  onPressed: _showPeriodPicker,
                  child: Text('Change', style: GoogleFonts.inter(color: const Color(0xFF3B82F6))),
                ),
              ],
            ),
          ),
          const Gap(32),

          // Main Metric Card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [const Color(0xFF3B82F6), const Color(0xFF2563EB)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(32),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF3B82F6).withValues(alpha: 0.3),
                  blurRadius: 30,
                  offset: const Offset(0, 15),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  '98.4%',
                  style: GoogleFonts.outfit(fontSize: 64, fontWeight: FontWeight.w900, color: Colors.white),
                ),
                Text(
                  'Accuracy Rating',
                  style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white.withValues(alpha: 0.7)),
                ),
                const Gap(24),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const HugeIcon(icon: HugeIcons.strokeRoundedArrowUp01, color: Color(0xFF10B981), size: 16),
                      const Gap(4),
                      Text('+2.4% vs last period', style: GoogleFonts.inter(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Gap(40),

          Text(
            'Daily Performance',
            style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          const Gap(20),

          // Mock Chart Bars
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _chartBar('Mon', 0.6),
              _chartBar('Tue', 0.8),
              _chartBar('Wed', 0.4),
              _chartBar('Thu', 0.9),
              _chartBar('Fri', 0.7),
              _chartBar('Sat', 0.5),
              _chartBar('Sun', 0.3),
            ],
          ),
          const Gap(40),

          // Detailed Insights
          _insightCard('Processing Speed', 'Average 4.2 mins per parcel', HugeIcons.strokeRoundedFlash, const Color(0xFFF59E0B)),
          _insightCard('Peak Hours', '10:00 AM - 12:00 PM', HugeIcons.strokeRoundedClock01, const Color(0xFF3B82F6)),
          _insightCard('Top Station', 'Nairobi Central (NBO)', HugeIcons.strokeRoundedNavigation03, const Color(0xFF10B981)),
          
          const Gap(40),
          
          // Help Section
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B).withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF3B82F6).withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const HugeIcon(icon: HugeIcons.strokeRoundedInformationCircle, color: Color(0xFF3B82F6), size: 24),
                ),
                const Gap(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Need Help?', style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white)),
                      const Gap(4),
                      Text('Learn how we calculate your efficiency score.', style: GoogleFonts.inter(fontSize: 13, color: Colors.white38)),
                    ],
                  ),
                ),
                const HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01, color: Colors.white24, size: 20),
              ],
            ),
          ),
          const Gap(32),
        ],
      ),
    ),
  );
}

  Widget _chartBar(String day, double percent) {
    return Column(
      children: [
        Container(
          height: 150 * percent,
          width: 30,
          decoration: BoxDecoration(
            color: percent > 0.7 ? const Color(0xFF3B82F6) : const Color(0xFF1E293B),
            borderRadius: BorderRadius.circular(8),
            boxShadow: percent > 0.7 ? [
              BoxShadow(color: const Color(0xFF3B82F6).withValues(alpha: 0.2), blurRadius: 10, offset: const Offset(0, 4)),
            ] : null,
          ),
        ),
        const Gap(12),
        Text(day, style: GoogleFonts.inter(color: Colors.white38, fontSize: 11)),
      ],
    );
  }

  Widget _insightCard(String title, String value, dynamic icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: HugeIcon(icon: icon, color: color, size: 20),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.inter(color: Colors.white38, fontSize: 13)),
                const Gap(2),
                Text(value, style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 15)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showPeriodPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Color(0xFF0F172A),
          borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select Period', style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white)),
            const Gap(24),
            _periodItem('Today'),
            _periodItem('Last 7 Days'),
            _periodItem('Last 30 Days'),
            _periodItem('Custom Range'),
            const Gap(16),
          ],
        ),
      ),
    );
  }

  Widget _periodItem(String label) {
    bool isSelected = _selectedPeriod == label;
    return ListTile(
      onTap: () {
        setState(() => _selectedPeriod = label);
        Navigator.pop(context);
      },
      contentPadding: EdgeInsets.zero,
      title: Text(label, style: GoogleFonts.inter(color: isSelected ? const Color(0xFF3B82F6) : Colors.white70, fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400)),
      trailing: isSelected ? const HugeIcon(icon: HugeIcons.strokeRoundedCheckmarkCircle01, color: Color(0xFF3B82F6), size: 20) : null,
    );
  }
}
