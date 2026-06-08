import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../widgets/home/premium_ui_components.dart';

enum DeliveryStatus { arrived, delivered }

class DeliveryStatusScreen extends StatelessWidget {
  final DeliveryStatus status;
  final String trackingId;

  const DeliveryStatusScreen({
    super.key,
    required this.status,
    this.trackingId = 'MZX147856',
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Column(
                  children: [
                    if (status == DeliveryStatus.arrived) _buildArrivedHeader(context),
                    if (status == DeliveryStatus.delivered) _buildDeliveredHeader(context),
                    const Gap(32),
                    _ParcelStatsCard(status: status, trackingId: trackingId),
                  ],
                ),
              ),
            ),
            _buildBottomActions(context),
          ],
        ),
      ),
    );
  }

  Widget _buildArrivedHeader(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 4),
                boxShadow: [
                  BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
                image: const DecorationImage(
                  image: NetworkImage('https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=200&auto=format&fit=crop'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Color(0xFF10B981),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check, color: Colors.white, size: 16),
            ),
          ],
        ),
        const Gap(24),
        Text(
          'Driver Has Arrived',
          style: GoogleFonts.outfit(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: theme.textTheme.titleLarge?.color,
          ),
        ),
        const Gap(8),
        Text(
          'Confirm receipt of your shipment before\nthe driver leaves.',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 15,
            color: theme.brightness == Brightness.dark
                ? const Color(0xFF94A3B8)
                : const Color(0xFF64748B),
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildDeliveredHeader(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: const Color(0xFF3B82F6),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Icon(Icons.flash_on, color: Colors.white, size: 20),
              ),
            ),
            const Gap(12),
            Text(
              'MiziGO',
              style: GoogleFonts.outfit(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: theme.textTheme.titleLarge?.color,
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
        const Gap(24),
        Container(
          width: double.infinity,
          height: 220,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            image: const DecorationImage(
              image: NetworkImage('https://images.unsplash.com/photo-1566576721346-d4a3b4eaad5b?q=80&w=600&auto=format&fit=crop'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomActions(BuildContext context) {
    final theme = Theme.of(context);
    if (status == DeliveryStatus.arrived) {
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _ActionButton(
              label: 'Scan QR to Receive',
              icon: HugeIcons.strokeRoundedQrCode01,
              backgroundColor: const Color(0xFF3B82F6),
              textColor: Colors.white,
              onPressed: () => _showConfirmation(context),
            ),
            const Gap(12),
            _ActionButton(
              label: 'Delivery Code',
              icon: HugeIcons.strokeRoundedCirclePassword,
              backgroundColor: theme.cardColor,
              textColor: theme.textTheme.titleLarge?.color ?? const Color(0xFF1E293B),
              onPressed: () {},
            ),
            const Gap(12),
            _ActionButton(
              label: 'Refuse Delivery',
              icon: HugeIcons.strokeRoundedAlertCircle,
              backgroundColor: const Color(0xFFFFF1F2),
              textColor: const Color(0xFFE11D48),
              onPressed: () {},
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(56),
                  side: const BorderSide(color: Color(0xFFE2E8F0)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: Text(
                  'Done',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    color: theme.textTheme.titleLarge?.color,
                  ),
                ),
              ),
            ),
            const Gap(16),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(56),
                  backgroundColor: const Color(0xFF3B82F6),
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: Text(
                  'Share',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  void _showConfirmation(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const DeliveryStatusScreen(status: DeliveryStatus.delivered),
      ),
    );
  }
}

class _ParcelStatsCard extends StatelessWidget {
  final DeliveryStatus status;
  final String trackingId;

  const _ParcelStatsCard({required this.status, required this.trackingId});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(
              alpha: theme.brightness == Brightness.dark ? 0.2 : 0.04,
            ),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const ParcelIcon(),
              const Gap(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Parcel',
                          style: GoogleFonts.outfit(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: theme.textTheme.titleLarge?.color,
                          ),
                        ),
                        const Gap(4),
                        const HugeIcon(
                          icon: HugeIcons.strokeRoundedFire,
                          color: Color(0xFFEF4444),
                          size: 16,
                        ),
                      ],
                    ),
                    Text(
                      trackingId,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: const Color(0xFF94A3B8),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFECFDF5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      status == DeliveryStatus.arrived ? 'Arrived' : 'Delivered',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF10B981),
                      ),
                    ),
                  ),
                  const Gap(4),
                  Text(
                    status == DeliveryStatus.arrived ? '11:47 AM' : '1:58 PM',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: const Color(0xFF94A3B8),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Gap(24),
          const DashedDivider(),
          const Gap(24),
          _StatItem(label: 'From', value: 'Posta, Dar es Salaam'),
          const Gap(12),
          _StatItem(label: 'Destination', value: 'Sokoine road, Arusha'),
          const Gap(12),
          _StatItem(label: 'Size', value: 'Small Box Appr (30 x 30 x30)cm'),
          const Gap(12),
          if (status == DeliveryStatus.arrived) ...[
            _StatItem(label: 'Weight', value: 'Less than 1kg'),
            const Gap(12),
            _StatItem(label: 'Insurance', value: 'Premium'),
          ],
          if (status == DeliveryStatus.delivered) ...[
            _StatItem(label: 'Paid', value: 'TZS 20,000'),
            const Gap(24),
            Center(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFF1F5F9)),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const HugeIcon(
                  icon: HugeIcons.strokeRoundedQrCode01,
                  color: Color(0xFF1E293B),
                  size: 64,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;

  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14,
            color: const Color(0xFF94A3B8),
          ),
        ),
        const Spacer(),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1E293B),
            ),
          ),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final dynamic icon;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;

  const _ActionButton({
    required this.label,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 64,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HugeIcon(icon: icon, color: textColor, size: 24),
            const Gap(12),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
