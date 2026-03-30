import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ReceiverScreen extends StatefulWidget {
  final String pickup;
  final String delivery;
  final String vehicle;
  final int basePrice;
  final String cargoDescription;
  final String packageName;
  final String packageValue;
  final String condition;
  final String cargoType;
  final String urgency;
  final String packageSize;

  const ReceiverScreen({
    super.key,
    required this.pickup,
    required this.delivery,
    required this.vehicle,
    required this.basePrice,
    required this.cargoDescription,
    required this.packageName,
    required this.packageValue,
    required this.condition,
    required this.cargoType,
    required this.urgency,
    required this.packageSize,
  });

  @override
  State<ReceiverScreen> createState() => _ReceiverScreenState();
}

class _ReceiverScreenState extends State<ReceiverScreen> {
  final _nameCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();

  bool _receiverPays = false;

  // Additional services
  bool _insurance = false;
  bool _fragile = false;
  bool _express = false;
  bool _standard = true;

  // Pickup type
  bool _pickupAtStation = true;   // Free – SGR Station
  bool _deliverToLocation = false; // +15,000

  static const int _insuranceCost = 10000;
  static const int _fragileCost = 20000;
  static const int _expressCost = 30000;
  static const int _standardCost = 10000;
  static const int _deliveryCost = 15000;

  @override
  void initState() {
    super.initState();
    // Sync with selections from PackageDetailsScreen
    if (widget.cargoType == 'Fragile Goods') {
      _fragile = true;
    }
    if (widget.urgency == 'Express') {
      _express = true;
      _standard = false;
    }
  }

  int get _total {
    int t = widget.basePrice;
    if (_insurance) t += _insuranceCost;
    if (_fragile) t += _fragileCost;
    if (_express) t += _expressCost;
    if (_standard) t += _standardCost;
    if (_deliverToLocation) t += _deliveryCost;
    return t;
  }

  bool get _isPhoneValid {
    final phone = _phoneCtrl.text.trim();
    if (phone.isEmpty) return false;
    // Basic TZ validation: +255... (13 chars total) or 0... (10 chars total)
    final tzRegex = RegExp(r"^(?:\+255|0)[67]\d{8}$");
    return tzRegex.hasMatch(phone);
  }

