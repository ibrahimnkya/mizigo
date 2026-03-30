import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:go_router/go_router.dart';
import '../../providers/auth_provider.dart';
import '../../providers/printer_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../providers/cargo_provider.dart';
import '../../theme/app_theme.dart';
import '../../widgets/home/user_board.dart';
import '../../widgets/home/summary_board.dart';
import '../../widgets/home/parcel_card.dart';
import '../../widgets/common/neo_container.dart';
import '../../widgets/common/section_header.dart';
import '../../models/operation_model.dart';

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
    final cargo = context.read<CargoProvider>();
    final auth = context.read<AuthProvider>();
    
    await cargo.fetchMyCargo();
    if (auth.user?.role?.toUpperCase() == 'OPERATOR') {
      await cargo.fetchOperatorStats();
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    final cargo = context.watch<CargoProvider>();
    final printer = context.watch<PrinterProvider>();
    final isOperator = auth.user?.role?.toUpperCase() == 'OPERATOR';

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppTheme.cBlackMain,
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: _refreshData,
            color: AppTheme.cPrimary,
            backgroundColor: const Color(0xFF1E293B),
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
                      child: SummaryBoard(
                        received: cargo.operatorStats['received'] ?? 0,
                        inTransit: cargo.operatorStats['in_transit'] ?? 0,
                        delivered: cargo.operatorStats['delivered'] ?? 0,
                      ),
                    ),
                  ),

                // 4. Operational Actions Grid (Operator Only)
                if (isOperator) ...[
                  const SliverToBoxAdapter(
                    child: SectionHeader(title: "Operator Actions"),
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
                          imagePath: 'assets/images/3d/receive.png',
                          onTap: () => context.push('/receive-cargo'),
                        ),
                        _actionCard(
                          label: 'Send',
                          imagePath: 'assets/images/3d/send.png',
                          onTap: () => context.push('/scanner', extra: ParcelOperation.dispatch),
                        ),
                        _actionCard(
                          label: 'Reports',
                          imagePath: 'assets/images/3d/reports.png',
                          onTap: () => context.push('/operator-reports'),
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

                // 5. Recent Bookings Header
                SliverToBoxAdapter(
                  child: SectionHeader(
                    title: "Recent Bookings",
                    actionLabel: "View All",
                    onAction: () => context.push('/bookings/recent'),
                  ),
                ),

                // 6. Recent Bookings List
                if (cargo.loading && cargo.cargo.isEmpty)
                  const SliverToBoxAdapter(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(40.0),
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  )
                else if (cargo.cargo.isEmpty)
                  SliverToBoxAdapter(child: _buildEmptyState())
                else
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final booking = cargo.cargo[index];
                        return ParcelCard(
                          parcel: booking,
                          onTap: () => context.push(
                            '/bookings/recent/${booking.id}',
                            extra: booking,
                          ),
                        );
                      },
                      childCount: cargo.cargo.length > 3 ? 3 : cargo.cargo.length,
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
    return TextField(
      style: GoogleFonts.inter(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        hintText: 'Search tracking ID, phone...',
        hintStyle: GoogleFonts.inter(color: const Color(0xFF64748B)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.05),
        prefixIcon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: HugeIcon(icon: HugeIcons.strokeRoundedSearch01, color: Color(0xFF94A3B8), size: 20),
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
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B).withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
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
                color: Colors.white,
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
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(20),
            ),
            child: HugeIcon(icon: icon, color: Colors.white, size: 24),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        children: [
          HugeIcon(icon: HugeIcons.strokeRoundedPackage01, color: Colors.white.withValues(alpha: 0.1), size: 64),
          const SizedBox(height: 16),
          const Text(
            'No recent bookings',
            style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          const Text(
            'Start a new shipment to see it here',
            style: TextStyle(color: Color(0xFF64748B), fontSize: 13),
          ),
        ],
      ),
    );
  }
}
