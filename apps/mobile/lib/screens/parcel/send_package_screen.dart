import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:go_router/go_router.dart';
import '../../theme/app_theme.dart';

final _vehicles = [
  {
    'name': 'Bodaboda',
    'description': 'Perfect for small items like pallets, docum...',
    'dimensions': '0.4 x 0.4 x 0.4 Meter',
    'weight': 'Up to 20kg',
    'image': 'assets/images/vehicle_bodaboda.png',
    'price': 15000,
  },
  {
    'name': 'Small Vehicle',
    'description': 'Perfect for small home appliances, and medium size items',
    'dimensions': '1 x 1 x 1 Meter',
    'weight': 'Up to 150kg',
    'image': 'assets/images/vehicle_small.png',
    'price': 30000,
  },
  {
    'name': 'Minivan / Kirikuu',
    'description': 'Perfect for small home appliances, and medium size items',
    'dimensions': '1.5 x 1.2 x 1.2 Meter',
    'weight': 'Up to 300kg',
    'image': 'assets/images/vehicle_minivan.png',
    'price': 50000,
  },
  {
    'name': 'Canter/Fuso',
    'description': 'Perfect for small home appliances, and medium size items',
    'dimensions': '2.8 x 2 x 2 Meter',
    'weight': 'Up to 5,000kg',
    'image': 'assets/images/vehicle_canter.png',
    'price': 80000,
  },
  {
    'name': 'Large Truck',
    'description': 'Perfect for large factory to factory deliveries',
    'dimensions': '4.2 x 3 x 3 Meter',
    'weight': 'Up to 10,000kg',
    'image': 'assets/images/vehicle_truck.png',
    'price': 120000,
  },
];

class SendPackageScreen extends StatefulWidget {
  final String deliverySpeed;
  final bool lastMileDelivery;

  const SendPackageScreen({
    super.key,
    this.deliverySpeed = 'standard',
    this.lastMileDelivery = false,
  });

  @override
  State<SendPackageScreen> createState() => _SendPackageScreenState();
}

class _SendPackageScreenState extends State<SendPackageScreen> {
  String _pickupLocation = 'Pick-up location';
  String _deliveryLocation = 'Delivery location';
  String? _selectedVehicle;
  int _selectedHelpers = 0; // Default to 'Driver only' or first option

  static const List<String> _helperVehicles = [
    'Minivan / Kirikuu',
    'Canter/Fuso',
    'Large Truck',
  ];

  bool get _locationsSet =>
      !_pickupLocation.contains('location') &&
      !_deliveryLocation.contains('location');

  int get _extraCost {
    if (_selectedVehicle == null) return 0;
    if (_selectedVehicle == 'Bodaboda') {
      return _selectedHelpers == 1 ? 40000 : 0;
    }
    // Helpers logic for other vehicles
    if (!_helperVehicles.contains(_selectedVehicle)) return 0;
    return (_selectedHelpers + 1) * 20000;
  }

