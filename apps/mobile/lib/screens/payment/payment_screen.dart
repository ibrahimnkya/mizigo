import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../services/api_service.dart';
import '../../models/parcel_model.dart';

class PaymentScreen extends StatefulWidget {
  final String parcelId;
  final double? initialAmount;
  final bool isOverlay;
  
  const PaymentScreen({
    super.key, 
    required this.parcelId,
    this.initialAmount,
    this.isOverlay = false,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> with SingleTickerProviderStateMixin {
  final _phoneCtrl = TextEditingController();
  final _amountCtrl = TextEditingController();

  String _selectedProvider = 'Airtel Money';
  bool _isLoading = false;
  ParcelModel? _parcel;
  bool _fetchingParcel = true;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _fetchParcel();
    if (widget.initialAmount != null) {
      _amountCtrl.text = NumberFormat('#,###').format(widget.initialAmount);
    }
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..forward();
  }

  Future<void> _fetchParcel() async {
    try {
      final data = await ApiService.getParcelById(widget.parcelId);
      setState(() {
        _parcel = ParcelModel.fromJson(data);
        _fetchingParcel = false;
        if (_parcel!.amount != null) {
           _amountCtrl.text = NumberFormat('#,###').format(_parcel!.amount);
        }
      });
    } catch (e) {
      debugPrint('Error fetching parcel for payment: $e');
      setState(() => _fetchingParcel = false);
    }
  }

  final List<Map<String, String>> _mobileProviders = [
    {
      'title': 'Airtel Money',
      'color': '0xFFE53E3E', 
      'initial': 'A',
    },
    {
      'title': 'Mixx by Yas',
      'color': '0xFFECC94B',
      'initial': 'M',
    },
    {
      'title': 'Halopesa',
      'color': '0xFFED8936',
      'initial': 'H',
    },
  ];

  @override
  void dispose() {
    _animationController.dispose();
    _phoneCtrl.dispose();
    _amountCtrl.dispose();
    super.dispose();
  }

  void _handleContinue() async {
    setState(() => _isLoading = true);

    // Mock implementation: Simulate network delay
    await Future.delayed(const Duration(milliseconds: 1500));

    if (mounted) {
      setState(() => _isLoading = false);
      _showSuccessBottomSheet();
    }
  }

  void _showSuccessBottomSheet() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
      backgroundColor: isDark ? const Color(0xFF0F172A) : const Color(0xFFF4F7FE),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
      builder: (context) => _SuccessSheet(parcelId: widget.parcelId, amount: _amountCtrl.text, provider: _selectedProvider),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: Text('Payment Checkout', style: GoogleFonts.outfit(fontWeight: FontWeight.w700)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Amount Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(color: const Color(0xFF3B82F6).withValues(alpha: 0.3), blurRadius: 20, offset: const Offset(0, 10)),
                  ],
                ),
                child: Column(
                  children: [
                    const HugeIcon(icon: HugeIcons.strokeRoundedMoneyBag01, color: Colors.white, size: 40),
                    const Gap(16),
                    Text('Total Amount to Pay', style: GoogleFonts.inter(color: Colors.white.withValues(alpha: 0.8), fontSize: 14)),
                    const Gap(4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('TZS', style: GoogleFonts.outfit(color: Colors.white.withValues(alpha: 0.8), fontSize: 20, fontWeight: FontWeight.w600)),
                        const Gap(8),
                        Flexible(
                          child: Text(
                            _amountCtrl.text, 
                            style: GoogleFonts.outfit(color: Colors.white, fontSize: 36, fontWeight: FontWeight.w800),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(32),

              // Pricing Breakdown
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1E293B) : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: isDark ? Colors.white.withValues(alpha: 0.05) : const Color(0xFFE2E8F0)),
                ),
                child: _fetchingParcel 
                  ? const Center(child: Padding(padding: EdgeInsets.all(20), child: CircularProgressIndicator()))
                  : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Pricing Summary', style: GoogleFonts.outfit(fontWeight: FontWeight.w700, fontSize: 16)),
                        if (_parcel != null)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFF3B82F6).withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              '${_parcel!.fromAddress} → ${_parcel!.toAddress}',
                              style: GoogleFonts.inter(fontSize: 10, color: const Color(0xFF3B82F6), fontWeight: FontWeight.bold),
                            ),
                          ),
                      ],
                    ),
                    const Gap(20),
                    _buildDetailedPriceRow(HugeIcons.strokeRoundedWeightScale, 'Weight Charge (5.0 kg)', 'TZS 25,000', isDark),
                    const Gap(12),
                    _buildDetailedPriceRow(HugeIcons.strokeRoundedShield01, 'Insurance (1.0% Value)', 'TZS 4,500', isDark),
                    const Gap(12),
                    _buildDetailedPriceRow(HugeIcons.strokeRoundedLocation01, 'Distance Premium', 'TZS 8,635', isDark),
                    const Gap(12),
                    _buildDetailedPriceRow(Icons.percent, 'VAT (18%)', 'TZS 6,865', isDark),
                    const Gap(20),
                    const Divider(height: 1),
                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Payable', style: GoogleFonts.outfit(fontWeight: FontWeight.w800, fontSize: 18)),
                        Text('TZS ${_amountCtrl.text}', style: GoogleFonts.outfit(fontWeight: FontWeight.w800, fontSize: 18, color: const Color(0xFF3B82F6))),
                      ],
                    ),
                  ],
                ),
              ),

              const Gap(32),

              // Provider Selection
              Text('Select Provider', style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w700)),
              const Gap(16),
              SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _mobileProviders.length,
                  separatorBuilder: (_, __) => const Gap(12),
                  itemBuilder: (context, index) {
                    final p = _mobileProviders[index];
                    final isSelected = _selectedProvider == p['title'];
                    return GestureDetector(
                      onTap: () => setState(() => _selectedProvider = p['title']!),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: 100,
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFF3B82F6) : (isDark ? const Color(0xFF1E293B) : Colors.white),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: isSelected ? const Color(0xFF3B82F6) : (isDark ? Colors.white10 : Colors.black.withValues(alpha: 0.05))),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 36, height: 36,
                              decoration: BoxDecoration(color: Color(int.parse(p['color']!)), shape: BoxShape.circle),
                              child: Center(child: Text(p['initial']!, style: GoogleFonts.outfit(color: Colors.white, fontWeight: FontWeight.bold))),
                            ),
                            const Gap(8),
                            Text(p['title']!, style: GoogleFonts.inter(fontSize: 11, fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500, color: isSelected ? Colors.white : (isDark ? Colors.white70 : Colors.black87))),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const Gap(32),
              // Phone Input
              Text('Phone Number', style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w700)),
              const Gap(12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1E293B) : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: isDark ? Colors.white10 : const Color(0xFFE2E8F0)),
                ),
                child: TextField(
                  controller: _phoneCtrl,
                  keyboardType: TextInputType.phone,
                  style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                  decoration: const InputDecoration(
                    hintText: '07xx xxx xxx',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.phone_android_rounded),
                  ),
                ),
              ),

              const Gap(40),
              SizedBox(
                width: double.infinity,
                height: 58,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _handleContinue,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3B82F6),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  child: _isLoading 
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Text('Complete Payment', style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
              const Gap(24), // Extra spacing at bottom to prevent cutoff
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailedPriceRow(dynamic icon, String label, String value, bool isDark) {
    return Row(
      children: [
        HugeIcon(icon: icon, color: isDark ? const Color(0xFF64748B) : const Color(0xFF94A3B8), size: 18),
        const Gap(12),
        Expanded(
          child: Text(label, style: GoogleFonts.inter(color: isDark ? Colors.white60 : Colors.black54, fontSize: 13)),
        ),
        Text(value, style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 13, color: isDark ? Colors.white : Colors.black87)),
      ],
    );
  }
}

class _SuccessSheet extends StatelessWidget {
  final String parcelId;
  final String amount;
  final String provider;

  const _SuccessSheet({required this.parcelId, required this.amount, required this.provider});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.fromLTRB(24, 24, 24, MediaQuery.of(context).padding.bottom + 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle_rounded, color: Color(0xFF10B981), size: 80),
          const Gap(24),
          Text('Payment Initiated', style: GoogleFonts.outfit(fontSize: 24, fontWeight: FontWeight.w800)),
          const Gap(12),
          Text('Please check your phone for the PIN prompt to complete the transaction of TZS $amount via $provider.',
            textAlign: TextAlign.center, style: GoogleFonts.inter(color: isDark ? Colors.white60 : Colors.black54)),
          const Gap(32),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton(
              onPressed: () => context.go('/home'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3B82F6), 
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                elevation: 0,
              ),
              child: Text('Back to Home', style: GoogleFonts.outfit(color: Colors.white, fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    );
  }
}