  String _fmt(int v) =>
      v.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},');

  @override
  void dispose() {
    _nameCtrl.dispose();
    _phoneCtrl.dispose();
    super.dispose();
  }

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
                  'Receiver',
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
                  // ── Receiver Information ─────────────────────────────
                  _SectionHeader(title: 'Receiver Information', isDark: isDark),
                  const Gap(12),
                  Column(
                    children: [
                      _InputField(
                        controller: _nameCtrl,
                        hint: 'Full Name',
                        icon: Icons.person_outline_rounded,
                        isDark: isDark,
                        onChanged: (v) => setState(() {}),
                      ),
                      const Gap(12),
                      _InputField(
                        controller: _phoneCtrl,
                        hint: 'Phone Number',
                        icon: Icons.phone_android_rounded,
                        keyType: TextInputType.phone,
                        isDark: isDark,
                        onChanged: (v) => setState(() {}),
                      ),
                      const Gap(16),
                      // Receiver pays checkbox
                      InkWell(
                        onTap: () => setState(() => _receiverPays = !_receiverPays),
                        borderRadius: BorderRadius.circular(12),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [
                              _CheckBox(checked: _receiverPays, isDark: isDark,
                                  onTap: () => setState(() => _receiverPays = !_receiverPays)),
                              const Gap(12),
                              Text(
                                'Receiver will pay on pickup/delivery',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: isDark ? Colors.white70 : const Color(0xFF475569),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Gap(24),

                  // ── Additional Services ─────────────────────────────────
                  _SectionHeader(title: 'Additional Services', isDark: isDark),
                  const Gap(12),
                  Container(
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF1E293B) : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _ServiceRow(
                          label: 'Insurance',
                          cost: _insuranceCost,
                          checked: _insurance,
                          isDark: isDark,
                          onTap: () => setState(() => _insurance = !_insurance),
                          showDivider: true,
                        ),
                        _ServiceRow(
                          label: 'Fragile handling',
                          cost: _fragileCost,
                          checked: _fragile,
                          isDark: isDark,
                          onTap: () => setState(() => _fragile = !_fragile),
                          showDivider: true,
                        ),
                        _ServiceRow(
                          label: 'Express delivery',
                          cost: _expressCost,
                          checked: _express,
                          isDark: isDark,
                          isRadio: true,
                          onTap: () => setState(() {
                            _express = true;
                            _standard = false;
                          }),
                          showDivider: true,
                        ),
                        _ServiceRow(
                          label: 'Standard delivery',
                          cost: _standardCost,
                          checked: _standard,
                          isDark: isDark,
                          isRadio: true,
                          onTap: () => setState(() {
                            _standard = true;
                            _express = false;
                          }),
                          showDivider: false,
                        ),
                      ],
                    ),
                  ),

                  const Gap(24),

                  // ── Pickup Type ──────────────────────────────────────────
                  _SectionHeader(title: 'Pickup', isDark: isDark),
                  const Gap(12),
                  Container(
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF1E293B) : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _PickupRow(
                          label: 'Pickup at SGR Station',
                          cost: 0,
                          checked: _pickupAtStation,
                          isDark: isDark,
                          onTap: () => setState(() {
                            _pickupAtStation = true;
                            _deliverToLocation = false;
                          }),
                          showDivider: true,
                        ),
                        _PickupRow(
                          label: 'Deliver to Location',
                          cost: _deliveryCost,
                          checked: _deliverToLocation,
                          isDark: isDark,
                          onTap: () => setState(() {
                            _deliverToLocation = true;
                            _pickupAtStation = false;
                          }),
                          showDivider: false,
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
                      'Total',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: isDark ? Colors.white54 : const Color(0xFF64748B),
                      ),
                    ),
                    Text(
                      _fmt(_total),
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
                    onPressed: _nameCtrl.text.isEmpty || !_isPhoneValid ? null : () {
                      context.push('/send-package/confirm', extra: {
                        'pickup': widget.pickup,
                        'delivery': widget.delivery,
                        'vehicle': widget.vehicle,
                        'receiverName': _nameCtrl.text,
                        'receiverPhone': _phoneCtrl.text,
                        'total': _total,
                        'receiverPays': _receiverPays,
                        'cargoDescription': widget.cargoDescription,
                        'packageName': widget.packageName,
                        'packageValue': widget.packageValue,
                        'condition': widget.condition,
                        'cargoType': widget.cargoType,
                        'urgency': widget.urgency,
                        'packageSize': widget.packageSize,
                      });
                    },
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
                      'Confirm',
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
}

// ── Helpers ─────────────────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  final String title;
  final bool isDark;
  const _SectionHeader({required this.title, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.outfit(
        fontSize: 17,
        fontWeight: FontWeight.w700,
        color: isDark ? Colors.white : const Color(0xFF1E293B),
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final TextInputType keyType;
  final bool isDark;
  final Function(String)? onChanged;

  const _InputField({
    required this.controller,
    required this.hint,
    required this.icon,
    this.keyType = TextInputType.text,
    required this.isDark,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E293B) : Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isDark ? Colors.white.withValues(alpha: 0.05) : const Color(0xFFE2E8F0),
          width: 1,
        ),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyType,
        onChanged: onChanged,
        style: GoogleFonts.inter(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: isDark ? Colors.white : const Color(0xFF1E293B),
        ),
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(
            icon,
            size: 20,
            color: isDark ? Colors.white38 : const Color(0xFF94A3B8),
          ),
          hintStyle: GoogleFonts.inter(
            fontSize: 15,
            color: isDark ? Colors.white30 : const Color(0xFF94A3B8),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class _CheckBox extends StatelessWidget {
  final bool checked;
  final bool isDark;
  final VoidCallback onTap;
  const _CheckBox({required this.checked, required this.isDark, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: checked ? const Color(0xFF3B82F6) : Colors.transparent,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: checked
                ? const Color(0xFF3B82F6)
                : (isDark ? Colors.white30 : const Color(0xFF94A3B8)),
            width: 1.5,
          ),
        ),
        child: checked
            ? const Icon(Icons.check, size: 14, color: Colors.white)
            : null,
      ),
    );
  }
}

class _RadioBox extends StatelessWidget {
  final bool checked;
  final bool isDark;
  final VoidCallback onTap;
  const _RadioBox({required this.checked, required this.isDark, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(
            color: checked
                ? const Color(0xFF3B82F6)
                : (isDark ? Colors.white30 : const Color(0xFF94A3B8)),
            width: 1.5,
          ),
        ),
        child: checked
            ? Center(
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Color(0xFF3B82F6),
                    shape: BoxShape.circle,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}

class _ServiceRow extends StatelessWidget {
  final String label;
  final int cost;
  final bool checked;
  final bool isDark;
  final VoidCallback onTap;
  final bool showDivider;
  final bool isRadio;

  const _ServiceRow({
    required this.label,
    required this.cost,
    required this.checked,
    required this.isDark,
    required this.onTap,
    required this.showDivider,
    this.isRadio = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              children: [
                isRadio
                    ? _RadioBox(checked: checked, isDark: isDark, onTap: onTap)
                    : _CheckBox(checked: checked, isDark: isDark, onTap: onTap),
                const Gap(14),
                Expanded(
                  child: Text(
                    label,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: isDark ? Colors.white : const Color(0xFF1E293B),
                    ),
                  ),
                ),
                Text(
                  '+ ${cost.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}',
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: isDark ? Colors.white54 : const Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (showDivider)
          Divider(
            height: 1,
            color: isDark ? Colors.white10 : Colors.black.withValues(alpha: 0.06),
            indent: 20,
            endIndent: 20,
          ),
      ],
    );
  }
}

class _PickupRow extends StatelessWidget {
  final String label;
  final int cost;
  final bool checked;
  final bool isDark;
  final VoidCallback onTap;
  final bool showDivider;

  const _PickupRow({
    required this.label,
    required this.cost,
    required this.checked,
    required this.isDark,
    required this.onTap,
    required this.showDivider,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: checked
                  ? const Color(0xFF3B82F6).withValues(alpha: 0.08)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: checked
                    ? const Color(0xFF3B82F6)
                    : (isDark ? Colors.white12 : Colors.black.withValues(alpha: 0.08)),
                width: 1.5,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              child: Row(
                children: [
                  _CheckBox(checked: checked, isDark: isDark, onTap: onTap),
                  const Gap(14),
                  Expanded(
                    child: Text(
                      label,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: checked
                            ? const Color(0xFF3B82F6)
                            : (isDark ? Colors.white : const Color(0xFF1E293B)),
                      ),
                    ),
                  ),
                  Text(
                    cost == 0 ? '0' : '+ ${cost.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: checked
                          ? const Color(0xFF3B82F6)
                          : (isDark ? Colors.white54 : const Color(0xFF64748B)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (showDivider)
          Divider(
            height: 1,
            color: isDark ? Colors.white10 : Colors.black.withValues(alpha: 0.06),
            indent: 12,
            endIndent: 12,
          ),
      ],
    );
  }
}
