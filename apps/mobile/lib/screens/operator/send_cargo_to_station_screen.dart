import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../services/api_service.dart';
import '../../models/cargo_model.dart';

class SendCargoToStationScreen extends StatefulWidget {
  const SendCargoToStationScreen({super.key});

  @override
  State<SendCargoToStationScreen> createState() => _SendCargoToStationScreenState();
}

class _SendCargoToStationScreenState extends State<SendCargoToStationScreen> {
  List<CargoModel> _warehouseItems = [];
  final Set<String> _selectedItems = {};
  bool _loading = true;
  bool _submitting = false;

  @override
  void initState() {
    super.initState();
    _fetchItems();
  }

  Future<void> _fetchItems() async {
    setState(() => _loading = true);
    try {
      final raw = await ApiService.getCargo();
      setState(() {
        _warehouseItems = raw
            .map((j) => CargoModel.fromJson(j))
            .where((c) => c.status.name.toLowerCase() == 'at_warehouse' || c.status.displayLabel.toLowerCase() == 'at warehouse')
            .toList();
      });
    } catch (e) {
      debugPrint('Error fetching warehouse items: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  Future<void> _dispatchSelected() async {
    if (_selectedItems.isEmpty) return;

    setState(() => _submitting = true);
    try {
      for (final id in _selectedItems) {
        await ApiService.updateCargoStatus(id, 'In Transit', location: 'En route to next terminal');
      }
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${_selectedItems.length} items dispatched for transport!'),
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
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Dispatch Cargo',
          style: GoogleFonts.outfit(fontWeight: FontWeight.w700, color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 20),
          onPressed: () => context.pop(),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                const HugeIcon(icon: HugeIcons.strokeRoundedSpeedTrain02, color: Color(0xFF3B82F6), size: 32),
                const Gap(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Station Inventory',
                        style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
                      ),
                      Text(
                        'Select items to load onto the transport vehicle.',
                        style: GoogleFonts.inter(fontSize: 13, color: const Color(0xFF94A3B8)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          Expanded(
            child: _loading 
              ? const Center(child: CircularProgressIndicator(color: Color(0xFF3B82F6)))
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
                              if (isSelected) _selectedItems.remove(item.id);
                              else _selectedItems.add(item.id);
                            });
                          },
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: isSelected ? const Color(0xFF1E293B) : const Color(0xFF1E293B).withValues(alpha: 0.5),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: isSelected ? const Color(0xFF3B82F6) : Colors.white.withValues(alpha: 0.05),
                                width: isSelected ? 2 : 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                Checkbox(
                                  value: isSelected,
                                  onChanged: (v) {
                                    setState(() {
                                      if (v!) _selectedItems.add(item.id);
                                      else _selectedItems.remove(item.id);
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
                                        '#${item.id.substring(0, 8).toUpperCase()}',
                                        style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700, color: const Color(0xFF3B82F6)),
                                      ),
                                      const Gap(4),
                                      Text(
                                        item.toAddress,
                                        style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                                      ),
                                      const Gap(2),
                                      Text(
                                        'Recipient: ${item.receiverName}',
                                        style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF64748B)),
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
                color: const Color(0xFF1E293B),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
                boxShadow: [
                  BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 40, offset: const Offset(0, -10)),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Selected',
                        style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: const Color(0xFF94A3B8)),
                      ),
                      Text(
                        '${_selectedItems.length} items',
                        style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white),
                      ),
                    ],
                  ),
                  const Gap(24),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: FilledButton(
                      onPressed: (_selectedItems.isEmpty || _submitting) ? null : _dispatchSelected,
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFF3B82F6),
                        disabledBackgroundColor: const Color(0xFF1E293B),
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

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const HugeIcon(icon: HugeIcons.strokeRoundedPackage01, color: Color(0xFF1E293B), size: 80),
          const Gap(24),
          Text(
            'No items in inventory',
            style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          const Gap(8),
          Text(
            'There are currently no parcels marked\nas "At Warehouse" to dispatch.',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(fontSize: 14, color: const Color(0xFF64748B)),
          ),
        ],
      ),
    );
  }
}
