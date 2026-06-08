import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';

// ─── Country model ────────────────────────────────────────────────────────────

class _Country {
  final String name;
  final String code;
  final String dialCode;
  final String flag;
  const _Country({
    required this.name,
    required this.code,
    required this.dialCode,
    required this.flag,
  });
}

const List<_Country> _countries = [
  _Country(name: 'Tanzania', code: 'TZ', dialCode: '+255', flag: '🇹🇿'),
  _Country(name: 'Kenya', code: 'KE', dialCode: '+254', flag: '🇰🇪'),
  _Country(name: 'Uganda', code: 'UG', dialCode: '+256', flag: '🇺🇬'),
  _Country(name: 'Rwanda', code: 'RW', dialCode: '+250', flag: '🇷🇼'),
  _Country(name: 'Ethiopia', code: 'ET', dialCode: '+251', flag: '🇪🇹'),
  _Country(name: 'South Africa', code: 'ZA', dialCode: '+27', flag: '🇿🇦'),
  _Country(name: 'Nigeria', code: 'NG', dialCode: '+234', flag: '🇳🇬'),
  _Country(name: 'Ghana', code: 'GH', dialCode: '+233', flag: '🇬🇭'),
  _Country(name: 'Zambia', code: 'ZM', dialCode: '+260', flag: '🇿🇲'),
  _Country(name: 'Mozambique', code: 'MZ', dialCode: '+258', flag: '🇲🇿'),
  _Country(name: 'Malawi', code: 'MW', dialCode: '+265', flag: '🇲🇼'),
  _Country(name: 'Burundi', code: 'BI', dialCode: '+257', flag: '🇧🇮'),
  _Country(name: 'DRC Congo', code: 'CD', dialCode: '+243', flag: '🇨🇩'),
  _Country(name: 'United States', code: 'US', dialCode: '+1', flag: '🇺🇸'),
  _Country(name: 'United Kingdom', code: 'GB', dialCode: '+44', flag: '🇬🇧'),
  _Country(name: 'India', code: 'IN', dialCode: '+91', flag: '🇮🇳'),
  _Country(name: 'China', code: 'CN', dialCode: '+86', flag: '🇨🇳'),
  _Country(name: 'France', code: 'FR', dialCode: '+33', flag: '🇫🇷'),
  _Country(name: 'Germany', code: 'DE', dialCode: '+49', flag: '🇩🇪'),
  _Country(name: 'Australia', code: 'AU', dialCode: '+61', flag: '🇦🇺'),
];

// ─── Shared decoration factory ────────────────────────────────────────────────

InputDecoration _inputDecoration({
  required BuildContext context,
  required String hint,
  List<List<dynamic>>? prefixIcon,
  Widget? prefix,
  Widget? suffix,
}) {
  return InputDecoration(
    hintText: hint,
    hintStyle: GoogleFonts.inter(
      color: Colors.white.withValues(alpha: 0.3),
      fontSize: 15,
    ),
    prefixIcon: prefixIcon != null ? Padding(
      padding: const EdgeInsets.all(14.0),
      child: HugeIcon(icon: prefixIcon, size: 20, color: const Color(0xFF94A3B8)),
    ) : null,
    prefix: prefix,
    suffixIcon: suffix,
    filled: true,
    fillColor: Colors.transparent,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.3), width: 1.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFF3B82F6), width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFFEF4444), width: 1.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFFEF4444), width: 1.5),
    ),
    errorStyle: GoogleFonts.inter(fontSize: 12, color: const Color(0xFFEF4444)),
  );
}

