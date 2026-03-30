import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import '../../../providers/auth_provider.dart';

class OperatorPackageDetailsScreen extends StatefulWidget {
  const OperatorPackageDetailsScreen({super.key});

  @override
  State<OperatorPackageDetailsScreen> createState() => _OperatorPackageDetailsScreenState();
}

class _OperatorPackageDetailsScreenState extends State<OperatorPackageDetailsScreen> {
  final _nameCtrl = TextEditingController();
  final _valueCtrl = TextEditingController();
  final _descCtrl = TextEditingController();
  final _weightCtrl = TextEditingController();
  final _destinationCtrl = TextEditingController();

  String? _condition;
  String? _cargoType;
  String? _urgency;
  String? _packageSize;
  bool _hasError = false; // Track validation error for dots

  static const Map<String, String> conditions = {
    'Brand New': 'Unused, factory-sealed item.',
    'Refurbished': 'Restored, tested, and certified.',
    'Used': 'Previously owned, functional condition.',
  };

  static const Map<String, String> cargoTypes = {
    'Parcel': 'User provides their own packaging',
    'Pallet': 'Stacked bulk goods',
    'Container': 'Large volume shipments',
    'Fragile Goods': 'Handle with extra care',
  };

  static const Map<String, String> urgencies = {
    'Express': 'Faster delivery, higher priority.',
    'Standard': 'Standard delivery, normal priority.',
    'MGR': 'High-priority management delivery.',
  };

  static const Map<String, String> packageSizes = {
    'Document': 'A4-sized paper, lightweight',
    'A3 Nylon Packing': 'Small packets, soft parcels',
    'Size 1': 'Small Box – Approx. 30cm x 30cm x 30cm',
    'Size 2': 'Medium Box – Approx. 50cm x 50cm x 50cm',
    'Size 3': 'Large Box – Approx. 70cm x 70cm x 70cm',
  };

  @override
  void dispose() {
    _nameCtrl.dispose();
    _valueCtrl.dispose();
    _descCtrl.dispose();
    _weightCtrl.dispose();
    _destinationCtrl.dispose();
    super.dispose();
  }

