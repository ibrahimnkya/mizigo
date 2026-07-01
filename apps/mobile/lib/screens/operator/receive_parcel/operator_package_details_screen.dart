import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../../providers/auth_provider.dart';
import '../../../services/api_service.dart';
import '../../../theme/app_theme.dart';

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
  String? _destinationStationId;

  String? _condition;
  String? _parcelType; // Renamed for naming consistency
  String? _urgency;
  String? _packageSize;
  bool _hasError = false; // Track validation error for dots

  bool _includeAdditionalServices = false;
  final Set<String> _selectedServices = {};

  late Map<String, String> _apiConditions = Map.from(conditions);
  late Map<String, String> _apiParcelTypes = Map.from(parcelTypes);
  late Map<String, String> _apiPackageSizes = Map.from(packageSizes);
  late Map<String, String> _apiUrgencies = Map.from(urgencies);

  static final List<Map<String, dynamic>> additionalServicesList = [
    {
      'id': 'insurance',
      'name': 'Cargo Insurance',
      'price': 3000.0,
      'description': 'Protection against loss, damage, or theft',
      'icon': HugeIcons.strokeRoundedShield01,
    },
    {
      'id': 'packaging',
      'name': 'Secure Packaging',
      'price': 2000.0,
      'description': 'Bubble wrap, secure box sealing, or nylon packing',
      'icon': HugeIcons.strokeRoundedPackage,
    },
    {
      'id': 'fragile',
      'name': 'Special Handling',
      'price': 2500.0,
      'description': 'Priority placement, fragile sticker and padding',
      'icon': HugeIcons.strokeRoundedAlertCircle,
    },
  ];

  static const Map<String, String> conditions = {
    'Brand New': 'Unused, factory-sealed item.',
    'Refurbished': 'Restored, tested, and certified.',
    'Used': 'Previously owned, functional condition.',
  };

  static const Map<String, String> parcelTypes = { // Renamed from parcelTypes
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
    
    final result = await showModalBottomSheet<dynamic>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _StationPickerSheet(excludeStation: currentStation),
    );
    if (result != null && result is Map) {
      setState(() {
        _destinationCtrl.text = result['name']?.toString() ?? '';
        _destinationStationId = result['id']?.toString();
      });
    }
  }

  void _showStepHelp(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => DraggableScrollableSheet(
        initialChildSize: 0.65,
        minChildSize: 0.4,
        maxChildSize: 0.9,
        builder: (ctx, scrollCtrl) => Container(
          decoration: BoxDecoration(
            color: AppTheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
            border: Border(
              top: BorderSide(color: AppTheme.border),
              left: BorderSide(color: AppTheme.border),
              right: BorderSide(color: AppTheme.border),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 12),
              Center(child: Container(width: 40, height: 4, decoration: BoxDecoration(color: AppTheme.border, borderRadius: BorderRadius.circular(2)))),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(color: AppTheme.accent.withValues(alpha: 0.15), shape: BoxShape.circle),
                      child: HugeIcon(icon: HugeIcons.strokeRoundedInformationCircle, color: AppTheme.accent, size: 22),
                    ),
                    const Gap(12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Step 1 — Package Details', style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w800, color: AppTheme.textPrimary)),
                        Text('What to fill in here', style: GoogleFonts.inter(fontSize: 13, color: AppTheme.textSecondary)),
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
                    _helpRow(HugeIcons.strokeRoundedCoins01, 'Declared Value', 'Enter the market value of the parcel. This is used for insurance reference only.'),
                    _helpRow(HugeIcons.strokeRoundedShippingCenter, 'Destination', 'Select the station where this parcel will be delivered to the receiver.'),
                    _helpRow(HugeIcons.strokeRoundedAnalytics01, 'Condition', 'Select the physical state of the parcel: Brand New, Refurbished, or Used.'),
                    _helpRow(HugeIcons.strokeRoundedDeliveryTruck01, 'Parcel Type', 'Describe the packaging format: Parcel, Pallet, Container, or Fragile Goods.'),
                    _helpRow(HugeIcons.strokeRoundedSpeedTrain02, 'Delivery Priority', 'Standard is the default. Select Express or MGR for priority handling.'),
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
                      backgroundColor: AppTheme.cPrimary,
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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppTheme.background, 
              borderRadius: BorderRadius.circular(12), 
              border: Border.all(color: AppTheme.border),
            ),
            child: HugeIcon(icon: icon, color: AppTheme.accent, size: 18),
          ),
          const Gap(14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.outfit(fontWeight: FontWeight.w700, fontSize: 14, color: AppTheme.textPrimary)),
                const Gap(3),
                Text(body, style: GoogleFonts.inter(fontSize: 13, color: AppTheme.textSecondary, height: 1.5)),
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
                  color: AppTheme.border,
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
                          color: AppTheme.border,
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
                              color: AppTheme.accent.withValues(alpha: 0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.check_circle,
                                size: 28,
                                color: AppTheme.accent,
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
    bool isDark,
  ) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        decoration: BoxDecoration(
          color: theme.cardTheme.color ?? theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: theme.colorScheme.outline,
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
                    ? theme.textTheme.bodyLarge?.color
                    : theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
            ),
          ],
        ),
      ),
    );
  }

  void _showAdditionalServicesModal(BuildContext context, bool isDark) {
    final theme = Theme.of(context);
    showModalBottomSheet(
      context: context,
      backgroundColor: theme.cardTheme.color ?? theme.colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom + 24,
                left: 24,
                right: 24,
                top: 12,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.outline,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const Gap(24),
                  Text(
                    'Additional Services',
                    style: GoogleFonts.outfit(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: theme.textTheme.bodyLarge?.color,
                    ),
                  ),
                  const Gap(8),
                  Text(
                    'Select extra services to include for this shipment.',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.7),
                    ),
                  ),
                  const Gap(24),
                  ...additionalServicesList.map((service) {
                    final id = service['id'] as String;
                    final name = service['name'] as String;
                    final price = service['price'] as double;
                    final description = service['description'] as String;
                    final icon = service['icon'];
                    final isSelected = _selectedServices.contains(id);

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Material(
                        color: theme.scaffoldBackgroundColor,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: BorderSide(
                            color: isSelected
                                ? theme.colorScheme.primary
                                : theme.colorScheme.outline,
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: CheckboxListTile(
                            value: isSelected,
                            onChanged: (val) {
                              setModalState(() {
                                if (val == true) {
                                  _selectedServices.add(id);
                                } else {
                                  _selectedServices.remove(id);
                                }
                              });
                              setState(() {});
                            },
                            title: Row(
                              children: [
                                HugeIcon(
                                  icon: icon,
                                  color: isSelected
                                      ? theme.colorScheme.primary
                                      : theme.textTheme.bodySmall?.color?.withValues(alpha: 0.5),
                                  size: 20,
                                ),
                                const Gap(12),
                                Text(
                                  name,
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: theme.textTheme.bodyLarge?.color),
                                ),
                              ],
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(left: 32, top: 4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    description,
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
                                    ),
                                  ),
                                  const Gap(4),
                                  Text(
                                    '+ TZS ${NumberFormat('#,###').format(price)}',
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.success,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            controlAffinity: ListTileControlAffinity.trailing,
                            activeColor: theme.colorScheme.primary,
                            checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          ),
                        ),
                      ),
                    );
                  }),
                  const Gap(16),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: FilledButton(
                      onPressed: () => Navigator.pop(context),
                      style: FilledButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      ),
                      child: Text(
                        'Apply Services (${_selectedServices.length})',
                        style: GoogleFonts.inter(fontWeight: FontWeight.w800, color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _onNext() {
    if (_condition == null ||
        _parcelType == null ||
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
    final originStationId = context.read<AuthProvider>().user?.stationId ?? '01KPWEWYACW1NRAFBTTGFRSKYS';

    context.push('/operator-receive/receiver', extra: {
      'originStation': originStation,
      'originStationId': originStationId,
      'destinationStation': _destinationCtrl.text,
      'destinationStationId': _destinationStationId,
      'packageName': _nameCtrl.text,
      'packageValue': _valueCtrl.text,
      'parcelDescription': _descCtrl.text,
      'weight': _weightCtrl.text,
      'condition': _condition,
      'parcelType': _parcelType,
      'urgency': _urgency,
      'packageSize': _packageSize,
      'additionalServices': _selectedServices.toList(),
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final appBarTheme = theme.appBarTheme;
    final appBarBgColor = appBarTheme.backgroundColor ?? theme.primaryColor;
    final appBarTextColor = appBarTheme.titleTextStyle?.color ?? Colors.white;
    final appBarIconColor = appBarTheme.iconTheme?.color ?? Colors.white;

    final canProceed = _condition != null &&
        _parcelType != null &&
        _urgency != null &&
        _packageSize != null &&
        _nameCtrl.text.isNotEmpty &&
        _valueCtrl.text.isNotEmpty &&
        _weightCtrl.text.isNotEmpty &&
        _destinationCtrl.text.isNotEmpty;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
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
            color: appBarBgColor,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => context.pop(),
                  child: HugeIcon(icon: HugeIcons.strokeRoundedArrowLeft01, color: appBarIconColor, size: 24),
                ),
                const Gap(16),
                Text(
                  'Parcel Details',
                  style: GoogleFonts.outfit(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: appBarTextColor,
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
                          ? (_hasError ? theme.colorScheme.error : theme.colorScheme.secondary) 
                          : appBarTextColor.withValues(alpha: 0.24),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    );
                  }),
                ),
                const Gap(12),
                GestureDetector(
                  onTap: () => _showStepHelp(context),
                  child: HugeIcon(icon: HugeIcons.strokeRoundedHelpCircle, color: appBarIconColor, size: 22),
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
                      color: theme.textTheme.bodyLarge?.color,
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
                    'Parcel Name',
                    style: GoogleFonts.outfit(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: theme.textTheme.bodyLarge?.color,
                    ),
                  ),
                  const Gap(12),
                  Container(
                    decoration: BoxDecoration(
                      color: theme.cardTheme.color ?? theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: theme.colorScheme.outline,
                        width: 1,
                      ),
                    ),
                    child: TextField(
                      controller: _nameCtrl,
                      onChanged: (v) => setState(() {}),
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: theme.textTheme.bodyLarge?.color,
                      ),
                      decoration: InputDecoration(
                        hintText: 'e.g., Electronics',
                        prefixIcon: Icon(
                          Icons.inventory_2_outlined,
                          size: 20,
                          color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.5),
                        ),
                        hintStyle: GoogleFonts.inter(
                          fontSize: 15,
                          color: theme.hintColor.withValues(alpha: 0.5),
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
                                color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.8),
                              ),
                            ),
                            const Gap(8),
                            Container(
                              decoration: BoxDecoration(
                                color: theme.cardTheme.color ?? theme.colorScheme.surface,
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: theme.colorScheme.outline,
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
                                  color: theme.textTheme.bodyLarge?.color,
                                ),
                                decoration: InputDecoration(
                                  hintText: '0',
                                  prefixIcon: Icon(
                                    Icons.monetization_on_outlined,
                                    size: 20,
                                    color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.5),
                                  ),
                                  hintStyle: GoogleFonts.inter(
                                    fontSize: 15,
                                    color: theme.hintColor.withValues(alpha: 0.5),
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
                                color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.8),
                              ),
                            ),
                            const Gap(8),
                            Container(
                              decoration: BoxDecoration(
                                color: theme.cardTheme.color ?? theme.colorScheme.surface,
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: theme.colorScheme.outline,
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
                                  color: theme.textTheme.bodyLarge?.color,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'e.g., 2.5',
                                  prefixIcon: Icon(
                                    Icons.scale_outlined,
                                    size: 20,
                                    color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.5),
                                  ),
                                  hintStyle: GoogleFonts.inter(
                                    fontSize: 15,
                                    color: theme.hintColor.withValues(alpha: 0.5),
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
                      color: theme.textTheme.bodyLarge?.color,
                    ),
                  ),
                  const Gap(16),
                  
                  Text(
                    'Parcel Condition',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.8),
                    ),
                  ),
                  const Gap(8),
                  _buildSelectionTile(
                    'Select Parcel Condition',
                    _condition,
                    () => _showSelectionSheet(context, 'Parcel Condition', _apiConditions, _condition, (v) => setState(() => _condition = v), isDark),
                    isDark,
                  ),
                  
                  const Gap(16),
                  Text(
                    'Parcel Type',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.8),
                    ),
                  ),
                  const Gap(8),
                  _buildSelectionTile(
                    'Select Parcel Type',
                    _parcelType,
                    () => _showSelectionSheet(context, 'Parcel Type', _apiParcelTypes, _parcelType, (v) => setState(() => _parcelType = v), isDark),
                    isDark,
                  ),
                  
                  const Gap(16),
                  Text(
                    'Delivery Priority',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.8),
                    ),
                  ),
                  const Gap(8),
                  _buildSelectionTile(
                    'Select Delivery Priority',
                    _urgency,
                    () => _showSelectionSheet(context, 'Delivery Priority', _apiUrgencies, _urgency, (v) => setState(() => _urgency = v), isDark),
                    isDark,
                  ),
                  
                  const Gap(16),
                  Text(
                    'Package Size',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.8),
                    ),
                  ),
                  const Gap(8),
                  _buildSelectionTile(
                    'Select Package Size',
                    _packageSize,
                    () => _showSelectionSheet(context, 'Package Size', _apiPackageSizes, _packageSize, (v) => setState(() => _packageSize = v), isDark),
                    isDark,
                  ),
                             const Gap(24),
                  Material(
                    color: theme.cardTheme.color ?? theme.colorScheme.surface,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                      side: BorderSide(
                        color: theme.colorScheme.outline,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
                      child: Column(
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: CheckboxListTile(
                              value: _includeAdditionalServices,
                              activeColor: theme.colorScheme.primary,
                              checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                              onChanged: (val) {
                                setState(() {
                                  _includeAdditionalServices = val ?? false;
                                  if (_includeAdditionalServices) {
                                    _showAdditionalServicesModal(context, isDark);
                                  } else {
                                    _selectedServices.clear();
                                  }
                                });
                              },
                              title: Text(
                                'Additional Services',
                                style: GoogleFonts.outfit(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: theme.textTheme.bodyLarge?.color,
                                ),
                              ),
                              subtitle: Text(
                                'Cargo Insurance, packaging, special handling etc.',
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.5),
                                ),
                              ),
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                            ),
                          ),
                          if (_includeAdditionalServices && _selectedServices.isNotEmpty) ...[
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                              child: Divider(color: theme.dividerColor, height: 1),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${_selectedServices.length} service(s) configured',
                                    style: GoogleFonts.inter(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: AppTheme.success,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () => _showAdditionalServicesModal(context, isDark),
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      minimumSize: Size.zero,
                                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    child: Text(
                                      'Configure',
                                      style: GoogleFonts.inter(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: theme.colorScheme.primary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),

                  const Gap(24),
                  Text(
                    'Parcel Description (Optional)',
                    style: GoogleFonts.outfit(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: theme.textTheme.bodyLarge?.color,
                    ),
                  ),
                  const Gap(12),
                  Container(
                    decoration: BoxDecoration(
                      color: theme.cardTheme.color ?? theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: theme.colorScheme.outline,
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
                        color: theme.textTheme.bodyLarge?.color,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Enter description (optional)',
                        hintStyle: GoogleFonts.inter(
                          fontSize: 15,
                          color: theme.hintColor.withValues(alpha: 0.5),
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
              color: theme.cardTheme.color ?? theme.colorScheme.surface,
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
                  backgroundColor: theme.colorScheme.primary,
                  disabledBackgroundColor: theme.disabledColor.withValues(alpha: 0.1),
                  foregroundColor: Colors.white,
                  disabledForegroundColor: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.5),
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
  List<dynamic> _allStations = [];
  List<dynamic> _filtered = [];
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchStations();
  }

  Future<void> _fetchStations() async {
    try {
      final list = await ApiService.getStations();
      if (mounted) {
        setState(() {
          _allStations = list;
          _filtered = list.where((s) => !_shouldExclude(s['name']?.toString() ?? '', widget.excludeStation)).toList();
          _loading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _loading = false;
        });
      }
    }
  }

  bool _shouldExclude(String stationName, String? exclude) {
    if (exclude == null || exclude.isEmpty) return false;
    final sNormalized = stationName.toLowerCase();
    final eNormalized = exclude.toLowerCase();
    
    // Exact match
    if (sNormalized == eNormalized) return true;
    
    // If one contains the other
    if (sNormalized.contains(eNormalized) || eNormalized.contains(sNormalized)) return true;
    
    // Short prefix matching (e.g. "moro" matches "Morogoro", "dsm" matches "Dar es Salaam", "dom" matches "Dodoma")
    if (eNormalized.startsWith('moro') && sNormalized.startsWith('moro')) return true;
    if (eNormalized.startsWith('dsm') && sNormalized.startsWith('dar')) return true;
    if (eNormalized.startsWith('dom') && sNormalized.startsWith('dodoma')) return true;
    if (sNormalized.startsWith('moro') && eNormalized.startsWith('moro')) return true;
    if (sNormalized.startsWith('dsm') && eNormalized.startsWith('dar')) return true;
    if (sNormalized.startsWith('dom') && eNormalized.startsWith('dodoma')) return true;
    
    return false;
  }

  void _onSearch(String q) {
    setState(() {
      _filtered = _allStations
          .where((s) => !_shouldExclude(s['name']?.toString() ?? '', widget.excludeStation))
          .where((s) =>
              (s['name']?.toString() ?? '').toLowerCase().contains(q.toLowerCase()) ||
              (s['code']?.toString() ?? '').toLowerCase().contains(q.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
        border: Border(
          top: BorderSide(color: AppTheme.border),
          left: BorderSide(color: AppTheme.border),
          right: BorderSide(color: AppTheme.border),
        ),
      ),
      child: Column(
        children: [
          const Gap(12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppTheme.border,
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
                    color: AppTheme.textPrimary,
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
                color: AppTheme.background,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppTheme.border,
                ),
              ),
              child: Row(
                children: [
                  const Gap(12),
                  Icon(Icons.search_rounded, color: AppTheme.accent, size: 20),
                  const Gap(8),
                  Expanded(
                    child: TextField(
                      controller: _searchCtrl,
                      onChanged: _onSearch,
                      style: GoogleFonts.inter(
                        color: AppTheme.textPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Search for a station...',
                        hintStyle: GoogleFonts.inter(
                          color: AppTheme.textMuted,
                        ),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
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
            child: _loading
                ? Center(child: CircularProgressIndicator(color: AppTheme.cPrimary))
                : _error != null
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Text(
                            'Error loading stations: $_error',
                            style: GoogleFonts.inter(color: Colors.red),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : _filtered.isEmpty
                        ? Center(
                            child: Text(
                              'No stations found',
                              style: GoogleFonts.inter(
                                color: AppTheme.textSecondary,
                              ),
                            ),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            itemCount: _filtered.length,
                            itemBuilder: (context, i) {
                              final station = _filtered[i];
                              final name = station['name']?.toString() ?? '';
                              final code = station['code']?.toString() ?? '';
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: ListTile(
                                  onTap: () => Navigator.pop(context, station),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                                  leading: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: AppTheme.accent.withValues(alpha: 0.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: HugeIcon(
                                        icon: HugeIcons.strokeRoundedShippingCenter,
                                        size: 20,
                                        color: AppTheme.accent),
                                  ),
                                  title: Text(
                                    name,
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      color: AppTheme.textPrimary,
                                    ),
                                  ),
                                  subtitle: Text(
                                    code,
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      color: AppTheme.textSecondary,
                                    ),
                                  ),
                                  trailing: HugeIcon(
                                    icon: HugeIcons.strokeRoundedArrowRight01,
                                    size: 14,
                                    color: AppTheme.textMuted,
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