// ─── Register Screen ──────────────────────────────────────────────────────────

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  _Country _selectedCountry = _countries.first;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) setState(() {});
    });
    _phoneController.addListener(() => setState(() {}));
    _emailController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tabController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  bool get _phoneValid => _phoneController.text.length >= 7;
  bool get _emailValid =>
      _emailController.text.isNotEmpty &&
      _emailController.text.contains('@') &&
      _emailController.text.contains('.');

  Future<void> _pickCountry() async {
    final result = await showModalBottomSheet<_Country>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) =>
          _CountryPickerSheet(selected: _selectedCountry, countries: _countries),
    );
    if (result != null) {
      setState(() {
        _selectedCountry = result;
        _phoneController.clear();
      });
    }
  }

  void _sendCode() {
    context.push(
      '/register/verify',
      extra: '${_selectedCountry.dialCode}${_phoneController.text}',
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isPhone = _tabController.index == 0;
    final canContinue = isPhone ? _phoneValid : _emailValid;

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: HugeIcon(icon: HugeIcons.strokeRoundedArrowLeft01,
              color: theme.iconTheme.color, size: 20),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Create your account',
          style: GoogleFonts.outfit(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const HugeIcon(icon: HugeIcons.strokeRoundedHelpCircle, color: Colors.white, size: 22),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: PopScope(
        canPop: true,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
        },
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Gap(24),
                // ── Tab switcher ────────────────────────────────
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E293B),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    indicator: BoxDecoration(
                      color: const Color(0xFF0F172A),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.1),
                        width: 1,
                      ),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: Colors.white,
                    unselectedLabelColor: const Color(0xFF94A3B8),
                    labelStyle: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    unselectedLabelStyle: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    dividerColor: Colors.transparent,
                    tabs: const [
                      Tab(text: 'Phone'),
                      Tab(text: 'Email'),
                    ],
                  ),
                ),

                const Gap(32),

                // ── Big Emoji ──
                const Center(
                  child: Text(
                    '🤩',
                    style: TextStyle(fontSize: 80),
                  ),
                ),

                const Gap(24),

                // ── Tab content ──
                SizedBox(
                  height: 220, // Enough for the phone/email fields
                  child: TabBarView(
                    controller: _tabController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _PhoneTab(
                        controller: _phoneController,
                        selectedCountry: _selectedCountry,
                        onPickCountry: _pickCountry,
                      ),
                      _EmailTab(controller: _emailController),
                    ],
                  ),
                ),

                const Gap(24),

                // ── CTA button ──
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: FilledButton(
                    onPressed: canContinue
                        ? (isPhone
                            ? _sendCode
                            : () => context.push('/register/setup',
                                extra: {'email': _emailController.text}))
                        : null,
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF3B82F6),
                      disabledBackgroundColor: Colors.white.withValues(alpha: 0.1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28)),
                      elevation: 0,
                    ),
                    child: Text(
                      isPhone ? 'Send Code' : 'Continue',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: canContinue
                            ? Colors.white
                            : Colors.white.withValues(alpha: 0.3),
                      ),
                    ),
                  ),
                ),
                const Gap(32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Phone Tab ─────────────────────────────────────────────────────────────────

class _PhoneTab extends StatelessWidget {
  final TextEditingController controller;
  final _Country selectedCountry;
  final VoidCallback onPickCountry;

  const _PhoneTab({
    required this.controller,
    required this.selectedCountry,
    required this.onPickCountry,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(8),

          // Phone field: always-visible country picker + number input
          Container(
            height: 64,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white.withValues(alpha: 0.3), width: 1),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ── Country picker — always visible ──
                GestureDetector(
                  onTap: onPickCountry,
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(selectedCountry.flag,
                            style: const TextStyle(fontSize: 22)),
                        const Gap(8),
                        Text(
                          selectedCountry.dialCode,
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        const Gap(4),
                        const HugeIcon(icon: HugeIcons.strokeRoundedArrowDown01,
                            size: 16, color: Color(0xFF94A3B8)),
                      ],
                    ),
                  ),
                ),

                // ── Number input ──
                Expanded(
                  child: TextField(
                    controller: controller,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(12),
                    ],
                    autofocus: true,
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      letterSpacing: 1.0,
                    ),
                    decoration: InputDecoration(
                      hintText: '687 122 502',
                      hintStyle: GoogleFonts.inter(
                        color: Colors.white.withValues(alpha: 0.3),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0,
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      filled: false,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                    ),
                  ),
                ),
                if (controller.text.isNotEmpty)
                  IconButton(
                    icon: const HugeIcon(icon: HugeIcons.strokeRoundedCancel01, color: Color(0xFF94A3B8), size: 18),
                    onPressed: () => controller.clear(),
                  ),
                const Gap(8),
              ],
            ),
          ),

          const Gap(16),
          Center(
            child: Text(
              "We'll send a verification code via SMS to confirm this number.",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: const Color(0xFF94A3B8),
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Email Tab ────────────────────────────────────────────────────────────────

class _EmailTab extends StatelessWidget {
  final TextEditingController controller;
  const _EmailTab({required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(8),
          TextField(
            controller: controller,
            keyboardType: TextInputType.emailAddress,
            autofocus: true,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            decoration: _inputDecoration(
              context: context,
              hint: 'you@example.com',
              prefixIcon: HugeIcons.strokeRoundedMail01,
            ),
          ),

          const Gap(12),
          Row(
            children: [
              HugeIcon(icon: HugeIcons.strokeRoundedLockPassword,
                  size: 13, color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.4) ?? const Color(0xFFCBD5E1)),
              const Gap(5),
              Text(
                'Your email is safe with us.',
                style: GoogleFonts.inter(
                    fontSize: 12, color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.5)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Country Picker Bottom Sheet ──────────────────────────────────────────────

class _CountryPickerSheet extends StatefulWidget {
  final _Country selected;
  final List<_Country> countries;
  const _CountryPickerSheet(
      {required this.selected, required this.countries});

  @override
  State<_CountryPickerSheet> createState() => _CountryPickerSheetState();
}

class _CountryPickerSheetState extends State<_CountryPickerSheet> {
  final TextEditingController _search = TextEditingController();
  late List<_Country> _filtered;

  @override
  void initState() {
    super.initState();
    _filtered = widget.countries;
    _search.addListener(() {
      final q = _search.text.toLowerCase();
      setState(() {
        _filtered = widget.countries
            .where((c) =>
                c.name.toLowerCase().contains(q) || c.dialCode.contains(q))
            .toList();
      });
    });
  }

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: theme.dividerColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Select Country',
            style: GoogleFonts.outfit(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: theme.textTheme.titleLarge?.color),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _search,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: theme.textTheme.bodyLarge?.color,
              ),
              decoration: _inputDecoration(
                context: context,
                hint: 'Search country or code...',
                prefixIcon: HugeIcons.strokeRoundedSearch01,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: _filtered.length,
              itemBuilder: (_, i) {
                final c = _filtered[i];
                final isSelected = c.code == widget.selected.code;
                return ListTile(
                  leading:
                      Text(c.flag, style: const TextStyle(fontSize: 24)),
                  title: Text(
                    c.name,
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight:
                          isSelected ? FontWeight.w700 : FontWeight.w500,
                      color: theme.textTheme.bodyLarge?.color,
                    ),
                  ),
                  trailing: Text(
                    c.dialCode,
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.6)),
                  ),
                  selected: isSelected,
                  selectedTileColor: theme.primaryColor.withValues(alpha: 0.1),
                  onTap: () => Navigator.of(context).pop(c),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}