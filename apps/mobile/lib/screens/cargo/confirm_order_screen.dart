import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:go_router/go_router.dart';

class ConfirmOrderScreen extends StatefulWidget {
  final String pickup;
  final String delivery;
  final String vehicle;
  final String receiverName;
  final String receiverPhone;
  final int total;
  final bool receiverPays;
  final String cargoDescription;
  final String packageName;
  final String packageValue;
  final String condition;
  final String cargoType;
  final String urgency;
  final String packageSize;

  const ConfirmOrderScreen({
    super.key,
    required this.pickup,
    required this.delivery,
    required this.vehicle,
    required this.receiverName,
    required this.receiverPhone,
    required this.total,
    this.receiverPays = false,
    required this.cargoDescription,
    required this.packageName,
    required this.packageValue,
    required this.condition,
    required this.cargoType,
    required this.urgency,
    required this.packageSize,
  });

  @override
  State<ConfirmOrderScreen> createState() => _ConfirmOrderScreenState();
}

class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {
  bool _confirmed = false;
  bool _isExpanded = true;

  String _fmt(int v) =>
      v.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},');

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF0F172A) : const Color(0xFFF1F5F9),
      body: Column(
        children: [
          // Blue Header
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 14,
              bottom: 18,
              left: 20,
              right: 20,
            ),
            color: const Color(0xFF3B82F6),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => context.pop(),
                  child: const Icon(Icons.arrow_back, color: Colors.white, size: 24),
                ),
                const Gap(16),
                Text(
                  'Confirm Order',
                  style: GoogleFonts.outfit(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Order Summary Card ────────────────────────────────
                  Container(
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF1E293B) : Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.06),
                          blurRadius: 14,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () => setState(() => _isExpanded = !_isExpanded),
                          borderRadius: BorderRadius.vertical(
                            top: const Radius.circular(18),
                            bottom: Radius.circular(_isExpanded ? 0 : 18),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    HugeIcon(
                                      icon: HugeIcons.strokeRoundedPackage,
                                      size: 28,
                                      color: isDark ? Colors.white : const Color(0xFF1E293B),
                                    ),
                                    const Gap(14),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'MZ ${DateTime.now().millisecondsSinceEpoch.toString().substring(5, 11)}',
                                          style: GoogleFonts.outfit(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800,
                                            color: isDark ? Colors.white : const Color(0xFF1E293B),
                                          ),
                                        ),
                                        Text(
                                          'Normal',
                                          style: GoogleFonts.inter(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: isDark ? Colors.white38 : const Color(0xFF94A3B8),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Icon(
                                      _isExpanded ? Icons.expand_less_rounded : Icons.expand_more_rounded,
                                      color: isDark ? Colors.white54 : const Color(0xFF1E293B),
                                      size: 28,
                                    ),
                                  ],
                                ),
                                const Gap(24),
                                _RouteBar(
                                  pickup: widget.pickup,
                                  delivery: widget.delivery,
                                  isDark: isDark,
                                ),
                              ],
                            ),
                          ),
                        ),

                        if (_isExpanded) ...[
                          _Divider(isDark: isDark),
                          const Gap(16),
  
                          // Details rows
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                _DetailRow(
                                  label: "Receiver's Name",
                                  value: widget.receiverName,
                                  isDark: isDark,
                                ),
                                const Gap(14),
                                _DetailRow(
                                  label: "Receiver's Number",
                                  value: widget.receiverPhone,
                                  isDark: isDark,
                                ),
                                const Gap(14),
                                _DetailRow(
                                  label: 'Package Name',
                                  value: widget.packageName,
                                  isDark: isDark,
                                ),
                                const Gap(14),
                                _DetailRow(
                                  label: 'Package Value',
                                  value: 'TZS ${widget.packageValue}',
                                  isDark: isDark,
                                ),
                                const Gap(14),
                                _DetailRow(
                                  label: 'Description',
                                  value: widget.cargoDescription.isEmpty ? '—' : widget.cargoDescription,
                                  isDark: isDark,
                                ),
                                const Gap(14),
                                _DetailRow(
                                  label: 'Cargo Type',
                                  value: widget.cargoType,
                                  isDark: isDark,
                                ),
                                const Gap(14),
                                _DetailRow(
                                  label: 'Size',
                                  value: widget.packageSize,
                                  isDark: isDark,
                                ),
                                const Gap(14),
                                _DetailRow(
                                  label: 'Condition',
                                  value: widget.condition,
                                  isDark: isDark,
                                ),
                                const Gap(14),
                                _DetailRow(
                                  label: 'Urgency',
                                  value: widget.urgency,
                                  isDark: isDark,
                                ),
                              ],
                            ),
                          ),
  
                          const Gap(20),
  
                          // Total amount box
                          Container(
                            margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            decoration: BoxDecoration(
                              color: isDark
                                  ? Colors.white.withValues(alpha: 0.05)
                                  : const Color(0xFFF8FAFC),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                'TZS ${_fmt(widget.total)}',
                                style: GoogleFonts.outfit(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                  color: isDark ? Colors.white : const Color(0xFF1E293B),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),

                  const Gap(20),

                  // ── Confirmation checkbox ────────────────────────────
                  GestureDetector(
                    onTap: () => setState(() => _confirmed = !_confirmed),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            color: _confirmed
                                ? const Color(0xFF3B82F6)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: _confirmed
                                  ? const Color(0xFF3B82F6)
                                  : (isDark ? Colors.white30 : const Color(0xFF94A3B8)),
                              width: 1.5,
                            ),
                          ),
                          child: _confirmed
                              ? const Icon(Icons.check, size: 14, color: Colors.white)
                              : null,
                        ),
                        const Gap(12),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: isDark ? Colors.white70 : const Color(0xFF475569),
                              ),
                              children: [
                                const TextSpan(
                                  text:
                                      'I confirm that my package does not contain any prohibited items. ',
                                ),
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: GestureDetector(
                                    onTap: () => _showProhibitedItems(context, isDark),
                                    child: Text(
                                      'View list',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        color: const Color(0xFF3B82F6),
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(16),
                ],
              ),
            ),
          ),

          // ── Bottom Bar ────────────────────────────────────────────────
          Container(
            padding: EdgeInsets.fromLTRB(
              20, 14, 20, MediaQuery.of(context).padding.bottom + 14,
            ),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1E293B) : Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 12,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Total Cost',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: isDark ? Colors.white54 : const Color(0xFF64748B),
                      ),
                    ),
                    Text(
                      _fmt(widget.total),
                      style: GoogleFonts.outfit(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: isDark ? Colors.white : const Color(0xFF1E293B),
                      ),
                    ),
                  ],
                ),
                const Gap(16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: !_confirmed
                        ? null
                        : () {
                            context.push(
                              '/send-package/availability',
                              extra: {
                                'pickup': widget.pickup,
                                'delivery': widget.delivery,
                                'vehicle': widget.vehicle,
                                'receiverName': widget.receiverName,
                                'receiverPhone': widget.receiverPhone,
                                'total': widget.total,
                                'receiverPays': widget.receiverPays,
                                'packageName': widget.packageName,
                                'packageValue': widget.packageValue,
                                'condition': widget.condition,
                                'cargoType': widget.cargoType,
                                'urgency': widget.urgency,
                                'packageSize': widget.packageSize,
                                'cargoDescription': widget.cargoDescription,
                              },
                            );
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3B82F6),
                      disabledBackgroundColor:
                          isDark ? Colors.white12 : const Color(0xFFE2E8F0),
                      foregroundColor: Colors.white,
                      disabledForegroundColor:
                          isDark ? Colors.white38 : const Color(0xFF94A3B8),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Check Availability',
                      style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showProhibitedItems(BuildContext context, bool isDark) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E293B) : Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Prohibited Items',
                  style: GoogleFonts.outfit(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: isDark ? Colors.white : const Color(0xFF1E293B),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.close,
                    color: isDark ? Colors.white54 : const Color(0xFF64748B),
                  ),
                ),
              ],
            ),
            const Gap(20),
            ...[
              'Explosives, firearms, and ammunition',
              'Flammable liquids and solids',
              'Oxidizing substances and organic peroxides',
              'Toxic and infectious substances',
              'Radioactive materials',
              'Corrosive substances',
              'Illegal drugs and narcotics',
              'Live animals (unless specifically authorized)',
              'Perishable goods (unless specifically authorized)',
              'Counterfeit goods',
            ].map((item) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Container(
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFF87171),
                          ),
                        ),
                      ),
                      const Gap(12),
                      Expanded(
                        child: Text(
                          item,
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: isDark ? Colors.white70 : const Color(0xFF475569),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            const Gap(8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3B82F6),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'I Understand',
                  style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Gap(MediaQuery.of(context).padding.bottom),
          ],
        ),
      ),
    );
  }
}