  int get _totalPrice {
    if (_selectedVehicle == null) return 0;
    final vehicle = _vehicles.firstWhere(
      (v) => v['name'] == _selectedVehicle,
      orElse: () => _vehicles.first,
    );
    return (vehicle['price'] as int) + _extraCost;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appBarTheme = theme.appBarTheme;
    final appBarBgColor = appBarTheme.backgroundColor ?? theme.primaryColor;
    final appBarTextColor = appBarTheme.titleTextStyle?.color ?? Colors.white;
    final appBarIconColor = appBarTheme.iconTheme?.color ?? Colors.white;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: Column(
        children: [
          // Header
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 16,
              bottom: 20,
              left: 20,
              right: 20,
            ),
            color: appBarBgColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Send Package',
                  style: GoogleFonts.outfit(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: appBarTextColor,
                  ),
                ),
                GestureDetector(
                  onTap: () => context.pop(),
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.05),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.close, color: appBarIconColor, size: 20),
                  ),
                ),
              ],
            ),
          ),

          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Location Card ──────────────────────────────────────
                  Container(
                    decoration: BoxDecoration(
                      color: AppTheme.surface,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Pickup + Delivery in one block
                        IntrinsicHeight(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                // Icons column
                                Column(
                                  children: [
                                    const Gap(15),
                                    Container(
                                      width: 14,
                                      height: 14,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: const Color(0xFF3B82F6),
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color(0xFF3B82F6).withValues(alpha: 0.35),
                                            spreadRadius: 3,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: 1.5,
                                        margin: const EdgeInsets.symmetric(vertical: 6),
                                        child: CustomPaint(
                                          painter: _DottedLinePainter(
                                            color: Colors.grey.withValues(alpha: 0.4),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const HugeIcon(
                                      icon: HugeIcons.strokeRoundedLocation01,
                                      color: Color(0xFF10B981),
                                      size: 20,
                                    ),
                                    const Gap(15),
                                  ],
                                ),
                                const Gap(16),
                                // Text column
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          final result = await context
                                              .push<String>('/location-search', extra: 'Pick-up location');
                                          if (result != null) {
                                            setState(() => _pickupLocation = result);
                                          }
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                          decoration: BoxDecoration(
                                            color: AppTheme.background,
                                            borderRadius: BorderRadius.circular(12),
                                            border: Border.all(
                                              color: AppTheme.border,
                                            ),
                                          ),
                                          child: Text(
                                            _pickupLocation,
                                            style: GoogleFonts.inter(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: _pickupLocation.contains('location')
                                                  ? AppTheme.textMuted
                                                  : AppTheme.textPrimary,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Gap(16),
                                      GestureDetector(
                                        onTap: () async {
                                          final result = await context
                                              .push<String>('/location-search', extra: 'Delivery location');
                                          if (result != null) {
                                            setState(() => _deliveryLocation = result);
                                          }
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                          decoration: BoxDecoration(
                                            color: AppTheme.background,
                                            borderRadius: BorderRadius.circular(12),
                                            border: Border.all(
                                              color: AppTheme.border,
                                            ),
                                          ),
                                          child: Text(
                                            _deliveryLocation,
                                            style: GoogleFonts.inter(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: _deliveryLocation.contains('location')
                                                  ? AppTheme.textMuted
                                                  : AppTheme.textPrimary,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Gap(24),
                      ],
                    ),
                  ),

                  if (_locationsSet) ...[
                    const Gap(24),

                    // ── Available Vehicles ──────────────────────────────────
                    Text(
                      'Available Vehicles',
                      style: GoogleFonts.outfit(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    const Gap(12),
                  ],

                  if (_locationsSet)
                    ..._vehicles.map((vehicle) {
                    final name = vehicle['name'] as String;
                    final isSelected = _selectedVehicle == name;
                    final isBodaboda = name == 'Bodaboda';
                    final showHelpers = isSelected && (_helperVehicles.contains(name) || isBodaboda);
                    
                    return GestureDetector(
                      onTap: () => setState(() {
                        _selectedVehicle = name;
                        _selectedHelpers = 0; // Reset to default option
                      }),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: AppTheme.surface,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: isSelected
                                ? const Color(0xFF3B82F6)
                                : AppTheme.border,
                            width: 2,
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
                            // ── Vehicle header row ─────────────────────────
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  Container(
                                    width: 64,
                                    height: 64,
                                    decoration: BoxDecoration(
                                      color: AppTheme.background,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        vehicle['image'] as String,
                                        width: 40,
                                        height: 40,
                                        errorBuilder: (context, error, stackTrace) => HugeIcon(
                                          icon: HugeIcons.strokeRoundedCar01,
                                          size: 28,
                                          color: AppTheme.textMuted,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Gap(16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          name,
                                          style: GoogleFonts.outfit(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: AppTheme.textPrimary,
                                          ),
                                        ),
                                        const Gap(4),
                                        Text(
                                          vehicle['description'] as String,
                                          style: GoogleFonts.inter(
                                            fontSize: 13,
                                            color: AppTheme.textSecondary,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const Gap(8),
                                        Row(
                                          children: [
                                            const Icon(Icons.inventory_2_outlined,
                                                size: 14, color: Color(0xFF3B82F6)),
                                            const Gap(6),
                                            Text(
                                              '${vehicle['dimensions']} • ${vehicle['weight']}',
                                              style: GoogleFonts.inter(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: AppTheme.textSecondary,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (isSelected)
                                    Container(
                                      width: 28,
                                      height: 28,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF3B82F6),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                    ),
                                ],
                              ),
                            ),

                            if (showHelpers) ...[
                              Divider(
                                height: 1,
                                color: AppTheme.border,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                                child: Text(
                                  'How many people you need?',
                                  style: GoogleFonts.outfit(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: AppTheme.textPrimary,
                                  ),
                                ),
                              ),
                              if (isBodaboda) ...[
                                _HelperOption(
                                  label: 'Driver only',
                                  cost: 0,
                                  selected: _selectedHelpers == 0,
                                  onTap: () => setState(() => _selectedHelpers = 0),
                                  showDivider: true,
                                ),
                                _HelperOption(
                                  label: 'Driver only with backpack',
                                  cost: 40000,
                                  selected: _selectedHelpers == 1,
                                  onTap: () => setState(() => _selectedHelpers = 1),
                                  showDivider: false,
                                ),
                              ] else ...[
                                _HelperOption(
                                  label: 'Driver only',
                                  cost: 20000,
                                  selected: _selectedHelpers == 0,
                                  onTap: () => setState(() => _selectedHelpers = 0),
                                  showDivider: true,
                                ),
                                _HelperOption(
                                  label: 'Driver only & 1 helper',
                                  cost: 40000,
                                  selected: _selectedHelpers == 1,
                                  onTap: () => setState(() => _selectedHelpers = 1),
                                  showDivider: true,
                                ),
                                _HelperOption(
                                  label: 'Driver only & 2 helper',
                                  cost: 60000,
                                  selected: _selectedHelpers == 2,
                                  onTap: () => setState(() => _selectedHelpers = 2),
                                  showDivider: false,
                                ),
                              ],
                              const Gap(8),
                            ],
                          ],
                        ),
                      ),
                    );
                  }),
                  const Gap(8),
                ],
              ),
            ),
          ),

          if (_locationsSet)
            // ── Bottom Bar ──────────────────────────────────────────────────
            Container(
              padding: EdgeInsets.fromLTRB(
                20,
                16,
                20,
                MediaQuery.of(context).padding.bottom + 16,
              ),
              decoration: BoxDecoration(
                color: AppTheme.surface,
                border: Border(
                  top: BorderSide(
                    color: AppTheme.border,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF0F172A).withValues(alpha: 0.05),
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
                          color: AppTheme.textSecondary,
                        ),
                      ),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder: (Widget child, Animation<double> animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0, 0.2),
                                end: Offset.zero,
                              ).animate(animation),
                              child: child,
                            ),
                          );
                        },
                        child: Text(
                          _selectedVehicle == null
                              ? 'Select a vehicle'
                              : 'TZS ${_totalPrice.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}',
                          key: ValueKey<int>(_totalPrice),
                          style: GoogleFonts.outfit(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _selectedVehicle == null
                          ? null
                          : () {
                              context.push('/send-package/details', extra: {
                                'pickup': _pickupLocation,
                                'delivery': _deliveryLocation,
                                'vehicle': _selectedVehicle,
                                'price': _totalPrice,
                                'deliverySpeed': widget.deliverySpeed,
                                'lastMileDelivery': widget.lastMileDelivery,
                              });
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3B82F6),
                        disabledBackgroundColor: AppTheme.border,
                        foregroundColor: Colors.white,
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
                          color: _selectedVehicle == null
                              ? AppTheme.textMuted
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
      ),
    );
  }
}

class _DottedLinePainter extends CustomPainter {
  final Color color;
  _DottedLinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    double dashH = 4, dashSpace = 4, y = 0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.5;
    while (y < size.height) {
      canvas.drawLine(Offset(0, y), Offset(0, y + dashH), paint);
      y += dashH + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter old) => false;
}

class _HelperOption extends StatelessWidget {
  final String label;
  final int cost;
  final bool selected;
  final VoidCallback onTap;
  final bool showDivider;

  const _HelperOption({
    required this.label,
    required this.cost,
    required this.selected,
    required this.onTap,
    required this.showDivider,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            child: Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: selected
                          ? const Color(0xFF3B82F6)
                          : AppTheme.border,
                      width: selected ? 5 : 1.5,
                    ),
                  ),
                ),
                const Gap(14),
                Expanded(
                  child: Text(
                    label,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                ),
                Text(
                  '+ ${cost.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}',
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (showDivider)
          Container(
            height: 1,
            margin: const EdgeInsets.symmetric(horizontal: 14),
            color: AppTheme.border,
          ),
      ],
    );
  }
}
