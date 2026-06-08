import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';

enum MembershipTier { gold, platinum, elite }

class MembershipCard extends StatelessWidget {
  final MembershipTier tier;
  final VoidCallback onUpgrade;

  const MembershipCard({
    super.key,
    required this.tier,
    required this.onUpgrade,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: _getGradientColors(),
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: _getGradientColors().last.withValues(alpha: 0.25),
            blurRadius: 25,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // Logo Placeholder (Simplified block version)
                  Image.asset(
                    'assets/images/logo_membership.png',
                    height: 28,
                    fit: BoxFit.contain,
                  ),
                  const Gap(10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E293B).withValues(alpha: 0.85),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      _getTierName(),
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: onUpgrade,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E293B),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 12,
                  ),
                ),
                child: Text(
                  'Upgrade',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w800,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          const Gap(20),
          Text(
            'Features',
            style: GoogleFonts.outfit(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF1E293B),
              letterSpacing: -0.5,
            ),
          ),
          const Gap(12),
          Column(
            children: [
              for (var i = 0; i < _getFeatures().length; i++) ...[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: Icon(
                        Icons.check,
                        size: 18,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    const Gap(10),
                    Expanded(
                      child: Text(
                        _getFeatures()[i],
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1E293B).withValues(alpha: 0.9),
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
                if (i < _getFeatures().length - 1) const Gap(10),
              ],
            ],
          ),
        ],
        ),
      ),
    );
  }

  List<Color> _getGradientColors() {
    switch (tier) {
      case MembershipTier.gold:
        return [const Color(0xFFFFB65C), const Color(0xFFFFF78B)];
      case MembershipTier.platinum:
        return [const Color(0xFFBDCEDB), const Color(0xFFE9F1F8)];
      case MembershipTier.elite:
        return [const Color(0xFF86D6E9), const Color(0xFF7AEDC4)];
    }
  }

  String _getTierName() {
    switch (tier) {
      case MembershipTier.gold:
        return 'Gold';
      case MembershipTier.platinum:
        return 'Platinum';
      case MembershipTier.elite:
        return 'Elite';
    }
  }

  List<String> _getFeatures() {
    return [
      'Discounted delivery rates (up to 10%)',
      'Faster booking flow with saved preferences',
      'Priority pickup scheduling',
      'Free real-time tracking',
    ];
  }
}
