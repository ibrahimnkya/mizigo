import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../models/parcel_model.dart';
import '../../providers/parcel_provider.dart';
import '../../widgets/home/premium_ui_components.dart';
import 'recent_bookings_screen.dart'; // for BookingListCard

class BookingsScreen extends StatefulWidget {
  final String? filter;
  const BookingsScreen({super.key, this.filter});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  late String _selectedFilter;
  int _pageSize = 20;
  bool _searchOpen = false;
  final _searchController = TextEditingController();
  final _searchFocus = FocusNode();
  String _searchQuery = '';

  final List<String> _filters = [
    'All',
    'Today',
    'Last 30 days',
    'Last Week',
    'Received',
    'Delivered',
    'In Transit',
    'At Station',
    'Canceled',
  ];

  @override
  void initState() {
    super.initState();
    _selectedFilter = widget.filter != null
        ? (widget.filter!.toLowerCase() == 'today' ? 'Today' : widget.filter!)
        : 'All';
    if (!_filters.contains(_selectedFilter)) {
      _filters.add(_selectedFilter);
    }
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text.trim().toLowerCase();
        _pageSize = 20;
      });
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ParcelProvider>().fetchMyParcels();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  void _toggleSearch() {
    setState(() {
      _searchOpen = !_searchOpen;
      if (!_searchOpen) {
        _searchController.clear();
        _searchQuery = '';
      } else {
        Future.delayed(const Duration(milliseconds: 80), () {
          _searchFocus.requestFocus();
        });
      }
    });
  }

  List<ParcelModel> _applyFilter(List<ParcelModel> all) {
    final now = DateTime.now();
    var list = all.where((c) {
      switch (_selectedFilter) {
        case 'Today':
          return c.createdAt.year == now.year &&
              c.createdAt.month == now.month &&
              c.createdAt.day == now.day;
        case 'Last Week':
          return now.difference(c.createdAt).inDays <= 7;
        case 'Last 30 days':
          return now.difference(c.createdAt).inDays <= 30;
        case 'Received':
          return c.status == ParcelStatus.received;
        case 'Delivered':
          return c.status == ParcelStatus.delivered;
        case 'In Transit':
          return c.status == ParcelStatus.inTransit;
        case 'At Station':
          return c.status == ParcelStatus.atStation;
        case 'Canceled':
          return c.status == ParcelStatus.canceled;
        default:
          return true;
      }
    }).toList();

    // Apply search
    if (_searchQuery.isNotEmpty) {
      list = list.where((c) {
        return c.id.toLowerCase().contains(_searchQuery) ||
            c.parcelType.toLowerCase().contains(_searchQuery) ||
            c.serviceType.toLowerCase().contains(_searchQuery) ||
            c.fromAddress.toLowerCase().contains(_searchQuery) ||
            c.toAddress.toLowerCase().contains(_searchQuery) ||
            c.receiverName.toLowerCase().contains(_searchQuery) ||
            c.receiverPhone.toLowerCase().contains(_searchQuery);
      }).toList();
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        titleSpacing: 20,
        title: _searchOpen
            ? TextField(
                controller: _searchController,
                focusNode: _searchFocus,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isDark ? Colors.white : const Color(0xFF1E293B),
                ),
                decoration: InputDecoration(
                  hintText: 'Search by ID, parcel, address…',
                  hintStyle: GoogleFonts.inter(
                    fontSize: 15,
                    color: const Color(0xFF94A3B8),
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
                textInputAction: TextInputAction.search,
              )
            : Text(
                'Bookings',
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: theme.textTheme.headlineSmall?.color,
                ),
              ),
        backgroundColor: theme.appBarTheme.backgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: _toggleSearch,
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: _searchOpen
                  ? Icon(
                      Icons.close_rounded,
                      key: const ValueKey('close'),
                      color: isDark ? Colors.white : const Color(0xFF1E293B),
                      size: 22,
                    )
                  : Container(
                      key: const ValueKey('search'),
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: theme.dividerColor, width: 1.5),
                      ),
                      child: Center(
                        child: HugeIcon(
                          icon: HugeIcons.strokeRoundedSearch01,
                          color: isDark
                              ? Colors.white
                              : const Color(0xFF1E293B),
                          size: 18,
                        ),
                      ),
                    ),
            ),
          ),
          const Gap(4),
        ],
      ),
      body: Consumer<ParcelProvider>(
        builder: (context, provider, _) {
          final filtered = provider.loading || provider.error != null
              ? <ParcelModel>[]
              : _applyFilter(provider.parcels);
          final paged = filtered.take(_pageSize).toList();
          final hasMore = filtered.length > _pageSize;
          final remaining = filtered.length - _pageSize;

          return Column(
            children: [
              // ── Sub-header: pagination info + filters ─────────────
              Container(
                color: theme.appBarTheme.backgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Pagination / result count strip
                    if (!provider.loading && provider.error == null)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 4, 20, 10),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: isDark
                                    ? const Color(0xFF1E3A5F)
                                    : const Color(0xFFEFF6FF),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                _searchQuery.isNotEmpty
                                    ? '${filtered.length} result${filtered.length == 1 ? '' : 's'}'
                                    : 'Showing ${paged.length} of ${provider.parcels.length}',
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF2563EB),
                                ),
                              ),
                            ),
                            if (_searchQuery.isNotEmpty) ...[
                              const Gap(8),
                              GestureDetector(
                                onTap: () {
                                  _searchController.clear();
                                  _toggleSearch();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isDark
                                        ? const Color(0xFF1C1917)
                                        : const Color(0xFFFFF7ED),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        '"$_searchQuery"',
                                        style: GoogleFonts.inter(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFFD97706),
                                        ),
                                      ),
                                      const Gap(4),
                                      const Icon(
                                        Icons.close_rounded,
                                        size: 12,
                                        color: Color(0xFFD97706),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),

                    // Filter chips
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                      child: Row(
                        children: _filters.map((filter) {
                          final isSelected = _selectedFilter == filter;
                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: InkWell(
                              onTap: () => setState(() {
                                _selectedFilter = filter;
                                _pageSize = 20;
                              }),
                              borderRadius: BorderRadius.circular(24),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 12,
                                ),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? theme.primaryColor
                                      : theme.cardColor,
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Text(
                                  filter,
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: isSelected
                                        ? FontWeight.w700
                                        : FontWeight.w600,
                                    color: isSelected
                                        ? Colors.white
                                        : const Color(0xFF64748B),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),

              // ── List ─────────────────────────────────────────────────
              Expanded(
                child: _buildContent(
                  provider: provider,
                  theme: theme,
                  isDark: isDark,
                  filtered: filtered,
                  paged: paged,
                  hasMore: hasMore,
                  remaining: remaining,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildContent({
    required ParcelProvider provider,
    required ThemeData theme,
    required bool isDark,
    required List<ParcelModel> filtered,
    required List<ParcelModel> paged,
    required bool hasMore,
    required int remaining,
  }) {
    if (provider.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.cloud_off_rounded,
              size: 56,
              color: Color(0xFF94A3B8),
            ),
            const Gap(16),
            Text(
              'Could not load bookings',
              style: GoogleFonts.outfit(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF64748B),
              ),
            ),
            const Gap(8),
            Text(
              provider.error!,
              style: GoogleFonts.inter(
                fontSize: 13,
                color: const Color(0xFF94A3B8),
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(20),
            ElevatedButton.icon(
              onPressed: provider.fetchMyParcels,
              icon: const Icon(Icons.refresh_rounded),
              label: Text(
                'Retry',
                style: GoogleFonts.outfit(fontWeight: FontWeight.w700),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3B82F6),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      );
    }

    if (_selectedFilter == 'Upcoming' && filtered.isEmpty) {
      return const _EmptyBookingsState();
    }

    if (filtered.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _searchQuery.isNotEmpty
                  ? Icons.search_off_rounded
                  : Icons.inbox_rounded,
              size: 64,
              color: const Color(0xFF94A3B8).withValues(alpha: 0.5),
            ),
            const Gap(16),
            Text(
              _searchQuery.isNotEmpty
                  ? 'No results for "$_searchQuery"'
                  : 'No bookings found',
              style: GoogleFonts.outfit(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF64748B),
              ),
              textAlign: TextAlign.center,
            ),
            if (_searchQuery.isNotEmpty) ...[
              const Gap(8),
              Text(
                'Try a different search term or filter',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: const Color(0xFF94A3B8),
                ),
              ),
            ],
          ],
        ),
      );
    }

    // Group paged results by month
    final grouped = <String, List<ParcelModel>>{};
    for (final c in paged) {
      final key = DateFormat('MMMM yyyy').format(c.createdAt);
      grouped.putIfAbsent(key, () => []).add(c);
    }

    return RefreshIndicator(
      onRefresh: () async {
        setState(() => _pageSize = 20);
        await provider.fetchMyParcels();
      },
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          for (final entry in grouped.entries) ...[
            Padding(
              padding: const EdgeInsets.only(bottom: 16, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    entry.key,
                    style: GoogleFonts.outfit(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: theme.textTheme.titleLarge?.color,
                    ),
                  ),
                  const HugeIcon(
                    icon: HugeIcons.strokeRoundedCalendar03,
                    color: Color(0xFF64748B),
                    size: 20,
                  ),
                ],
              ),
            ),
            for (final parcel in entry.value)
              Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: BookingListCard(
                  parcel: parcel,
                  isDark: isDark,
                  onTap: () => context.push(
                    '/bookings/recent/${parcel.id}',
                    extra: parcel,
                  ),
                ),
              ),
          ],

          // ── Load More ────────────────────────────────────────────
          if (hasMore)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: TextButton(
                onPressed: () => setState(() => _pageSize += 20),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(
                      color: isDark
                          ? Colors.white12
                          : const Color(0xFFE2E8F0),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.expand_more_rounded,
                      size: 18,
                      color: Color(0xFF3B82F6),
                    ),
                    const Gap(6),
                    Text(
                      'Load more  ·  $remaining remaining',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF3B82F6),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ─── Empty state ──────────────────────────────────────────────────────────────

class _EmptyBookingsState extends StatelessWidget {
  const _EmptyBookingsState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/upcoming_empty.png',
              width: 240,
              height: 240,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF3B82F6), width: 2),
                ),
                child: const Icon(
                  Icons.inbox_rounded,
                  size: 56,
                  color: Color(0xFF3B82F6),
                ),
              ),
            ),
            const Gap(12),
            Text(
              'No Upcoming Deliveries',
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: Theme.of(context).textTheme.headlineMedium?.color,
              ),
            ),
            const Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'You don\'t have any deliveries planned at the moment. Create a new booking to get started.',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF64748B),
                  height: 1.6,
                ),
              ),
            ),
            const Gap(32),
            SizedBox(
              width: double.infinity,
              height: 58,
              child: ElevatedButton(
                onPressed: () => context.push('/send-package'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3B82F6),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: const StadiumBorder(),
                  textStyle: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                child: const Text('Book a Delivery'),
              ),
            ),
            const Gap(40),
          ],
        ),
      ),
    );
  }
}