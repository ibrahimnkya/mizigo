import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../services/api_service.dart';
import '../../models/parcel_model.dart';
import '../../models/operation_model.dart';
import '../../widgets/common/shimmer_utils.dart';
import '../../theme/app_theme.dart';

class SendParcelToStationScreen extends StatefulWidget {
  const SendParcelToStationScreen({super.key});

  @override
  State<SendParcelToStationScreen> createState() => _SendParcelToStationScreenState();
}

class _SendParcelToStationScreenState extends State<SendParcelToStationScreen> {
  final _searchController = TextEditingController();
  List<ParcelModel> _warehouseItems = [];
  final Set<String> _selectedItems = {};
  bool _loading = true;
  bool _submitting = false;
  bool _searching = false;
  ParcelModel? _foundParcel;
  String? _selectedTrain;
  String? _selectedGuard;

  final List<String> _mockTrains = ['SGR Express 01', 'Cargo Liner 402', 'LRT Shuttle 09'];
  final List<String> _mockGuards = ['Juma Kapuya', 'Sarah Mwasame', 'Bakari Jenge'];

  @override
  void initState() {
    super.initState();
    _fetchItems();
  }

  Future<void> _fetchItems() async {
    setState(() => _loading = true);
    try {
      final raw = await ApiService.getParcels();
      List<ParcelModel> items = raw
          .map((j) => ParcelModel.fromJson(j))
          .where((c) => 
            c.status == ParcelStatus.received || 
            c.status.name.toUpperCase() == 'RECEIVED' ||
            c.status.displayLabel.toUpperCase() == 'RECEIVED'
          )
          .toList();
      
      setState(() {
        _warehouseItems = items;
      });
    } catch (e) {
      debugPrint('Error fetching warehouse items: $e');
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

  Future<void> _dispatchSelected() async {
    if (_selectedItems.isEmpty || _selectedTrain == null || _selectedGuard == null) return;

    setState(() => _submitting = true);
    try {
      for (final id in _selectedItems) {
        await ApiService.updateParcelStatus(id, 'In Transit', 
          location: 'Loaded on $_selectedTrain (Guard: $_selectedGuard)');
      }
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${_selectedItems.length} items dispatched via $_selectedTrain!'),
            backgroundColor: const Color(0xFF10B981),
          ),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Dispatch Error: $e'), backgroundColor: const Color(0xFFEF4444)),
        );
      }
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Dispatch Parcel',
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
                const HugeIcon(icon: HugeIcons.strokeRoundedSpeedTrain02, color: Color(0xFF3B82F6), size: 24),
                const Gap(12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Station Inventory',
                        style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w700, color: AppTheme.textPrimary),
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
              : _warehouseItems.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    itemCount: _warehouseItems.length,
                    itemBuilder: (context, index) {
                      final item = _warehouseItems[index];
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
                                  ? AppTheme.surface
                                  : AppTheme.background,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: isSelected ? const Color(0xFF3B82F6) : AppTheme.border,
                                width: isSelected ? 2 : 1,
                              ),
                              boxShadow: isSelected ? [
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
                                  activeColor: const Color(0xFF3B82F6),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                ),
                                const Gap(12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '#${item.id.length > 8 ? item.id.substring(0, 8).toUpperCase() : item.id.toUpperCase()}',
                                        style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700, color: const Color(0xFF3B82F6)),
                                      ),
                                      const Gap(4),
                                      Text(
                                        item.toAddress,
                                        style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w600, color: AppTheme.textPrimary),
                                      ),
                                      const Gap(2),
                                      Text(
                                        'Recipient: ${item.receiverName}',
                                        style: GoogleFonts.inter(fontSize: 12, color: AppTheme.textSecondary),
                                      ),
                                    ],
                                  ),
                                ),
                                const HugeIcon(icon: HugeIcons.strokeRoundedPackage, color: Color(0xFF94A3B8), size: 24),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          
          if (_warehouseItems.isNotEmpty)
            Container(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
              decoration: BoxDecoration(
                color: AppTheme.surface,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
                border: const Border(top: BorderSide(color: Color(0xFFE2E8F0))),
                boxShadow: [
                  BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 40, offset: const Offset(0, -10)),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildSelectionContainer(
                          hint: 'Select Train',
                          value: _selectedTrain,
                          items: _mockTrains,
                          onChanged: (val) => setState(() => _selectedTrain = val),
                          icon: Icons.speed,
                        ),
                      ),
                      const Gap(12),
                      Expanded(
                        child: _buildSelectionContainer(
                          hint: 'Select Guard',
                          value: _selectedGuard,
                          items: _mockGuards,
                          onChanged: (val) => setState(() => _selectedGuard = val),
                          icon: Icons.person,
                        ),
                      ),
                    ],
                  ),
                  const Gap(24),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: FilledButton(
                      onPressed: (_selectedItems.isEmpty || _selectedTrain == null || _selectedGuard == null || _submitting) ? null : _dispatchSelected,
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFF3B82F6),
                        disabledBackgroundColor: const Color(0xFFE2E8F0),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      child: _submitting
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text(
                              'Dispatch Selected',
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

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      onSubmitted: (_) => _search(),
      textCapitalization: TextCapitalization.characters,
      style: GoogleFonts.inter(color: AppTheme.textPrimary, fontSize: 16, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        hintText: 'enter Parcel number',
        hintStyle: GoogleFonts.inter(color: AppTheme.textMuted),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
        filled: true,
        fillColor: AppTheme.background,
        prefixIcon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: HugeIcon(icon: HugeIcons.strokeRoundedSearch01, color: Color(0xFF94A3B8), size: 20),
        ),
        suffixIcon: _searching 
          ? const Padding(
              padding: EdgeInsets.all(12.0),
              child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Color(0xFF3B82F6), strokeWidth: 2)),
            )
          : IconButton(
              icon: const HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01, color: Color(0xFF3B82F6)),
              onPressed: _search,
            ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }

  Widget _buildScannerButton() {
    return InkWell(
      onTap: () async {
        final code = await context.push<String>('/scanner', extra: ParcelOperation.dispatch);
        if (code != null) {
          _searchController.text = code;
          _search();
        }
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 52, height: 52,
        decoration: BoxDecoration(
          color: const Color(0xFF3B82F6),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: const Color(0xFF3B82F6).withValues(alpha: 0.3), blurRadius: 10, offset: const Offset(0, 4)),
          ],
        ),
        child: const Center(child: HugeIcon(icon: HugeIcons.strokeRoundedQrCode01, color: Colors.white, size: 24)),
      ),
    );
  }

  Widget _buildFoundParcelCard() {
    final isSelected = _selectedItems.contains(_foundParcel!.id);
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: const Color(0xFF3B82F6), width: 2),
          boxShadow: [
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
                  decoration: BoxDecoration(color: const Color(0xFF3B82F6).withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
                  child: const HugeIcon(icon: HugeIcons.strokeRoundedPackage01, color: Color(0xFF3B82F6), size: 24),
                ),
                const Gap(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('IDENTIFIED SHIPMENT', style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w800, color: const Color(0xFF3B82F6))),
                      Text('#${_foundParcel!.id.toUpperCase()}', style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w700, color: AppTheme.textPrimary)),
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
                    Text('Destination', style: GoogleFonts.inter(fontSize: 11, color: const Color(0xFF64748B))),
                    Text(_foundParcel!.toAddress, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: AppTheme.textPrimary)),
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
                    child: Text(isSelected ? 'Remove' : 'Select for Dispatch', style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 12)),
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HugeIcon(icon: HugeIcons.strokeRoundedDeliveryTruck01, color: const Color(0xFFE2E8F0), size: 80),
          const Gap(24),
          Text(
            'No data is available',
            style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.w700, color: AppTheme.textPrimary),
          ),
          const Gap(8),
          Text(
            'There are currently no "Received" parcels\nwaiting at this station.',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(fontSize: 14, color: AppTheme.textMuted),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectionContainer({
    required String hint,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.border),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF64748B), size: 18),
          const Gap(8),
          Expanded(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: value,
                hint: Text(hint, style: GoogleFonts.inter(fontSize: 12, color: AppTheme.textMuted)),
                isExpanded: true,
                dropdownColor: AppTheme.surface,
                icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Color(0xFF64748B), size: 20),
                items: items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item, style: GoogleFonts.inter(fontSize: 12, color: AppTheme.textPrimary)),
                  );
                }).toList(),
                onChanged: onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
