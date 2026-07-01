import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:go_router/go_router.dart';
import '../../models/parcel_model.dart';
import '../../models/operation_model.dart';
import '../../services/api_service.dart';
import '../../theme/app_theme.dart';
import '../../widgets/common/shimmer_utils.dart';

class DeliverParcelScreen extends StatefulWidget {
  const DeliverParcelScreen({super.key});

  @override
  State<DeliverParcelScreen> createState() => _DeliverParcelScreenState();
}

class _DeliverParcelScreenState extends State<DeliverParcelScreen> {
  final _searchController = TextEditingController();
  ParcelModel? _foundParcel;
  bool _searching = false;
  bool _delivering = false;

  Future<void> _search() async {
    if (_searchController.text.isEmpty) return;
    
    setState(() {
      _searching = true;
      _foundParcel = null;
    });

    try {
      final results = await ApiService.searchParcel(_searchController.text);
      if (results.isNotEmpty) {
        setState(() {
          _foundParcel = ParcelModel.fromJson(results.first);
        });
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No parcel found with this ID'), backgroundColor: Color(0xFFEF4444)),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Search Error: $e'), backgroundColor: const Color(0xFFEF4444)),
        );
      }
    } finally {
      if (mounted) setState(() => _searching = false);
    }
  }

  Future<void> _showOtpDialog() async {
    final otpController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
        title: Text('Enter Handover Code', style: GoogleFonts.outfit(color: AppTheme.textPrimary, fontWeight: FontWeight.bold)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Ask the recipient for the 4-digit code sent to their phone.',
              style: GoogleFonts.inter(color: AppTheme.textSecondary, fontSize: 13)),
            const Gap(20),
            TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              maxLength: 4,
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(color: AppTheme.textPrimary, fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 8),
              decoration: InputDecoration(
                counterText: '',
                filled: true,
                fillColor: AppTheme.background,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () async {
              final otp = otpController.text;
              Navigator.pop(context);
              _finalizeDelivery(otp);
            },
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF10B981), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
            child: const Text('Verify & Deliver', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Future<void> _finalizeDelivery(String otp) async {
    if (_foundParcel == null) return;

    setState(() => _delivering = true);
    try {
      await ApiService.deliverParcel(_foundParcel!.id, otp);
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Parcel successfully delivered!'),
            backgroundColor: Color(0xFF10B981),
          ),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: const Color(0xFFEF4444)),
        );
      }
    } finally {
      if (mounted) setState(() => _delivering = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Deliver Parcel',
          style: GoogleFonts.outfit(fontWeight: FontWeight.w700, color: Colors.white),
        ),
        leading: IconButton(
          icon: const HugeIcon(icon: HugeIcons.strokeRoundedArrowLeft01, color: Colors.white, size: 20),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            onPressed: () => _showHelp(context),
            icon: const HugeIcon(
              icon: HugeIcons.strokeRoundedHelpCircle,
              color: Colors.white,
              size: 22,
            ),
          ),
          const Gap(8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: _buildSearchField()),
                const Gap(12),
                _buildScannerButton(),
              ],
            ),
            
            if (_searching)
              const Padding(
                padding: EdgeInsets.only(top: 32),
                child: ShimmerLoading(
                  isLoading: true,
                  child: BoxSkeleton(height: 180, borderRadius: 24),
                ),
              )
            else if (_foundParcel != null) ...[
              const Gap(32),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppTheme.surface,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: const Color(0xFF3B82F6),
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 15,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFF3B82F6).withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'IDENTIFIED SHIPMENT',
                            style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w800, color: const Color(0xFF3B82F6)),
                          ),
                        ),
                        IconButton(
                          onPressed: () => setState(() => _foundParcel = null),
                          icon: const Icon(Icons.close, color: Color(0xFF64748B), size: 20),
                        ),
                      ],
                    ),
                    const Gap(16),
                    Text(
                      _foundParcel!.receiverName,
                      style: GoogleFonts.outfit(fontSize: 22, fontWeight: FontWeight.w700, color: AppTheme.textPrimary),
                    ),
                    Text(
                      _foundParcel!.receiverPhone,
                      style: GoogleFonts.inter(fontSize: 14, color: AppTheme.textSecondary),
                    ),
                    const Gap(16),
                    Divider(color: AppTheme.border),
                    const Gap(16),
                    _buildDetailRow(HugeIcons.strokeRoundedPackage, 'Description', _foundParcel!.description),
                    const Gap(12),
                    _buildDetailRow(HugeIcons.strokeRoundedLocation01, 'Destination', _foundParcel!.toAddress),
                    const Gap(12),
                    _buildDetailRow(HugeIcons.strokeRoundedCircleArrowDownDouble, 'Status', _foundParcel!.status.displayLabel),
                    
                    const Gap(32),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: FilledButton(
                        onPressed: _delivering ? null : _showOtpDialog,
                        style: FilledButton.styleFrom(
                          backgroundColor: const Color(0xFF10B981),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        ),
                        child: _delivering
                            ? const CircularProgressIndicator(color: Colors.white)
                            : Text(
                                'Mark as Delivered',
                                style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 16),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      onSubmitted: (_) => _search(),
      textCapitalization: TextCapitalization.characters,
      style: GoogleFonts.inter(color: AppTheme.textPrimary, fontSize: 16, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        hintText: 'enter Parcel number',
        hintStyle: GoogleFonts.inter(color: AppTheme.textMuted),
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
        fillColor: AppTheme.background,
        prefixIcon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: HugeIcon(icon: HugeIcons.strokeRoundedSearch01, color: Color(0xFF94A3B8), size: 20),
        ),
        suffixIcon: _searching 
          ? Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: AppTheme.cPrimary, strokeWidth: 2)),
            )
          : IconButton(
              icon: HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01, color: AppTheme.cPrimary),
              onPressed: _search,
            ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }

  Widget _buildScannerButton() {
    return InkWell(
      onTap: () async {
        final code = await context.push<String>('/scanner', extra: ParcelOperation.deliver);
        if (code != null) {
          _searchController.text = code;
          _search();
        }
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          color: AppTheme.cPrimary,
          borderRadius: BorderRadius.circular(16),
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

  Widget _buildDetailRow(List<List<dynamic>> icon, String label, String value) {
    return Row(
      children: [
        HugeIcon(icon: icon, color: const Color(0xFF64748B), size: 18),
        const Gap(12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: GoogleFonts.inter(fontSize: 11, color: const Color(0xFF64748B), fontWeight: FontWeight.w600)),
            Text(value, style: GoogleFonts.inter(fontSize: 14, color: AppTheme.textPrimary, fontWeight: FontWeight.w500)),
          ],
        ),
      ],
    );
  }

  void _showHelp(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
          border: Border.all(color: AppTheme.border),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(8),
            Center(child: Container(width: 40, height: 4, decoration: BoxDecoration(color: AppTheme.border, borderRadius: BorderRadius.circular(2)))),
            const Gap(24),
            Text(
              'Delivery Guide',
              style: GoogleFonts.outfit(fontSize: 24, fontWeight: FontWeight.w800, color: AppTheme.textPrimary),
            ),
            const Gap(8),
            Text(
              'Follow these steps to ensure secure parcel handover.',
              style: GoogleFonts.inter(color: AppTheme.textSecondary, fontSize: 14),
            ),
            const Gap(32),
            Expanded(
              child: ListView(
                children: [
                  _helpItem(
                    'Search & Verify',
                    'Enter the Tracking ID or scan the QR code to find the exact parcel in the system.',
                    HugeIcons.strokeRoundedSearch01,
                  ),
                  _helpItem(
                    'Identity Check',
                    'Always ask for a National ID or Driving License to verify the receiver\'s identity.',
                    HugeIcons.strokeRoundedUser,
                  ),
                  _helpItem(
                    'Payment Status',
                    'For "Receiver Pays" parcels, ensure the amount is paid in full before releasing the package.',
                    HugeIcons.strokeRoundedCoins01,
                  ),
                  _helpItem(
                    'Finalize Handover',
                    'Click "Mark as Delivered" to complete the process. Both parties will be notified via SMS.',
                    HugeIcons.strokeRoundedCheckmarkBadge01,
                  ),
                ],
              ),
            ),
            const Gap(16),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: FilledButton(
                onPressed: () => Navigator.pop(context),
                style: FilledButton.styleFrom(
                  backgroundColor: AppTheme.cPrimary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: Text('Got it', style: GoogleFonts.inter(fontWeight: FontWeight.w800, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _helpItem(String title, String desc, dynamic icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.background,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppTheme.border),
            ),
            child: HugeIcon(icon: icon, color: AppTheme.cPrimary, size: 22),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w700, color: AppTheme.textPrimary),
                ),
                const Gap(4),
                Text(
                  desc,
                  style: GoogleFonts.inter(fontSize: 13, color: AppTheme.textSecondary, height: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
