import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../theme/app_theme.dart';
import '../../services/api_service.dart';

class PackageDetailsScreen extends StatefulWidget {
  final String pickup;
  final String delivery;
  final String vehicle;
  final int basePrice;

  const PackageDetailsScreen({
    super.key,
    required this.pickup,
    required this.delivery,
    required this.vehicle,
    required this.basePrice,
  });

  @override
  State<PackageDetailsScreen> createState() => _PackageDetailsScreenState();
}

class _PackageDetailsScreenState extends State<PackageDetailsScreen> {
  final _nameCtrl = TextEditingController();
  final _valueCtrl = TextEditingController();
  final _descCtrl = TextEditingController();

  String? _condition;
  String? _parcelType;
  String? _urgency;
  String? _packageSize;

  late Map<String, String> _apiConditions = Map.from(conditions);
  late Map<String, String> _apiParcelTypes = Map.from(parcelTypes);
  late Map<String, String> _apiPackageSizes = Map.from(packageSizes);
  late Map<String, String> _apiUrgencies = Map.from(urgencies);

  @override
  void initState() {
    super.initState();
    _loadParameters();
  }

  Future<void> _loadParameters() async {
    try {
      final data = await ApiService.getParcelParameters();
      if (mounted) {
        setState(() {
          _apiConditions = data['parcelConditions']!;
          _apiParcelTypes = data['parcelTypes']!;
          _apiPackageSizes = data['packageSizes']!;
          if (data.containsKey('deliveryPriorities')) {
            _apiUrgencies = data['deliveryPriorities']!;
          }
        });
      }
    } catch (_) {
      // Keep static defaults if call fails
    }
  }

  static const Map<String, String> conditions = {
    'Brand New': 'Unused, factory-sealed item.',
    'Refurbished': 'Restored, tested, and certified.',
    'Used': 'Previously owned, functional condition.',
  };

  static const Map<String, String> parcelTypes = {
    'Parcel': 'User provides their own packaging',
    'Pallet': 'Stacked bulk goods',
    'Container': 'Large volume shipments',
    'Fragile Goods': 'Handle with extra care',
  };

  static const Map<String, String> urgencies = {
    'Express': 'High-priority, same-day or next-day delivery',
    'Standard': 'Regular ground delivery service',
    'MGR': 'Mizigo Golden Route - scheduled premium service',
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
    super.dispose();
  }

