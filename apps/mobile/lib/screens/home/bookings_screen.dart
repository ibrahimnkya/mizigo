import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../models/parcel_model.dart';
import '../../providers/parcel_provider.dart';
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
        backgroundColor: theme.appBarTheme.backgroundColor ?? theme.primaryColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        titleSpacing: 20,
        leadingWidth: context.canPop() ? 56 : 0,
        leading: context.canPop()
            ? IconButton(
                onPressed: () => context.pop(),
                icon: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: HugeIcon(
                    icon: HugeIcons.strokeRoundedArrowLeft01,
                    size: 16,
                    color: theme.appBarTheme.iconTheme?.color ?? Colors.white,
                  ),
                ),
              )
            : const SizedBox.shrink(),
        title: Row(
          children: [
            Text(
              'My Bookings',
              style: GoogleFonts.outfit(
                fontWeight: FontWeight.w800,
                fontSize: 26,
                color: theme.appBarTheme.titleTextStyle?.color ?? Colors.white,
              ),
            ),
            const Gap(10),
            Consumer<ParcelProvider>(
              builder: (context, provider, _) {
                if (provider.loading || provider.parcels.isEmpty) {
                  return const SizedBox.shrink();
                }
                final isBlueAppBar = theme.appBarTheme.backgroundColor != null && theme.appBarTheme.backgroundColor != Colors.transparent;
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: isBlueAppBar 
                        ? Colors.white.withValues(alpha: 0.2) 
                        : theme.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${provider.parcels.length}',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: isBlueAppBar ? Colors.white : theme.primaryColor,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        centerTitle: false,
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
              // ── Dedicated Premium Search Bar ──
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF1E293B) : Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: isDark ? 0.15 : 0.04),
                        blurRadius: 16,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _searchController,
                    focusNode: _searchFocus,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: isDark ? Colors.white : const Color(0xFF0F172A),
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.transparent,
                      hintText: 'Search by ID, parcel, address…',
                      hintStyle: GoogleFonts.inter(
                        fontSize: 14,
                        color: isDark ? Colors.white30 : const Color(0xFF94A3B8),
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(14),
                        child: HugeIcon(
                          icon: HugeIcons.strokeRoundedSearch01,
                          color: isDark ? Colors.white38 : const Color(0xFF94A3B8),
                          size: 18,
                        ),
                      ),
                      suffixIcon: _searchController.text.isNotEmpty
                          ? IconButton(
                              onPressed: () {
                                _searchController.clear();
                                setState(() {
                                  _searchQuery = '';
                                });
                              },
                              icon: Icon(
                                Icons.close_rounded,
                                size: 18,
                                color: isDark ? Colors.white38 : const Color(0xFF94A3B8),
                              ),
                            )
                          : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide(
                          color: isDark ? Colors.white.withValues(alpha: 0.05) : const Color(0xFFF1F5F9),
                          width: 1.5,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide(
                          color: isDark ? Colors.white.withValues(alpha: 0.05) : const Color(0xFFF1F5F9),
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide(
                          color: theme.primaryColor,
                          width: 1.5,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                    ),
                    textInputAction: TextInputAction.search,
                  ),
                ),
              ),

              // ── Filter chips ──
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                child: Row(
                  children: _filters.map((filter) {
                    final isSelected = _selectedFilter == filter;
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: InkWell(
                        onTap: () => setState(() {
                          _selectedFilter = filter;
                          _pageSize = 20;
                        }),
                        borderRadius: BorderRadius.circular(24),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? theme.primaryColor
                                : (isDark ? const Color(0xFF1E293B) : Colors.white),
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: isSelected
                                  ? theme.primaryColor
                                  : (isDark ? Colors.white.withValues(alpha: 0.05) : const Color(0xFFF1F5F9)),
                              width: 1.5,
                            ),
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                      color: theme.primaryColor.withValues(alpha: 0.25),
                                      blurRadius: 8,
                                      offset: const Offset(0, 3),
                                    )
                                  ]
                                : null,
                          ),
                          child: Text(
                            filter,
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                              color: isSelected
                                  ? Colors.white
                                  : (isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B)),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

              // ── Main Content Area ──
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
        child: Padding(
          padding: const EdgeInsets.all(32),
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
              const Gap(24),
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
              _searchQuery.isNotEmpty ? Icons.search_off_rounded : Icons.inbox_rounded,
              size: 64,
              color: const Color(0xFF94A3B8).withValues(alpha: 0.5),
            ),
            const Gap(16),
            Text(
              _searchQuery.isNotEmpty ? 'No results for "$_searchQuery"' : 'No data is available',
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
              padding: const EdgeInsets.only(bottom: 16, top: 12),
              child: Row(
                children: [
                  Text(
                    entry.key,
                    style: GoogleFonts.outfit(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: isDark ? Colors.white : const Color(0xFF0F172A),
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: isDark ? Colors.white.withValues(alpha: 0.05) : const Color(0xFFF1F5F9),
                    ),
                  ),
                  const Gap(10),
                  HugeIcon(
                    icon: HugeIcons.strokeRoundedCalendar03,
                    color: isDark ? Colors.white38 : const Color(0xFF94A3B8),
                    size: 18,
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

          // ── Load More ──
          if (hasMore)
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 20),
              child: OutlinedButton(
                onPressed: () => setState(() => _pageSize += 20),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: BorderSide(
                    color: isDark ? Colors.white10 : const Color(0xFFE2E8F0),
                    width: 1.5,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.expand_more_rounded,
                      size: 20,
                      color: theme.primaryColor,
                    ),
                    const Gap(6),
                    Text(
                      'Load More Bookings  ·  $remaining Left',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: theme.primaryColor,
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
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

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
                  color: isDark ? const Color(0xFF1E3A5F) : const Color(0xFFEFF6FF),
                  shape: BoxShape.circle,
                  border: Border.all(color: theme.primaryColor, width: 2),
                ),
                child: Icon(
                  Icons.inbox_rounded,
                  size: 56,
                  color: theme.primaryColor,
                ),
              ),
            ),
            const Gap(16),
            Text(
              'No data is available',
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: theme.textTheme.headlineMedium?.color,
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
                  color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
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
                  backgroundColor: theme.primaryColor,
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