  void _showStationPicker(BuildContext context, bool isDark) async {
    final auth = context.read<AuthProvider>();
    final currentStation = auth.user?.station;
    
    final result = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _StationPickerSheet(excludeStation: currentStation),
    );
    if (result != null) {
      setState(() {
        _destinationCtrl.text = result;
      });
    }
  }

  void _showStepHelp(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => DraggableScrollableSheet(
        initialChildSize: 0.65,
        minChildSize: 0.4,
        maxChildSize: 0.9,
        builder: (ctx, scrollCtrl) => Container(
          decoration: const BoxDecoration(
            color: Color(0xFF0F172A),
            borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
          ),
          child: Column(
            children: [
              const SizedBox(height: 12),
              Center(child: Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(2)))),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(color: const Color(0xFF3B82F6).withValues(alpha: 0.15), shape: BoxShape.circle),
                      child: const HugeIcon(icon: HugeIcons.strokeRoundedInformationCircle, color: Color(0xFF3B82F6), size: 22),
                    ),
                    const Gap(12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Step 1 — Package Details', style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white)),
                        Text('What to fill in here', style: GoogleFonts.inter(fontSize: 13, color: Colors.white38)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView(
                  controller: scrollCtrl,
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
                  children: [
                    _helpRow(HugeIcons.strokeRoundedPackage, 'Item Name', 'Enter the package name or product description, e.g. "Laptop" or "Women Clothes".'),
                    _helpRow(HugeIcons.strokeRoundedWeightScale, 'Weight', 'Enter the weight in kilograms (KG). This is used to calculate the shipping cost.'),
                    _helpRow(HugeIcons.strokeRoundedMoney02, 'Declared Value', 'Enter the market value of the cargo. This is used for insurance reference only.'),
                    _helpRow(HugeIcons.strokeRoundedShippingCenter, 'Destination', 'Select the station where this parcel will be delivered to the receiver.'),
                    _helpRow(HugeIcons.strokeRoundedAnalytics01, 'Condition', 'Select the physical state of the cargo: Brand New, Refurbished, or Used.'),
                    _helpRow(HugeIcons.strokeRoundedDeliveryTruck01, 'Cargo Type', 'Describe the packaging format: Parcel, Pallet, Container, or Fragile Goods.'),
                    _helpRow(HugeIcons.strokeRoundedSpeedTrain02, 'Urgency', 'Standard is the default. Select Express or MGR for priority handling.'),
                    _helpRow(HugeIcons.strokeRoundedPackage, 'Package Size', 'Choose the closest physical size category for the parcel.'),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24, 8, 24, MediaQuery.of(context).padding.bottom + 16),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: FilledButton(
                    onPressed: () => Navigator.pop(ctx),
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF3B82F6),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    ),
                    child: Text('Got it', style: GoogleFonts.inter(fontWeight: FontWeight.w800, color: Colors.white, fontSize: 15)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _helpRow(dynamic icon, String title, String body) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.04), borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.white.withValues(alpha: 0.06))),
            child: HugeIcon(icon: icon, color: const Color(0xFF3B82F6), size: 18),
          ),
          const Gap(14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.outfit(fontWeight: FontWeight.w700, fontSize: 14, color: Colors.white)),
                const Gap(3),
                Text(body, style: GoogleFonts.inter(fontSize: 13, color: Colors.white38, height: 1.5)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showSelectionSheet(
    BuildContext context,
    String title,
    Map<String, String> items,
    String? currentValue,
    ValueChanged<String> onSelect,
    bool isDark,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: isDark ? const Color(0xFF1E293B) : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Gap(12),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: isDark ? Colors.white24 : Colors.black12,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const Gap(16),
              Text(
                title,
                style: GoogleFonts.outfit(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: isDark ? Colors.white : const Color(0xFF1E293B),
                ),
              ),
              const Gap(16),
              ...items.entries.map((e) {
                final isSelected = e.key == currentValue;
                return InkWell(
                  onTap: () {
                    onSelect(e.key);
                    context.pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: isDark ? Colors.white10 : Colors.black.withValues(alpha: 0.05),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.key,
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: isDark ? Colors.white : const Color(0xFF1E293B),
                                ),
                              ),
                              const Gap(4),
                              Text(
                                e.value,
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: isDark ? Colors.white54 : const Color(0xFF64748B),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (isSelected)
                          Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              color: const Color(0xFF3B82F6).withValues(alpha: 0.1),
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.check_circle,
                                size: 28,
                                color: Color(0xFF3B82F6),
                              ),
                            ),
                          )
                        else
                          Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isDark ? Colors.white24 : const Color(0xFFE2E8F0),
                                width: 2,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              }),
              const Gap(32),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSelectionTile(
    String label,
    String? value,
    VoidCallback onTap,
    bool isDark,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E293B) : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isDark ? Colors.white.withValues(alpha: 0.05) : const Color(0xFFE2E8F0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value ?? label,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: value != null ? FontWeight.w600 : FontWeight.w500,
                color: value != null
                    ? (isDark ? Colors.white : const Color(0xFF1E293B))
                    : (isDark ? Colors.white38 : const Color(0xFF94A3B8)),
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: isDark ? Colors.white54 : const Color(0xFF64748B),
            ),
          ],
        ),
      ),
    );
  }

  void _onNext() {
    if (_condition == null ||
        _cargoType == null ||
        _urgency == null ||
        _packageSize == null ||
        _nameCtrl.text.isEmpty ||
        _valueCtrl.text.isEmpty ||
        _weightCtrl.text.isEmpty ||
        _destinationCtrl.text.isEmpty) {
      setState(() => _hasError = true);
      return;
    }
    setState(() => _hasError = false);

    final originStation = context.read<AuthProvider>().user?.station ?? 'Headquarters Central';

    context.push('/operator-receive/receiver', extra: {
      'originStation': originStation,
      'destinationStation': _destinationCtrl.text,
      'packageName': _nameCtrl.text,
      'packageValue': _valueCtrl.text,
      'cargoDescription': _descCtrl.text,
      'weight': _weightCtrl.text,
      'condition': _condition,
      'cargoType': _cargoType,
      'urgency': _urgency,
      'packageSize': _packageSize,
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    

    final canProceed = _condition != null &&
        _cargoType != null &&
        _urgency != null &&
        _packageSize != null &&
        _nameCtrl.text.isNotEmpty &&
        _valueCtrl.text.isNotEmpty &&
        _weightCtrl.text.isNotEmpty &&
        _destinationCtrl.text.isNotEmpty;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
            color: const Color(0xFF0F172A),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => context.pop(),
                  child: const HugeIcon(icon: HugeIcons.strokeRoundedArrowLeft01, color: Colors.white, size: 24),
                ),
                const Gap(16),
                Text(
                  'Package Details',
                  style: GoogleFonts.outfit(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                // Progress Dots
                Row(
                  children: List.generate(3, (index) {
                    final isActive = index == 0; // Step 1
                    return Container(
                      margin: const EdgeInsets.only(right: 4),
                      width: isActive ? 12 : 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: isActive 
                          ? (_hasError ? const Color(0xFFEF4444) : const Color(0xFF3B82F6)) 
                          : Colors.white24,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    );
                  }),
                ),
                const Gap(12),
                GestureDetector(
                  onTap: () => _showStepHelp(context),
                  child: const HugeIcon(icon: HugeIcons.strokeRoundedHelpCircle, color: Colors.white, size: 22),
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
                  
                  Text(
                    'Destination Station',
                    style: GoogleFonts.outfit(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: isDark ? Colors.white : const Color(0xFF1E293B),
                    ),
                  ),
                  const Gap(12),
                  _buildSelectionTile(
                    'Select Destination',
                    _destinationCtrl.text.isEmpty ? null : _destinationCtrl.text,
                    () => _showStationPicker(context, isDark),
                    isDark,
                  ),

                  const Gap(32),

                  Text(
                    'Package Name',
                    style: GoogleFonts.outfit(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: isDark ? Colors.white : const Color(0xFF1E293B),
                    ),
                  ),
                  const Gap(12),
                  Container(
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF1E293B) : Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: isDark ? Colors.white.withValues(alpha: 0.05) : const Color(0xFFE2E8F0),
                        width: 1,
                      ),
                    ),
                    child: TextField(
                      controller: _nameCtrl,
                      onChanged: (v) => setState(() {}),
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: isDark ? Colors.white : const Color(0xFF1E293B),
                      ),
                      decoration: InputDecoration(
                        hintText: 'e.g., Electronics',
                        prefixIcon: Icon(
                          Icons.inventory_2_outlined,
                          size: 20,
                          color: isDark ? Colors.white38 : const Color(0xFF94A3B8),
                        ),
                        hintStyle: GoogleFonts.inter(
                          fontSize: 15,
                          color: isDark ? Colors.white30 : const Color(0xFF94A3B8),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  
                  const Gap(24),
                  
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Declared Value (TZS)',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: isDark ? Colors.white70 : const Color(0xFF475569),
                              ),
                            ),
                            const Gap(8),
                            Container(
                              decoration: BoxDecoration(
                                color: isDark ? const Color(0xFF1E293B) : Colors.white,
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: isDark ? Colors.white.withValues(alpha: 0.05) : const Color(0xFFE2E8F0),
                                  width: 1,
                                ),
                              ),
                              child: TextField(
                                controller: _valueCtrl,
                                keyboardType: TextInputType.number,
                                onChanged: (v) => setState(() {}),
                                style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: isDark ? Colors.white : const Color(0xFF1E293B),
                                ),
                                decoration: InputDecoration(
                                  hintText: '0',
                                  prefixIcon: Icon(
                                    Icons.payments_outlined,
                                    size: 20,
                                    color: isDark ? Colors.white38 : const Color(0xFF94A3B8),
                                  ),
                                  hintStyle: GoogleFonts.inter(
                                    fontSize: 15,
                                    color: isDark ? Colors.white30 : const Color(0xFF94A3B8),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Weight (kg)',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: isDark ? Colors.white70 : const Color(0xFF475569),
                              ),
                            ),
                            const Gap(8),
                            Container(
                              decoration: BoxDecoration(
                                color: isDark ? const Color(0xFF1E293B) : Colors.white,
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: isDark ? Colors.white.withValues(alpha: 0.05) : const Color(0xFFE2E8F0),
                                  width: 1,
                                ),
                              ),
                              child: TextField(
                                controller: _weightCtrl,
                                keyboardType: TextInputType.number,
                                onChanged: (v) => setState(() {}),
                                style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: isDark ? Colors.white : const Color(0xFF1E293B),
                                ),
                                decoration: InputDecoration(
                                  hintText: 'e.g., 2.5',
                                  prefixIcon: Icon(
                                    Icons.scale_outlined,
                                    size: 20,
                                    color: isDark ? Colors.white38 : const Color(0xFF94A3B8),
                                  ),
                                  hintStyle: GoogleFonts.inter(
                                    fontSize: 15,
                                    color: isDark ? Colors.white30 : const Color(0xFF94A3B8),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const Gap(32),
                  Text(
                    'Specifications',
                    style: GoogleFonts.outfit(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: isDark ? Colors.white : const Color(0xFF1E293B),
                    ),
                  ),
                  const Gap(16),
                  
                  Text(
                    'Condition',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: isDark ? Colors.white70 : const Color(0xFF475569),
                    ),
                  ),
                  const Gap(8),
                  _buildSelectionTile(
                    'Select Condition',
                    _condition,
                    () => _showSelectionSheet(context, 'Condition', conditions, _condition, (v) => setState(() => _condition = v), isDark),
                    isDark,
                  ),
                  
                  const Gap(16),
                  Text(
                    'Cargo Type',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: isDark ? Colors.white70 : const Color(0xFF475569),
                    ),
                  ),
                  const Gap(8),
                  _buildSelectionTile(
                    'Select Cargo Type',
                    _cargoType,
                    () => _showSelectionSheet(context, 'Cargo Type', cargoTypes, _cargoType, (v) => setState(() => _cargoType = v), isDark),
                    isDark,
                  ),
                  
                  const Gap(16),
                  Text(
                    'Urgency',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: isDark ? Colors.white70 : const Color(0xFF475569),
                    ),
                  ),
                  const Gap(8),
                  _buildSelectionTile(
                    'Select Urgency',
                    _urgency,
                    () => _showSelectionSheet(context, 'Urgency', urgencies, _urgency, (v) => setState(() => _urgency = v), isDark),
                    isDark,
                  ),
                  
                  const Gap(16),
                  Text(
                    'Package Size',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: isDark ? Colors.white70 : const Color(0xFF475569),
                    ),
                  ),
                  const Gap(8),
                  _buildSelectionTile(
                    'Select Package Size',
                    _packageSize,
                    () => _showSelectionSheet(context, 'Package Size', packageSizes, _packageSize, (v) => setState(() => _packageSize = v), isDark),
                    isDark,
                  ),
                  
                  const Gap(24),
                  Text(
                    'Cargo Description (Optional)',
                    style: GoogleFonts.outfit(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: isDark ? Colors.white : const Color(0xFF1E293B),
                    ),
                  ),
                  const Gap(12),
                  Container(
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF1E293B) : Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: isDark ? Colors.white.withValues(alpha: 0.05) : const Color(0xFFE2E8F0),
                        width: 1,
                      ),
                    ),
                    child: TextField(
                      controller: _descCtrl,
                      maxLines: 3,
                      onChanged: (v) => setState(() {}),
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: isDark ? Colors.white : const Color(0xFF1E293B),
                      ),
                      decoration: InputDecoration(
                        hintText: 'Enter description (optional)',
                        hintStyle: GoogleFonts.inter(
                          fontSize: 15,
                          color: isDark ? Colors.white30 : const Color(0xFF94A3B8),
                        ),
                        contentPadding: const EdgeInsets.all(16),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Bottom Bar
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
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: canProceed ? _onNext : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3B82F6),
                  disabledBackgroundColor: isDark ? Colors.white12 : const Color(0xFFE2E8F0),
                  foregroundColor: Colors.white,
                  disabledForegroundColor: isDark ? Colors.white38 : const Color(0xFF94A3B8),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Continue to Receiver Details',
                      style: GoogleFonts.outfit(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Gap(8),
                    const HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01, color: Colors.white, size: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

// ─── Station Picker Sheet ─────────────────────────────────────────────────────

class _StationPickerSheet extends StatefulWidget {
  final String? excludeStation;
  const _StationPickerSheet({this.excludeStation});

  @override
  State<_StationPickerSheet> createState() => _StationPickerSheetState();
}

class _StationPickerSheetState extends State<_StationPickerSheet> {
  final _searchCtrl = TextEditingController();
  
  static const List<String> _allStations = [
    // Phase I (Dar es Salaam – Morogoro)
    'Dar es Salaam (John Magufuli Station)',
    'Pugu',
    'Soga',
    'Ruvu',
    'Ngerengere',
    'Morogoro (Jakaya Kikwete Station)',
    
    // Phase II (Morogoro – Dodoma – Makutopora)
    'Mkata',
    'Kilosa',
    'Kidete',
    'Gulwe',
    'Igunda',
    'Dodoma Station (Samia Suluhu Station)',
    'Makutopora Station',
  ];

  late List<String> _filtered;

  @override
  void initState() {
    super.initState();
    _filtered = _allStations
        .where((s) => s != widget.excludeStation)
        .toList();
  }

  void _onSearch(String q) {
    setState(() {
      _filtered = _allStations
          .where((s) => s != widget.excludeStation)
          .where((s) => s.toLowerCase().contains(q.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E293B) : Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        children: [
          const Gap(12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: isDark ? Colors.white12 : Colors.black12,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const Gap(24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Text(
                  'Destination Station',
                  style: GoogleFonts.outfit(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: isDark ? Colors.white : const Color(0xFF1E293B),
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.close_rounded,
                    color: isDark ? Colors.white54 : const Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),
          const Gap(16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isDark ? Colors.white.withValues(alpha: 0.05) : const Color(0xFFE2E8F0),
                ),
              ),
              child: Row(
                children: [
                  const Gap(12),
                  const Icon(Icons.search_rounded, color: Color(0xFF3B82F6), size: 20),
                  const Gap(8),
                  Expanded(
                    child: TextField(
                      controller: _searchCtrl,
                      onChanged: _onSearch,
                      style: GoogleFonts.inter(
                        color: isDark ? Colors.white : const Color(0xFF1E293B),
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Search for a station...',
                        hintStyle: GoogleFonts.inter(
                          color: isDark ? Colors.white24 : const Color(0xFF94A3B8),
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Gap(16),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _filtered.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    onTap: () => Navigator.pop(context, _filtered[i]),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF3B82F6).withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const HugeIcon(icon: HugeIcons.strokeRoundedShippingCenter, size: 20, color: Color(0xFF3B82F6)),
                    ),
                    title: Text(
                      _filtered[i],
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        color: isDark ? Colors.white : const Color(0xFF1E293B),
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 14,
                      color: isDark ? Colors.white24 : const Color(0xFFCBD5E1),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
