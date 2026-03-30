import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../widgets/common/country_selector.dart';
import 'package:flutter/services.dart';
import '../../../theme/app_theme.dart';

class OperatorReceiverScreen extends StatefulWidget {
  final Map<String, dynamic> packageData;

  const OperatorReceiverScreen({super.key, required this.packageData});

  @override
  State<OperatorReceiverScreen> createState() => _OperatorReceiverScreenState();
}

class _OperatorReceiverScreenState extends State<OperatorReceiverScreen> {
  final _senderNameCtrl = TextEditingController();
  final _senderPhoneCtrl = TextEditingController();
  
  final _receiverNameCtrl = TextEditingController();
  final _receiverPhoneCtrl = TextEditingController();

  Country _senderCountry = countries.first;
  Country _receiverCountry = countries.first;
  bool _hasError = false; // Track validation error for dots

  @override
  void dispose() {
    _senderNameCtrl.dispose();
    _senderPhoneCtrl.dispose();
    _receiverNameCtrl.dispose();
    _receiverPhoneCtrl.dispose();
    super.dispose();
  }

  void _onNext() {
    if (_senderNameCtrl.text.isEmpty ||
        _senderPhoneCtrl.text.isEmpty ||
        _receiverNameCtrl.text.isEmpty ||
        _receiverPhoneCtrl.text.isEmpty) {
      setState(() => _hasError = true);
      return;
    }
    setState(() => _hasError = false);

    final combinedData = {
      ...widget.packageData,
      'senderName': _senderNameCtrl.text,
      'senderPhone': '${_senderCountry.dialCode}${_senderPhoneCtrl.text}',
      'receiverName': _receiverNameCtrl.text,
      'receiverPhone': '${_receiverCountry.dialCode}${_receiverPhoneCtrl.text}',
    };

    context.push('/operator-receive/payment', extra: combinedData);
  }

  void _showCountryPicker(bool isSender) async {
    final result = await showModalBottomSheet<Country>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const CountryPickerSheet(),
    );
    if (result != null) {
      setState(() {
        if (isSender) {
          _senderCountry = result;
        } else {
          _receiverCountry = result;
        }
      });
    }
  }

  void _showStepHelp(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => DraggableScrollableSheet(
        initialChildSize: 0.55,
        minChildSize: 0.4,
        maxChildSize: 0.85,
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
                      child: const HugeIcon(icon: HugeIcons.strokeRoundedUserMultiple, color: Color(0xFF3B82F6), size: 22),
                    ),
                    const Gap(12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Step 2 — Contact Info', style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white)),
                        Text('Sender and receiver details', style: GoogleFonts.inter(fontSize: 13, color: Colors.white38)),
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
                    _helpRow(HugeIcons.strokeRoundedUser, 'Sender Name', 'Enter the full name of the person dropping off the cargo at the station.'),
                    _helpRow(HugeIcons.strokeRoundedCall, 'Sender Phone', 'Select the sender\'s country dial code and enter their phone number without leading zero.'),
                    _helpRow(HugeIcons.strokeRoundedUserAdd01, 'Receiver Name', 'Enter the full name of the person who will collect the cargo at the destination.'),
                    _helpRow(HugeIcons.strokeRoundedSmartPhone01, 'Receiver Phone', 'Select the receiver\'s country code and enter their number. Used for delivery notifications.'),
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

  Widget _buildPhoneField({
    required TextEditingController controller,
    required String label,
    required Country selectedCountry,
    required VoidCallback onSelectCountry,
    bool isDark = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.outfit(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const Gap(10),
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.1),
            ),
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: onSelectCountry,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border(
                      right: BorderSide(
                        color: Colors.white.withValues(alpha: 0.1),
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(selectedCountry.flag, style: const TextStyle(fontSize: 20)),
                      const Gap(8),
                      Text(
                        selectedCountry.dialCode,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(9),
                  ],
                  onChanged: (v) => setState(() {}),
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: 1,
                  ),
                  cursorColor: AppTheme.cPrimary,
                  decoration: InputDecoration(
                    hintText: '712 345 678',
                    hintStyle: GoogleFonts.inter(
                      fontSize: 15,
                      color: Colors.white10,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType type = TextInputType.text,
    bool isDark = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.outfit(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const Gap(10),
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.1),
            ),
          ),
          child: TextField(
            controller: controller,
            keyboardType: type,
            onChanged: (v) => setState(() {}),
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            cursorColor: AppTheme.cPrimary,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: GoogleFonts.inter(
                fontSize: 15,
                color: Colors.white10,
              ),
              prefixIcon: Icon(icon, color: Colors.white38, size: 20),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final canProceed = _senderNameCtrl.text.isNotEmpty &&
        _senderPhoneCtrl.text.isNotEmpty &&
        _receiverNameCtrl.text.isNotEmpty &&
        _receiverPhoneCtrl.text.isNotEmpty;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppTheme.cBlackMain,
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
              color: const Color(0xFF0F172A),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: const HugeIcon(icon: HugeIcons.strokeRoundedArrowLeft01, color: Colors.white, size: 24),
                  ),
                  const Gap(16),
                  Text(
                    'Sender & Receiver',
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
                      final isActive = index == 1; // Step 2
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
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E293B),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppTheme.cPrimary,
                              shape: BoxShape.circle,
                            ),
                            child: const HugeIcon(
                              icon: HugeIcons.strokeRoundedUserGroup,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          const Gap(16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Who is sending and receiving?',
                                  style: GoogleFonts.outfit(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: isDark ? Colors.white : const Color(0xFF1E293B),
                                  ),
                                ),
                                const Gap(4),
                                Text(
                                  'Enter precise contact details.',
                                  style: GoogleFonts.inter(
                                    fontSize: 13,
                                    color: isDark ? Colors.white60 : const Color(0xFF64748B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(32),
                    
                    Text(
                      'Sender Information',
                      style: GoogleFonts.outfit(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: isDark ? Colors.white : const Color(0xFF1E293B),
                      ),
                    ),
                    const Gap(16),
                    _buildField(
                      controller: _senderNameCtrl,
                      label: 'Full Name',
                      hint: 'e.g. John Doe',
                      icon: Icons.person_outline,
                      isDark: isDark,
                    ),
                    const Gap(16),
                    _buildPhoneField(
                      controller: _senderPhoneCtrl,
                      label: 'Phone Number',
                      selectedCountry: _senderCountry,
                      onSelectCountry: () => _showCountryPicker(true),
                      isDark: isDark,
                    ),

                    const Gap(40),

                    Text(
                      'Receiver Information',
                      style: GoogleFonts.outfit(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: isDark ? Colors.white : const Color(0xFF1E293B),
                      ),
                    ),
                    const Gap(16),
                    _buildField(
                      controller: _receiverNameCtrl,
                      label: 'Full Name',
                      hint: 'e.g. Jane Smith',
                      icon: Icons.person_outline,
                      isDark: isDark,
                    ),
                    const Gap(16),
                    _buildPhoneField(
                      controller: _receiverPhoneCtrl,
                      label: 'Phone Number',
                      selectedCountry: _receiverCountry,
                      onSelectCountry: () => _showCountryPicker(false),
                      isDark: isDark,
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
                height: 58,
                child: ElevatedButton(
                  onPressed: canProceed ? _onNext : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.cPrimary,
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
                        'Proceed to Payment',
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
      ),
    );
  }
}
