import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../providers/cargo_provider.dart';

class PaymentScreen extends StatefulWidget {
  final String cargoId;
  final double? initialAmount;
  final bool isOverlay;
  
  const PaymentScreen({
    super.key, 
    required this.cargoId,
    this.initialAmount,
    this.isOverlay = false,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> with SingleTickerProviderStateMixin {
  final _phoneCtrl = TextEditingController(text: '0687 122 502');
  final _amountCtrl = TextEditingController(text: '60,000');

  String _selectedPayBy = 'Mobile Money';
  String _selectedProvider = 'Airtel Money';
  bool _isLoading = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    if (widget.initialAmount != null) {
      _amountCtrl.text = widget.initialAmount!.toStringAsFixed(0);
    }
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..forward();
  }

  final List<Map<String, String>> _payByOptions = [
    {
      'title': 'Mobile Money',
      'subtitle': 'Use your mobile wallet to pay',
    },
    {
      'title': 'Bank',
      'subtitle': 'Use your bank to pay',
    },
  ];

  final List<Map<String, String>> _mobileProviders = [
    {
      'title': 'Airtel Money',
      'image': 'assets/images/payment_airtel.png',
      'color': '0xFFE53E3E', 
      'initial': 'A',
    },
    {
      'title': 'Mixx by Yas',
      'image': 'assets/images/payment_mixx.png',
      'color': '0xFFECC94B',
      'initial': 'M',
    },
    {
      'title': 'Halopesa',
      'image': 'assets/images/payment_halopesa.png',
      'color': '0xFFED8936',
      'initial': 'H',
    },
  ];

  final List<Map<String, String>> _bankProviders = [
    {
      'title': 'CRDB',
      'color': '0xFF48BB78', // Green
      'initial': 'C',
    },
    {
      'title': 'NMB',
      'color': '0xFF3182CE', // Blue
      'initial': 'N',
    },
    {
      'title': 'NBC',
      'color': '0xFF38B2AC', // Teal
      'initial': 'N',
    },
  ];

  @override
  void dispose() {
    _animationController.dispose();
    _phoneCtrl.dispose();
    _amountCtrl.dispose();
    super.dispose();
  }

  void _showPayBySheet() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    showModalBottomSheet(
      context: context,
      backgroundColor: isDark ? const Color(0xFF1E293B) : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: isDark ? Colors.white24 : const Color(0xFFE2E8F0),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const Gap(16),
              Text(
                'Pay By',
                style: GoogleFonts.outfit(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: isDark ? Colors.white : const Color(0xFF1E293B),
                ),
              ),
              const Gap(8),
              Divider(color: isDark ? Colors.white10 : const Color(0xFFF1F5F9)),
              ..._payByOptions.map((opt) {
                final isSelected = _selectedPayBy == opt['title'];
                return InkWell(
                  onTap: () {
                    setState(() {
                      _selectedPayBy = opt['title']!;
                      // Reset provider when changing pay by
                      _selectedProvider = _selectedPayBy == 'Mobile Money' ? 'Airtel Money' : 'CRDB';
                    });
                    context.pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: isDark ? Colors.white10 : const Color(0xFFF1F5F9),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              opt['title']!,
                              style: GoogleFonts.outfit(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: isDark ? Colors.white : const Color(0xFF1E293B),
                              ),
                            ),
                            const Gap(4),
                            Text(
                              opt['subtitle']!,
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                color: isDark ? Colors.white54 : const Color(0xFF64748B),
                              ),
                            ),
                          ],
                        ),
                        if (isSelected)
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF0F5FF),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.check_circle, color: Color(0xFF3B82F6), size: 24),
                          )
                        else
                          const SizedBox(width: 32, height: 32),
                      ],
                    ),
                  ),
                );
              }),
              const Gap(16),
            ],
          ),
        );
      },
    );
  }

  void _showProviderSheet() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final options = _selectedPayBy == 'Mobile Money' ? _mobileProviders : _bankProviders;

    showModalBottomSheet(
      context: context,
      backgroundColor: isDark ? const Color(0xFF1E293B) : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.6,
          maxChildSize: 0.9,
          minChildSize: 0.4,
          builder: (_, controller) {
            return Column(
              children: [
                const Gap(16),
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: isDark ? Colors.white24 : const Color(0xFFE2E8F0),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const Gap(16),
                Text(
                  'Service Provider',
                  style: GoogleFonts.outfit(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: isDark ? Colors.white : const Color(0xFF1E293B),
                  ),
                ),
                const Gap(8),
                Divider(color: isDark ? Colors.white10 : const Color(0xFFF1F5F9)),
                Expanded(
                  child: ListView.separated(
                    controller: controller,
                    padding: const EdgeInsets.only(bottom: 24),
                    itemCount: options.length,
                    separatorBuilder: (_, __) => Divider(
                      color: isDark ? Colors.white10 : const Color(0xFFF1F5F9),
                      height: 1,
                    ),
                    itemBuilder: (context, index) {
                      final opt = options[index];
                      final isSelected = _selectedProvider == opt['title'];
                      
                      return InkWell(
                        onTap: () {
                          setState(() => _selectedProvider = opt['title']!);
                          context.pop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          child: Row(
                            children: [
                              Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: opt['image'] != null ? Colors.transparent : Color(int.parse(opt['color']!)),
                                  borderRadius: BorderRadius.circular(10),
                                  border: opt['image'] != null ? Border.all(color: isDark ? Colors.white10 : const Color(0xFFE2E8F0)) : null,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: opt['image'] != null 
                                    ? Image.asset(opt['image']!, fit: BoxFit.cover)
                                    : Center(
                                        child: Text(
                                          opt['initial']!,
                                          style: GoogleFonts.outfit(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                ),
                              ),
                              const Gap(16),
                              Expanded(
                                child: Text(
                                  opt['title']!,
                                  style: GoogleFonts.outfit(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: isDark ? Colors.white : const Color(0xFF1E293B),
                                  ),
                                ),
                              ),
                              if (isSelected)
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFF0F5FF),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.check_circle, color: Color(0xFF3B82F6), size: 24),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _handleContinue() async {
    setState(() => _isLoading = true);

    try {
      final provider = context.read<CargoProvider>();
      // Map display name to UTS name (backend expectation)
      final utsProvider = _selectedProvider.toLowerCase().replaceAll(' ', '').replaceAll('-', '');
      
      final res = await provider.initiatePayment(
        cargoId: widget.cargoId,
        provider: utsProvider,
        phone: _phoneCtrl.text.replaceAll(' ', ''),
      );

      if (mounted) {
        setState(() => _isLoading = false);
        if (res != null) {
          _showSuccessBottomSheet();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(provider.error ?? 'Payment initiation failed'),
              backgroundColor: Colors.redAccent,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    }
  }

  Widget _buildReceiptRow(String label, String value, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isDark ? Colors.white54 : const Color(0xFF8E8E8E),
            ),
          ),
          Text(
            value,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white : const Color(0xFF1A1A1A),
            ),
          ),
        ],
      ),
    );
  }

  void _showSuccessBottomSheet() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
      backgroundColor: isDark ? const Color(0xFF0F172A) : const Color(0xFFF4F7FE),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 24, right: 24, top: 40,
            bottom: MediaQuery.of(context).padding.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Success Header
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        color: const Color(0xFF27AE60).withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Color(0xFF27AE60),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF27AE60),
                                blurRadius: 15,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: const Icon(Icons.check_rounded, color: Colors.white, size: 32),
                        ),
                      ),
                    ),
                    const Gap(20),
                    Text(
                      'Payment Processing',
                      style: GoogleFonts.outfit(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: isDark ? Colors.white : const Color(0xFF1A1A1A),
                      ),
                    ),
                    const Gap(8),
                    Text(
                      'Please check your phone to confirm\nthe transaction PIN.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: isDark ? Colors.white60 : const Color(0xFF64748B),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(32),

              // Details Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1E293B) : Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildReceiptRow('Provider', _selectedProvider, isDark),
                    _buildReceiptRow('Number', '+255 ${_phoneCtrl.text}', isDark),
                    _buildReceiptRow('Reference', 'MZ-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}', isDark),
                    const Gap(16),
                    Divider(color: isDark ? Colors.white10 : const Color(0xFFF1F5F9)),
                    const Gap(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Amount',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: isDark ? Colors.white54 : const Color(0xFF8E8E8E),
                          ),
                        ),
                        Text(
                          'TZS ${NumberFormat('#,###').format(int.tryParse(_amountCtrl.text.replaceAll(',', '')) ?? 0)}',
                          style: GoogleFonts.outfit(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: const Color(0xFF4A43EC),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(24),

              // Trouble Support Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1E293B) : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: isDark ? Colors.white10 : const Color(0xFFF1F5F9)),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF4A43EC).withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.help_outline_rounded, color: Color(0xFF4A43EC), size: 20),
                    ),
                    const Gap(16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Trouble With Your Payment?',
                            style: GoogleFonts.outfit(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: isDark ? Colors.white : const Color(0xFF1A1A1A),
                            ),
                          ),
                          Text(
                            'Contact our help center now',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: isDark ? Colors.white54 : const Color(0xFF8E8E8E),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right_rounded, color: isDark ? Colors.white24 : const Color(0xFFCBD5E1)),
                  ],
                ),
              ),
              const Gap(32),

              // Actions
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        context.pop();
                        context.push('/cargo/${widget.cargoId}/receipt');
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: BorderSide(
                          color: isDark ? Colors.white24 : const Color(0xFFE2E8F0),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        'View Receipt',
                        style: GoogleFonts.outfit(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: isDark ? Colors.white : const Color(0xFF1A1A1A),
                        ),
                      ),
                    ),
                  ),
                  const Gap(16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        context.pop();
                        context.go('/home');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4A43EC),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        'Done',
                        style: GoogleFonts.outfit(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(16),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String value,
    required VoidCallback onTap,
    bool isDark = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1E293B) : Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isDark ? Colors.white10 : const Color(0xFFE2E8F0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: isDark ? Colors.white54 : const Color(0xFF94A3B8),
                  ),
                ),
                const Gap(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      value,
                      style: GoogleFonts.outfit(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: isDark ? Colors.white : const Color(0xFF1E293B),
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: isDark ? Colors.white : const Color(0xFF1E293B),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    bool isDark = false,
    String? prefixText,
    String? suffixText,
    double fontSize = 16,
    Widget? prefixIcon,
    bool readOnly = false,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: fontSize > 20 ? 12 : 4),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E293B) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? Colors.white10 : const Color(0xFFE2E8F0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (fontSize <= 20) const Gap(8),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: isDark ? Colors.white54 : const Color(0xFF94A3B8),
            ),
          ),
          Row(
            children: [
              if (prefixIcon != null) ...[
                prefixIcon,
                const Gap(8),
              ],
              Expanded(
                child: TextFormField(
                  controller: controller,
                  keyboardType: keyboardType,
                  readOnly: readOnly,
                  style: GoogleFonts.outfit(
                    fontSize: fontSize,
                    fontWeight: fontSize > 20 ? FontWeight.w700 : FontWeight.w500,
                    color: isDark ? Colors.white : const Color(0xFF1E293B),
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.only(bottom: 8, top: fontSize > 20 ? 8 : 4),
                    border: InputBorder.none,
                    prefixText: prefixText != null ? '$prefixText ' : null,
                    prefixStyle: GoogleFonts.outfit(
                      fontSize: fontSize,
                      fontWeight: fontSize > 20 ? FontWeight.w700 : FontWeight.w500,
                      color: isDark ? Colors.white54 : const Color(0xFF64748B),
                    ),
                    suffixText: suffixText,
                    suffixStyle: GoogleFonts.outfit(
                      fontSize: fontSize,
                      fontWeight: fontSize > 20 ? FontWeight.w700 : FontWeight.w500,
                      color: isDark ? Colors.white54 : const Color(0xFF64748B),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStaggered(int index, Widget child) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, c) {
        final delay = index * 0.08;
        final val = ((_animationController.value - delay) / (1 - delay)).clamp(0.0, 1.0);
        final curve = Curves.easeOutCubic.transform(val);
        return Opacity(
          opacity: val.clamp(0.0, 1.0),
          child: Transform.translate(
            offset: Offset(0, 30 * (1 - curve)),
            child: c,
          ),
        );
      },
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final content = SafeArea(
      bottom: !widget.isOverlay,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.isOverlay) ...[
                const Gap(32), // Add top padding instead of handle
              ] else ...[
                const Gap(10),
              ],
              // Golden Ticket Icon
              _buildStaggered(0, Container(
                width: 72,
                height: 44,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFDE68A), Color(0xFFF59E0B)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFF59E0B).withValues(alpha: 0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 44,
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: Colors.white30,
                            width: 2,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Positioned(
                            left: 10,
                            top: 12,
                            child: Container(width: 24, height: 4, color: const Color(0xFFD97706)),
                          ),
                          Positioned(
                            left: 10,
                            bottom: 12,
                            child: Container(width: 24, height: 4, color: const Color(0xFFD97706)),
                          ),
                          // ticket cutout left
                          Positioned(
                            left: -6,
                            child: Container(
                              width: 12,
                              height: 12,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // ticket cutout right
                          Positioned(
                            right: -6,
                            child: Container(
                              width: 12,
                              height: 12,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 6,
                            child: Container(width: 8, height: 8, decoration: const BoxDecoration(color: Color(0xFFD97706), shape: BoxShape.circle)),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 6,
                            child: Container(width: 8, height: 8, color: const Color(0xFFD97706)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
              const Gap(16),
              _buildStaggered(1, Text(
                'Your Order is Ready',
                style: GoogleFonts.outfit(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white54 : const Color(0xFF64748B),
                ),
              )),
              const Gap(32),

              // Form Elements
              _buildStaggered(2, _buildDropdownField(
                label: 'Pay by',
                value: _selectedPayBy,
                onTap: _showPayBySheet,
                isDark: isDark,
              )),
              const Gap(16),
              
              _buildStaggered(3, _buildDropdownField(
                label: 'Service Provider',
                value: _selectedProvider,
                onTap: _showProviderSheet,
                isDark: isDark,
              )),
              const Gap(16),

              _buildStaggered(4, _buildTextField(
                label: 'Phone Number',
                controller: _phoneCtrl,
                keyboardType: TextInputType.phone,
                isDark: isDark,
                prefixText: '+255',
                prefixIcon: Icon(Icons.phone_android, size: 18, color: isDark ? Colors.white54 : const Color(0xFF64748B)),
              )),
              const Gap(16),

              _buildStaggered(5, _buildTextField(
                label: 'Amount',
                controller: _amountCtrl,
                keyboardType: TextInputType.number,
                isDark: isDark,
                fontSize: 32,
                readOnly: true,
                suffixText: 'TZS',
              )),
              const Gap(40),
              
              // Continue Button
              _buildStaggered(6, SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _handleContinue,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3B82F6),
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: const Color(0xFF3B82F6).withValues(alpha: 0.8),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 3,
                          ),
                        )
                      : Text(
                          'Continue',
                          style: GoogleFonts.outfit(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                ),
              )),
            ],
          ),
        ),
      ),
    );

    if (widget.isOverlay) {
      return Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF0F172A) : Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: content,
      );
    }

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF0F172A) : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(
            Icons.arrow_back,
            color: isDark ? Colors.white : const Color(0xFF1E293B),
            size: 24,
          ),
        ),
      ),
      body: content,
    );
  }
}
