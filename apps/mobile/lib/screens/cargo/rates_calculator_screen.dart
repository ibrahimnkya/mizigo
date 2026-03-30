import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class RatesCalculatorScreen extends StatefulWidget {
  const RatesCalculatorScreen({super.key});

  @override
  State<RatesCalculatorScreen> createState() => _RatesCalculatorScreenState();
}

class _RatesCalculatorScreenState extends State<RatesCalculatorScreen> {
  String _pickupLocation = 'Pick-up location';
  String _deliveryLocation = 'Delivery location';
  String _selectedVehicle = 'Bodaboda';
  
  final Map<String, int> _baseRates = {
    'Bodaboda': 2000,
    'Small Vehicle': 5000,
    'Minivan / Kirikuu': 12000,
    'Canter/Fuso': 25000,
    'Large Truck': 40000,
  };

  String _getVehicleImage(String vehicle) {
    switch (vehicle) {
      case 'Bodaboda': return 'assets/images/vehicle_bodaboda.png';
      case 'Small Vehicle': return 'assets/images/vehicle_small.png';
      case 'Minivan / Kirikuu': return 'assets/images/vehicle_minivan.png';
      case 'Canter/Fuso': return 'assets/images/vehicle_canter.png';
      case 'Large Truck': return 'assets/images/vehicle_truck.png';
      default: return 'assets/images/vehicle_small.png';
    }
  }

  // Create a mock distance if both are selected (e.g., 12 km)
  double get _distance {
    if (_pickupLocation != 'Pick-up location' && _deliveryLocation != 'Delivery location') {
      return 12.5; 
    }
    return 0.0;
  }

  double get _totalEstimate => _baseRates[_selectedVehicle]! * (_distance == 0.0 ? 1 : _distance);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    const primaryBlue = Color(0xFF3B82F6); // Standardized blue

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: Text('Rates Calculator', style: GoogleFonts.outfit(fontWeight: FontWeight.w600)),
        backgroundColor: isDark ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC),
        elevation: 0,
        leading: IconButton(
          icon: const HugeIcon(icon: HugeIcons.strokeRoundedArrowLeft01, color: Colors.grey, size: 24),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Estimate delivery cost',
              style: GoogleFonts.outfit(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: isDark ? Colors.white : const Color(0xFF1E293B),
              ),
            ),
            const Gap(8),
            Text(
              'Enter locations and vehicle to calculate',
              style: GoogleFonts.inter(
                fontSize: 14,
                color: isDark ? Colors.white70 : const Color(0xFF64748B),
              ),
            ),
            const Gap(32),
            
            // Location Input Card
            Container(
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF1E293B) : Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildLocationItem(
                    context: context,
                    label: _pickupLocation,
                    icon: HugeIcons.strokeRoundedTarget02,
                    iconColor: primaryBlue,
                    isFirst: true,
                    onTap: () async {
                      final result = await context.push<String>('/location-search', extra: 'Pick-up location');
                      if (result != null) setState(() => _pickupLocation = result);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Divider(
                      height: 1,
                      color: isDark ? Colors.white10 : Colors.grey.withValues(alpha: 0.1),
                    ),
                  ),
                  _buildLocationItem(
                    context: context,
                    label: _deliveryLocation,
                    icon: HugeIcons.strokeRoundedLocation01,
                    iconColor: const Color(0xFF10B981),
                    isFirst: false,
                    onTap: () async {
                      final result = await context.push<String>('/location-search', extra: 'Delivery location');
                      if (result != null) setState(() => _deliveryLocation = result);
                    },
                  ),
                ],
              ),
            ),

            const Gap(32),

            // Vehicle Selection
            Text(
              'Vehicle Type',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white : const Color(0xFF1E293B),
              ),
            ),
            const Gap(16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: _baseRates.keys.map((v) {
                final isSelected = _selectedVehicle == v;
                return GestureDetector(
                  onTap: () => setState(() => _selectedVehicle = v),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: isSelected 
                          ? primaryBlue 
                          : (isDark ? const Color(0xFF1E293B) : Colors.white),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isSelected ? primaryBlue : (isDark ? Colors.white10 : Colors.grey.withValues(alpha: 0.2)),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          _getVehicleImage(v),
                          width: 20,
                          height: 20,
                          errorBuilder: (context, error, stackTrace) => HugeIcon(
                            icon: HugeIcons.strokeRoundedCar01,
                            color: isSelected ? Colors.white : (isDark ? Colors.white70 : const Color(0xFF64748B)),
                            size: 20,
                          ),
                        ),
                        const Gap(8),
                        Text(
                          v,
                          style: GoogleFonts.inter(
                            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                            color: isSelected ? Colors.white : (isDark ? Colors.white70 : const Color(0xFF64748B)),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            
            const Gap(48),
            
            // Result Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    primaryBlue,
                    primaryBlue.withValues(alpha: 0.8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: primaryBlue.withValues(alpha: 0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const HugeIcon(
                    icon: HugeIcons.strokeRoundedMoney02,
                    color: Colors.white,
                    size: 32,
                  ),
                  const Gap(16),
                  Text(
                    'Estimated Cost',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Colors.white.withValues(alpha: 0.8),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Gap(8),
                  Text(
                    _distance == 0.0 
                        ? 'TZS 0' 
                        : 'TZS ${_totalEstimate.toStringAsFixed(0)}',
                    style: GoogleFonts.outfit(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const Gap(12),
                  if (_distance > 0.0) 
                    Text(
                      '~ ${_distance.toStringAsFixed(1)} km distance',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: Colors.white.withValues(alpha: 0.9),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  const Gap(24),
                  ElevatedButton(
                    onPressed: () => context.go('/cargo/send'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: primaryBlue,
                      minimumSize: const Size.fromHeight(52),
                      shape: const StadiumBorder(),
                      elevation: 0,
                    ),
                    child: Text(
                      'Book Delivery Now',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            const Gap(24),
            // Disclaimer
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isDark ? Colors.white10 : Colors.grey.withValues(alpha: 0.2),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HugeIcon(
                    icon: HugeIcons.strokeRoundedInformationCircle,
                    color: isDark ? Colors.white54 : const Color(0xFF64748B),
                    size: 20,
                  ),
                  const Gap(12),
                  Expanded(
                    child: Text(
                      'Disclaimer: The estimated cost shown above may vary depending on the actual cargo weight/size, live traffic conditions, tolls, and other variables at the time of delivery.',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        height: 1.5,
                        color: isDark ? Colors.white54 : const Color(0xFF64748B),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            const Gap(32),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationItem({
    required BuildContext context,
    required String label,
    required dynamic icon,
    required Color iconColor,
    required bool isFirst,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Column(
              children: [
                HugeIcon(icon: icon, color: iconColor, size: 24),
                if (isFirst)
                  Container(
                    width: 1,
                    height: 20,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: CustomPaint(
                      painter: _DottedLinePainter(
                        color: isDark ? Colors.white24 : Colors.grey.withValues(alpha: 0.3),
                      ),
                    ),
                  ),
              ],
            ),
            const Gap(16),
            Expanded(
              child: Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: label.contains('location') 
                      ? (isDark ? Colors.white38 : const Color(0xFF94A3B8))
                      : (isDark ? Colors.white : const Color(0xFF1E293B)),
                ),
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
    double dashHeight = 3, dashSpace = 3, startY = 0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