  void _showSelectionSheet(
    BuildContext context,
    String title,
    Map<String, String> items,
    String? currentValue,
    ValueChanged<String> onSelect,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.surface,
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
                  color: AppTheme.textPrimary,
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
                          color: AppTheme.border.withValues(alpha: 0.2),
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
                                  color: AppTheme.textPrimary,
                                ),
                              ),
                              const Gap(4),
                              Text(
                                e.value,
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: AppTheme.textSecondary,
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
                              color: AppTheme.primary.withValues(alpha: 0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.check_circle,
                                size: 28,
                                color: AppTheme.primary,
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
                                color: AppTheme.border,
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
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: AppTheme.border,
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
                color: value != null ? AppTheme.textPrimary : AppTheme.textMuted,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppTheme.textSecondary,
            ),
          ],
        ),
      ),
    );
  }

  void _onNext() {
    if (_condition == null ||
        _parcelType == null ||
        _urgency == null ||
        _packageSize == null ||
        _nameCtrl.text.isEmpty ||
        _valueCtrl.text.isEmpty) {
      return;
    }
    
    context.push('/send-package/receiver', extra: {
      'pickup': widget.pickup,
      'delivery': widget.delivery,
      'vehicle': widget.vehicle,
      'price': widget.basePrice,
      'packageName': _nameCtrl.text,
      'packageValue': _valueCtrl.text,
      'parcelDescription': _descCtrl.text,
      'condition': _condition,
      'parcelType': _parcelType,
      'urgency': _urgency,
      'packageSize': _packageSize,
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final canProceed = _condition != null &&
        _parcelType != null &&
        _urgency != null &&
        _packageSize != null &&
        _nameCtrl.text.isNotEmpty &&
        _valueCtrl.text.isNotEmpty;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppTheme.background,
        body: Column(
          children: [
            // Header
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 14,
                bottom: 18,
                left: 20,
                right: 20,
              ),
              color: AppTheme.primary,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: const HugeIcon(
                      icon: HugeIcons.strokeRoundedArrowLeft01,
                      color: Colors.white,
                      size: 24,
                    ),
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
                      'Package Name',
                      style: GoogleFonts.outfit(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    const Gap(12),
                    Container(
                      decoration: BoxDecoration(
                        color: AppTheme.surface,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: AppTheme.border,
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        controller: _nameCtrl,
                        onChanged: (v) => setState(() {}),
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.textPrimary,
                        ),
                        decoration: InputDecoration(
                          hintText: 'e.g., Electronics',
                          prefixIcon: Icon(
                            Icons.inventory_2_outlined,
                            size: 20,
                            color: AppTheme.textMuted,
                          ),
                          hintStyle: GoogleFonts.inter(
                            fontSize: 15,
                            color: AppTheme.textMuted,
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    
                    const Gap(24),
                    Text(
                      'Package Value (TZS)',
                      style: GoogleFonts.outfit(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    const Gap(12),
                    Container(
                      decoration: BoxDecoration(
                        color: AppTheme.surface,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: AppTheme.border,
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
                          color: AppTheme.textPrimary,
                        ),
                        decoration: InputDecoration(
                          hintText: '0',
                          prefixIcon: Icon(
                            Icons.monetization_on_outlined,
                            size: 20,
                            color: AppTheme.textMuted,
                          ),
                          hintStyle: GoogleFonts.inter(
                            fontSize: 15,
                            color: AppTheme.textMuted,
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    
                    const Gap(24),
                    Text(
                      'Specifications',
                      style: GoogleFonts.outfit(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    const Gap(16),
                    
                    Text(
                      'Parcel Condition',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                    const Gap(8),
                    _buildSelectionTile(
                      'Select Parcel Condition',
                      _condition,
                      () => _showSelectionSheet(context, 'Parcel Condition', _apiConditions, _condition, (v) => setState(() => _condition = v)),
                    ),
                    
                    const Gap(16),
                    Text(
                      'Parcel Type',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                    const Gap(8),
                    _buildSelectionTile(
                      'Select Parcel Type',
                      _parcelType,
                      () => _showSelectionSheet(context, 'Parcel Type', _apiParcelTypes, _parcelType, (v) => setState(() => _parcelType = v)),
                    ),
                    
                    const Gap(16),
                    Text(
                      'Delivery Priority',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                    const Gap(8),
                    _buildSelectionTile(
                      'Select Delivery Priority',
                      _urgency,
                      () => _showSelectionSheet(context, 'Delivery Priority', _apiUrgencies, _urgency, (v) => setState(() => _urgency = v)),
                    ),
                    
                    const Gap(16),
                    Text(
                      'Package Size',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                    const Gap(8),
                    _buildSelectionTile(
                      'Select Package Size',
                      _packageSize,
                      () => _showSelectionSheet(context, 'Package Size', _apiPackageSizes, _packageSize, (v) => setState(() => _packageSize = v)),
                    ),
                    
                    const Gap(24),
                    Text(
                      'Parcel Description (Optional)',
                      style: GoogleFonts.outfit(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    const Gap(12),
                    Container(
                      decoration: BoxDecoration(
                        color: AppTheme.surface,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: AppTheme.border,
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
                          color: AppTheme.textPrimary,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Enter description (optional)',
                          hintStyle: GoogleFonts.inter(
                            fontSize: 15,
                            color: AppTheme.textMuted,
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
                color: AppTheme.surface,
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
                    backgroundColor: AppTheme.primary,
                    disabledBackgroundColor: isDark ? Colors.white12 : const Color(0xFFE2E8F0),
                    foregroundColor: Colors.white,
                    disabledForegroundColor: isDark ? Colors.white38 : const Color(0xFF94A3B8),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Next',
                    style: GoogleFonts.outfit(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
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
}
