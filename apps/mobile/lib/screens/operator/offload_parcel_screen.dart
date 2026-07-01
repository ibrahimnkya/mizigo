import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../services/api_service.dart';
import '../../models/parcel_model.dart';
import '../../models/operation_model.dart';
import '../../widgets/common/shimmer_utils.dart';

class OffloadParcelScreen extends StatefulWidget {
  const OffloadParcelScreen({super.key});

  @override
  State<OffloadParcelScreen> createState() => _OffloadParcelScreenState();
}

class _OffloadParcelScreenState extends State<OffloadParcelScreen> {
  final _searchController = TextEditingController();
  List<ParcelModel> _transitItems = [];
  final Set<String> _selectedItems = {};
  bool _loading = true;
  bool _submitting = false;
  bool _searching = false;
  ParcelModel? _foundParcel;

  final List<String> _mockClerks = ['Kassim Majaliwa', 'Neema Shayo', 'Said Mwema'];
  String? _selectedClerk;

  @override
  void initState() {
    super.initState();
    _fetchTransitItems();
  }

  Future<void> _fetchTransitItems() async {
    setState(() => _loading = true);
    try {
      final raw = await ApiService.getParcels();
      List<ParcelModel> items = raw
          .map((j) => ParcelModel.fromJson(j))
          .where((c) => 
            c.status == ParcelStatus.inTransit || 
            c.status == ParcelStatus.dispatched ||
            c.status.name.toUpperCase() == 'IN_TRANSIT' ||
            c.status.displayLabel.toUpperCase() == 'IN TRANSIT'
          )
          .toList();
      
      setState(() {
        _transitItems = items;
      });
    } catch (e) {
      debugPrint('Error fetching transit items: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

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

  Future<void> _offloadSelected() async {
    if (_selectedItems.isEmpty || _selectedClerk == null) return;

    setState(() => _submitting = true);
    try {
      for (final id in _selectedItems) {
        await ApiService.updateParcelStatus(id, 'Offloaded', 
          location: 'Arrived at destination. Received by Clerk: $_selectedClerk');
      }
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${_selectedItems.length} items offloaded by $_selectedClerk!'),
            backgroundColor: const Color(0xFF10B981),
          ),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Offload Error: $e'), backgroundColor: const Color(0xFFEF4444)),
        );
      }
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Offload Parcel',
          style: GoogleFonts.outfit(fontWeight: FontWeight.w700, color: Colors.white),
        ),
        leading: IconButton(
          icon: const HugeIcon(icon: HugeIcons.strokeRoundedArrowLeft01, color: Colors.white, size: 20),
          onPressed: () => context.pop(),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              children: [
                Expanded(child: _buildSearchField()),
                const Gap(12),
                _buildScannerButton(),
              ],
            ),
          ),
          