// ── Route visualisation ───────────────────────────────────────────────────────

class _RouteBar extends StatelessWidget {
  final String pickup;
  final String delivery;
  final bool isDark;
  const _RouteBar({required this.pickup, required this.delivery, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDark ? const Color(0xFF1E293B) : Colors.white,
                border: Border.all(color: const Color(0xFF3B82F6), width: 4.5),
              ),
            ),
            Expanded(
              child: Container(
                height: 3,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF3B82F6), Color(0xFF10B981)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ),
            ),
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDark ? const Color(0xFF1E293B) : Colors.white,
                border: Border.all(color: const Color(0xFF10B981), width: 4.5),
              ),
            ),
          ],
        ),
        const Gap(12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '13:24',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: isDark ? Colors.white38 : const Color(0xFF94A3B8),
                  ),
                ),
                Text(
                  pickup.contains('location')
                      ? 'Pickup'
                      : pickup.split(' ').take(2).join(' '),
                  style: GoogleFonts.outfit(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: isDark ? Colors.white : const Color(0xFF1E293B),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '14:03',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: isDark ? Colors.white38 : const Color(0xFF94A3B8),
                  ),
                ),
                Text(
                  delivery.contains('location')
                      ? 'Destination'
                      : delivery.split(' ').take(2).join(' '),
                  style: GoogleFonts.outfit(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: isDark ? Colors.white : const Color(0xFF1E293B),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  final bool isDark;
  const _Divider({required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      color: isDark ? Colors.white10 : Colors.black.withValues(alpha: 0.06),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isDark;
  const _DetailRow({required this.label, required this.value, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 13,
            color: isDark ? Colors.white38 : const Color(0xFF94A3B8),
          ),
        ),
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: isDark ? Colors.white : const Color(0xFF1E293B),
          ),
        ),
      ],
    );
  }
}
