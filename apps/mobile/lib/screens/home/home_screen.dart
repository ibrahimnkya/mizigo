import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:go_router/go_router.dart';
import '../../providers/auth_provider.dart';
import '../../providers/printer_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../providers/parcel_provider.dart';
import '../../theme/app_theme.dart';
import '../../widgets/home/user_board.dart';
import '../../widgets/home/summary_board.dart';
import '../../widgets/home/parcel_card.dart';
import '../../widgets/common/section_header.dart';
import '../../models/operation_model.dart';
import '../../widgets/common/shimmer_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refreshData();
    });
  }
  Future<void> _refreshData() async {
    final parcel = context.read<ParcelProvider>();
    final auth = context.read<AuthProvider>();

    await parcel.fetchMyParcels();
    if (auth.user?.isStaff ?? false) {
      await parcel.fetchOperatorStats();
    }
  }
  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    final parcel = context.watch<ParcelProvider>();
    final printer = context.watch<PrinterProvider>();
    final isOperator = auth.user?.isStaff ?? false;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: _refreshData,
            color: AppTheme.cPrimary,
            backgroundColor: AppTheme.surface,
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                // 1. Header with User Info
                SliverToBoxAdapter(
                  child: UserBoard(
                    userName: auth.user?.name ?? 'User',
                    onTap: () => context.push('/profile'),
                    printerConnected: printer.isConnected,
                    isPrinterLoading: printer.isLoading,
                    onPrinterTap: () => context.push('/profile/printer-settings'),
                  ),
                ),
                // 2. Search & Scanner Row
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Row(
                      children: [
                        Expanded(child: _buildSearchField()),
                        const SizedBox(width: 12),
                        _buildScannerButton(),
                      ],
                    ),
                  ),
                ),
                // 3. Command Center / Stats (Operator Only)
                if (isOperator)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: ShimmerLoading(
                        isLoading: parcel.loading && parcel.operatorStats.isEmpty,
                        child: parcel.loading && parcel.operatorStats.isEmpty
                            ? Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: const BoxSkeleton(height: 120, borderRadius: 24),
                              )
                            : SummaryBoard(
                                received: parcel.operatorStats['received'] ?? 0,
                                inTransit: parcel.operatorStats['in_transit'] ?? 0,
                                delivered: parcel.operatorStats['delivered'] ?? 0,
                              ),
                      ),
                    ),
                  ),
                // 4. Operational Actions Grid (Operator Only)
                if (isOperator) ...[
                  const SliverToBoxAdapter(
                    child: SectionHeader(title: "Staff Actions"),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    sliver: SliverGrid(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.85,
                      ),
                      delegate: SliverChildListDelegate([
                        _actionCard(
                          label: 'Receive',
                          imagePath: 'assets/images/3d_receive.png',
                          onTap: () => context.push('/receive-parcel'),
                        ),
                        _actionCard(
                          label: 'Send',
                          imagePath: 'assets/images/3d_send.png',
                          onTap: () => context.push('/scanner', extra: ParcelOperation.dispatch),
                        ),
                        _actionCard(
                          label: 'Deliver',
                          imagePath: 'assets/images/3d_deliver.png',
                          onTap: () => context.push('/scanner', extra: ParcelOperation.deliver),
                        ),
                      ]),
                    ),
                  ),
                ] else ...[
                  // Consumer/Default Flow (Optional/Static for now)
                  const SliverToBoxAdapter(
                    child: SectionHeader(title: "Quick Actions"),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    sliver: SliverGrid(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.9,
                      ),
                      delegate: SliverChildListDelegate([
                        _quickAction(
                          label: 'Track',
                          icon: HugeIcons.strokeRoundedSearch01,
                          onTap: () => context.go('/track'),
                        ),
                        _quickAction(
                          label: 'Rates',
                          icon: HugeIcons.strokeRoundedMoney02,
                          onTap: () => context.push('/rates-calculator'),
                        ),
                        _quickAction(
                          label: 'Support',
                          icon: HugeIcons.strokeRoundedCustomerService,
                          onTap: () => context.push('/support'),
                        ),
                      ]),
                    ),
                  ),
                ],
                // 5. Recent Parcels / Bookings List
                SliverToBoxAdapter(
                  child: SectionHeader(
                    title: isOperator ? "Recent Shipments" : "Track Parcels",
                    actionLabel: "View all",
                    onAction: () => context.go('/bookings'),
                  ),
                ),
                // 6. Recent Bookings List
                if (parcel.loading && parcel.parcels.isEmpty)
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => ShimmerLoading(
                        isLoading: true,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          child: const BoxSkeleton(height: 100, borderRadius: 20),
                        ),
                      ),
                      childCount: 3,
                    ),
                  )
                else if (parcel.parcels.isEmpty)
                  SliverToBoxAdapter(child: _buildEmptyState())
                else
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final booking = parcel.parcels[index];
                        return ParcelCard(
                          parcel: booking,
                          onTap: () => context.push(
                            '/bookings/recent/${booking.id}',
                            extra: booking,
                          ),
                        );
                      },
                      childCount: parcel.parcels.length > 3 ? 3 : parcel.parcels.length,
                    ),
                  ),
                // Bottom Padding
                const SliverToBoxAdapter(child: SizedBox(height: 32)),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildSearchField() {
    final theme = Theme.of(context);
    return TextField(
      style: GoogleFonts.inter(
        color: theme.textTheme.bodyLarge?.color ?? AppTheme.textPrimary,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        hintText: 'enter Parcel number',
        hintStyle: GoogleFonts.inter(
          color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.5) ?? AppTheme.textMuted,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: theme.colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: theme.colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: theme.colorScheme.primary, width: 2),
        ),
        filled: true,
        fillColor: theme.cardTheme.color ?? theme.colorScheme.surface,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: HugeIcon(
            icon: HugeIcons.strokeRoundedSearch01,
            color: theme.textTheme.bodySmall?.color ?? AppTheme.textSecondary,
            size: 20,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }
  Widget _buildScannerButton() {
    return InkWell(
      onTap: () => context.push('/scanner', extra: ParcelOperation.view),
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          color: AppTheme.cPrimary,
          borderRadius: BorderRadius.circular(16), // Changed circular to 16px matching theme
          boxShadow: [
            BoxShadow(
              color: AppTheme.cPrimary.withValues(alpha: 0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Center(
          child: HugeIcon(
            icon: HugeIcons.strokeRoundedQrCode01,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
    );
  }
  Widget _actionCard({
    required String label,
    required String imagePath,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: theme.cardTheme.color?.withValues(alpha: 0.8) ?? AppTheme.surface.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: theme.colorScheme.outline.withValues(alpha: 0.2)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: GoogleFonts.outfit(
                color: theme.textTheme.bodyLarge?.color ?? AppTheme.textPrimary,
                fontWeight: FontWeight.w700,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _quickAction({required String label, required dynamic icon, required VoidCallback onTap}) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.cardTheme.color ?? AppTheme.surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: theme.colorScheme.outline.withValues(alpha: 0.2)),
            ),
            child: HugeIcon(
              icon: icon,
              color: theme.iconTheme.color ?? AppTheme.textPrimary,
              size: 24,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.inter(
              color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.8) ?? AppTheme.textSecondary,
              fontSize: 12, 
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildEmptyState() {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        children: [
          HugeIcon(
            icon: HugeIcons.strokeRoundedPackage01,
            color: theme.iconTheme.color?.withValues(alpha: 0.2) ?? Colors.black26,
            size: 64,
          ),
          const SizedBox(height: 16),
          Text(
            'No recent bookings',
            style: GoogleFonts.inter(
              color: theme.textTheme.bodyLarge?.color ?? AppTheme.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Start a new shipment to see it here',
            style: GoogleFonts.inter(
              color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.5) ?? AppTheme.textMuted,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