          if (_foundParcel != null)
             _buildFoundParcelCard(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              children: [
                const HugeIcon(icon: HugeIcons.strokeRoundedPackageReceive, color: Color(0xFF6366F1), size: 24),
                const Gap(12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Incoming Shipments',
                        style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w700, color: isDark ? Colors.white : const Color(0xFF0F172A)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          Expanded(
            child: _loading 
              ? ShimmerLoading(
                  isLoading: true,
                  child: const ListSkeleton(height: 100, padding: 24),
                )
              : _transitItems.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    itemCount: _transitItems.length,
                    itemBuilder: (context, index) {
                      final item = _transitItems[index];
                      final isSelected = _selectedItems.contains(item.id);
                      
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                _selectedItems.remove(item.id);
                              } else {
                                _selectedItems.add(item.id);
                              }
                            });
                          },
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: isSelected 
                                  ? (isDark ? const Color(0xFF1E293B) : Colors.white) 
                                  : (isDark ? const Color(0xFF1E293B).withValues(alpha: 0.5) : const Color(0xFFF8FAFC)),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: isSelected ? const Color(0xFF6366F1) : (isDark ? Colors.white.withValues(alpha: 0.05) : const Color(0xFFE2E8F0)),
                                width: isSelected ? 2 : 1,
                              ),
                              boxShadow: isSelected && !isDark ? [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.05),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ] : null,
                            ),
                            child: Row(
                              children: [
                                Checkbox(
                                  value: isSelected,
                                  onChanged: (v) {
                                    setState(() {
                                      if (v!) {
                                        _selectedItems.add(item.id);
                                      } else {
                                        _selectedItems.remove(item.id);
                                      }
                                    });
                                  },
                                  activeColor: const Color(0xFF6366F1),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                ),
                                const Gap(12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '#${item.id.length > 8 ? item.id.substring(0, 8).toUpperCase() : item.id.toUpperCase()}',
                                        style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700, color: const Color(0xFF6366F1)),
                                      ),
                                      const Gap(4),
                                      Text(
                                        'From: ${item.fromAddress}',
                                        style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w600, color: isDark ? Colors.white : const Color(0xFF0F172A)),
                                      ),
                                      const Gap(2),
                                      Text(
                                        'Recipient: ${item.receiverName}',
                                        style: GoogleFonts.inter(fontSize: 12, color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B)),
                                      ),
                                    ],
                                  ),
                                ),
                                const HugeIcon(icon: HugeIcons.strokeRoundedPackage01, color: Color(0xFF94A3B8), size: 24),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          
          if (_transitItems.isNotEmpty)
            Container(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF1E293B) : Colors.white,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
                border: isDark ? null : const Border(top: BorderSide(color: Color(0xFFE2E8F0))),
                boxShadow: [
                  BoxShadow(color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.05), blurRadius: 40, offset: const Offset(0, -10)),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildClerkDropdown(),
                      ),
                      const Gap(16),
                      Text(
                        '${_selectedItems.length} selected',
                        style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B)),
                      ),
                    ],
                  ),
                  const Gap(24),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: FilledButton(
                      onPressed: (_selectedItems.isEmpty || _selectedClerk == null || _submitting) ? null : _offloadSelected,
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFF6366F1),
                        disabledBackgroundColor: isDark ? const Color(0xFF1E293B) : const Color(0xFFE2E8F0),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      child: _submitting
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text(
                              'Confirm Offload',
                              style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 16),
                            ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildClerkDropdown() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isDark ? Colors.white.withValues(alpha: 0.1) : const Color(0xFFE2E8F0)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedClerk,
          hint: Text('Select Clerk', style: GoogleFonts.inter(fontSize: 14, color: isDark ? const Color(0xFF64748B) : const Color(0xFF94A3B8))),
          isExpanded: true,
          dropdownColor: isDark ? const Color(0xFF1E293B) : Colors.white,
          icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Color(0xFF64748B)),
          items: _mockClerks.map((String clerk) {
            return DropdownMenuItem<String>(
              value: clerk,
              child: Text(clerk, style: GoogleFonts.inter(fontSize: 14, color: isDark ? Colors.white : const Color(0xFF0F172A))),
            );
          }).toList(),
          onChanged: (val) => setState(() => _selectedClerk = val),
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return TextField(
      controller: _searchController,
      onSubmitted: (_) => _search(),
      textCapitalization: TextCapitalization.characters,
      style: GoogleFonts.inter(color: isDark ? Colors.white : const Color(0xFF0F172A), fontSize: 16, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        hintText: 'enter Parcel number',
        hintStyle: GoogleFonts.inter(color: isDark ? const Color(0xFF64748B) : const Color(0xFF94A3B8)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
        filled: true,
        fillColor: isDark ? Colors.white.withValues(alpha: 0.05) : const Color(0xFFF1F5F9),
        prefixIcon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: HugeIcon(icon: HugeIcons.strokeRoundedSearch01, color: Color(0xFF94A3B8), size: 20),
        ),
        suffixIcon: _searching 
          ? const Padding(
              padding: EdgeInsets.all(12.0),
              child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Color(0xFF6366F1), strokeWidth: 2)),
            )
          : IconButton(
              icon: const HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01, color: Color(0xFF6366F1)),
              onPressed: _search,
            ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }

  Widget _buildScannerButton() {
    return InkWell(
      onTap: () async {
        final code = await context.push<String>('/scanner', extra: ParcelOperation.offload);
        if (code != null) {
          _searchController.text = code;
          _search();
        }
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 52, height: 52,
        decoration: BoxDecoration(
          color: const Color(0xFF6366F1),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: const Color(0xFF6366F1).withValues(alpha: 0.3), blurRadius: 10, offset: const Offset(0, 4)),
          ],
        ),
        child: const Center(child: HugeIcon(icon: HugeIcons.strokeRoundedQrCode01, color: Colors.white, size: 24)),
      ),
    );
  }

  Widget _buildFoundParcelCard() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isSelected = _selectedItems.contains(_foundParcel!.id);
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E293B) : Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: const Color(0xFF6366F1), width: 2),
          boxShadow: isDark ? null : [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 15,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: const Color(0xFF6366F1).withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
                  child: const HugeIcon(icon: HugeIcons.strokeRoundedPackage01, color: Color(0xFF6366F1), size: 24),
                ),
                const Gap(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('IDENTIFIED SHIPMENT', style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w800, color: const Color(0xFF6366F1))),
                      Text('#${_foundParcel!.id.toUpperCase()}', style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w700, color: isDark ? Colors.white : const Color(0xFF0F172A))),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => setState(() => _foundParcel = null),
                  icon: const Icon(Icons.close, color: Color(0xFF64748B), size: 20),
                ),
              ],
            ),
            const Gap(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Origin', style: GoogleFonts.inter(fontSize: 11, color: const Color(0xFF64748B))),
                    Text(_foundParcel!.fromAddress, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: isDark ? Colors.white : const Color(0xFF0F172A))),
                  ],
                ),
                SizedBox(
                  height: 40,
                  child: FilledButton(
                    onPressed: () {
                      setState(() {
                        if (isSelected) {
                          _selectedItems.remove(_foundParcel!.id);
                        } else {
                          _selectedItems.add(_foundParcel!.id);
                        }
                      });
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: isSelected ? const Color(0xFFEF4444) : const Color(0xFF10B981),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text(isSelected ? 'Remove' : 'Select for Offload', style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 12)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HugeIcon(icon: HugeIcons.strokeRoundedPackageReceive, color: isDark ? const Color(0xFF1E293B) : const Color(0xFFE2E8F0), size: 80),
          const Gap(24),
          Text(
            'No data is available',
            style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.w700, color: isDark ? Colors.white : const Color(0xFF0F172A)),
          ),
          const Gap(8),
          Text(
            'There are currently no parcels in transit\nto this station.',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(fontSize: 14, color: isDark ? const Color(0xFF64748B) : const Color(0xFF94A3B8)),
          ),
        ],
      ),
    );
  }
}
