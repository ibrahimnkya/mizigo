import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../providers/cargo_provider.dart';

class LocationSearchScreen extends StatefulWidget {
  final String title;
  const LocationSearchScreen({super.key, required this.title});

  @override
  State<LocationSearchScreen> createState() => _LocationSearchScreenState();
}

class _LocationSearchScreenState extends State<LocationSearchScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<Map<String, String>> _allSuggestions = [];
  List<Map<String, String>> _filteredSuggestions = [];
  bool _hasQuery = false;
  late AnimationController _animController;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 280),
    );
    _fadeAnim = CurvedAnimation(parent: _animController, curve: Curves.easeOut);
    _animController.forward();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _allSuggestions = _getDynamicSuggestions();
      setState(() => _filteredSuggestions = _allSuggestions);
    });
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _focusNode.dispose();
    _animController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text.trim().toLowerCase();
    setState(() {
      _hasQuery = query.isNotEmpty;
      _filteredSuggestions = query.isEmpty
          ? _allSuggestions
          : _allSuggestions
              .where((s) => s['name']!.toLowerCase().contains(query))
              .toList();
    });
  }

  List<Map<String, String>> _getDynamicSuggestions() {
    final cargoProvider = Provider.of<CargoProvider>(context, listen: false);
    final allAddresses = <String>{};
    for (final cargo in cargoProvider.cargo) {
      if (cargo.fromAddress.isNotEmpty) allAddresses.add(cargo.fromAddress);
      if (cargo.toAddress.isNotEmpty) allAddresses.add(cargo.toAddress);
    }
    return allAddresses.map((addr) => {'name': addr, 'address': ''}).toList();
  }

  Future<void> _submitSearch(String value) async {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return;
    HapticFeedback.lightImpact();
    final result = await context.push<String>('/location-confirm', extra: {
      'title': widget.title,
      'location': trimmed,
    });
    if (result != null && context.mounted) context.pop(result);
  }

  Future<void> _pickOnMap() async {
    HapticFeedback.lightImpact();
    final result = await context.push<String>('/location-confirm', extra: {
      'title': widget.title,
      'location': 'Current Location',
    });
    if (result != null && context.mounted) context.pop(result);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor:
            isDark ? const Color(0xFF0C1220) : const Color(0xFFF5F7FA),
        body: FadeTransition(
          opacity: _fadeAnim,
          child: Column(
            children: [
              _buildUnifiedHeader(isDark),
              // thin separator between white header zone and list body
              Container(
                height: 1,
                color: isDark
                    ? Colors.white.withOpacity(0.06)
                    : const Color(0xFFEAEEF3),
              ),
              Expanded(child: _buildBody(isDark)),
            ],
          ),
        ),
      ),
    );
  }

  // ── Unified Header Search ──────────────────────────────────────────────
  Widget _buildUnifiedHeader(bool isDark) {
    final borderColor = isDark
        ? Colors.white.withValues(alpha: 0.1)
        : const Color(0xFFDDE2EA);
    final hintColor = isDark ? Colors.white38 : const Color(0xFFADB5BD);
    final textColor = isDark ? Colors.white : const Color(0xFF1A2236);

    return SafeArea(
      bottom: false,
      child: Container(
        padding: const EdgeInsets.fromLTRB(8, 8, 20, 16),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF0C1220) : Colors.white,
          border: Border(
            bottom: BorderSide(
              color: isDark ? Colors.white.withValues(alpha: 0.05) : const Color(0xFFEAEEF3),
            ),
          ),
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () => context.pop(),
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedArrowLeft01,
                color: isDark ? Colors.white : const Color(0xFF1A2236),
                size: 22,
              ),
            ),
            Expanded(
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1A2436) : const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                child: Row(
                  children: [
                    const Gap(12),
                    Icon(Icons.search_rounded, size: 20, color: hintColor),
                    const Gap(10),
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        focusNode: _focusNode,
                        autofocus: true,
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: textColor,
                        ),
                        decoration: InputDecoration(
                          hintText: widget.title,
                          hintStyle: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: hintColor,
                          ),
                          border: InputBorder.none,
                          isCollapsed: true,
                        ),
                        onSubmitted: _submitSearch,
                        textInputAction: TextInputAction.search,
                      ),
                    ),
                    if (_hasQuery)
                      GestureDetector(
                        onTap: () {
                          _searchController.clear();
                          _focusNode.requestFocus();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Icon(Icons.close_rounded, size: 18, color: hintColor),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  // ── Body / Suggestions ────────────────────────────────────────────────────
  Widget _buildBody(bool isDark) {
    if (_hasQuery && _filteredSuggestions.isEmpty) {
      return ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [_buildSearchQueryTile(isDark)],
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.only(top: 4, bottom: 32),
      itemCount: _filteredSuggestions.length + (_hasQuery ? 1 : 3),
      itemBuilder: (context, index) {
        if (!_hasQuery) {
          if (index == 0) {
            return _buildLocationTile(
              isDark: isDark,
              icon: HugeIcons.strokeRoundedLocation01,
              name: 'Current Location',
              subtitle: 'Using GPS for highest accuracy',
              iconColor: const Color(0xFF3B82F6),
              iconBgColor: const Color(0xFF3B82F6).withValues(alpha: 0.1),
              onTap: _pickOnMap,
            );
          }
          if (index == 1) {
            return _buildLocationTile(
              isDark: isDark,
              icon: HugeIcons.strokeRoundedMapPin,
              name: 'Pick on map',
              subtitle: 'Drop a pin manually',
              iconColor: const Color(0xFF10B981),
              iconBgColor: const Color(0xFF10B981).withValues(alpha: 0.1),
              onTap: _pickOnMap,
            );
          }
          if (index == 2) return _buildSectionLabel('Recent', isDark);
        }

        final offset = _hasQuery ? 1 : 3;

        // Inline "search for X" first row when query present
        if (_hasQuery && index == 0) {
          return _buildSearchQueryTile(isDark);
        }

        final suggestionIndex = index - offset;
        if (suggestionIndex < 0 || suggestionIndex >= _filteredSuggestions.length) return const SizedBox();

        final item = _filteredSuggestions[suggestionIndex];
        return _buildLocationTile(
          isDark: isDark,
          icon: HugeIcons.strokeRoundedLocation01,
          name: item['name']!,
          subtitle: item['address']!.isEmpty ? 'Recent location' : item['address']!,
          onTap: () => context.pop(item['name']),
        );
      },
    );
  }

  Widget _buildSectionLabel(String label, bool isDark) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 6),
      child: Text(
        label.toUpperCase(),
        style: GoogleFonts.inter(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.0,
          color: isDark ? Colors.white24 : const Color(0xFFADB5BD),
        ),
      ),
    );
  }

  Widget _buildSearchQueryTile(bool isDark) {
    const accent = Color(0xFF3B82F6);
    return _buildLocationTile(
      isDark: isDark,
      icon: HugeIcons.strokeRoundedSearch01,
      name: 'Search "${_searchController.text.trim()}"',
      subtitle: 'Tap to look up this location',
      iconColor: accent,
      iconBgColor: accent.withOpacity(isDark ? 0.14 : 0.09),
      onTap: () => _submitSearch(_searchController.text),
    );
  }

  Widget _buildEmptyState(bool isDark) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: isDark
                  ? Colors.white.withOpacity(0.05)
                  : const Color(0xFFEEF1F6),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              Icons.history_rounded,
              size: 30,
              color: isDark ? Colors.white24 : const Color(0xFFC8CDD8),
            ),
          ),
          const Gap(20),
          Text(
            'No recent locations',
            style: GoogleFonts.outfit(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white38 : const Color(0xFFADB5BD),
            ),
          ),
          const Gap(6),
          Text(
            'Locations you search will appear here',
            style: GoogleFonts.inter(
              fontSize: 13,
              color: isDark ? Colors.white24 : const Color(0xFFC4C9D2),
            ),
          ),
        ],
      ),
    );
  }

  // ── Location Tile ─────────────────────────────────────────────────────────
  Widget _buildLocationTile({
    required bool isDark,
    required dynamic icon,
    required String name,
    required String subtitle,
    required VoidCallback onTap,
    Color? iconColor,
    Color? iconBgColor,
  }) {
    final defBg = isDark
        ? Colors.white.withOpacity(0.07)
        : const Color(0xFFF0F3F7);
    final defIcon =
        isDark ? Colors.white54 : const Color(0xFF8B95A3);
    final titleColor = isDark ? Colors.white : const Color(0xFF1A2236);
    final subColor = isDark ? Colors.white38 : const Color(0xFF8B95A3);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          HapticFeedback.selectionClick();
          onTap();
        },
        splashColor: Colors.transparent,
        highlightColor: isDark
            ? Colors.white.withOpacity(0.03)
            : const Color(0xFF3B82F6).withOpacity(0.04),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: iconBgColor ?? defBg,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: HugeIcon(
                    icon: icon,
                    color: iconColor ?? defIcon,
                    size: 19,
                  ),
                ),
              ),
              const Gap(14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: titleColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Gap(2),
                    Text(
                      subtitle,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: subColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const Gap(8),
              Icon(
                Icons.chevron_right_rounded,
                size: 18,
                color: isDark ? Colors.white24 : const Color(0xFFCDD1D8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}