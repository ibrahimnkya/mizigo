import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../services/api_service.dart';
import '../../models/cargo_model.dart';

class DeliverCargoScreen extends StatefulWidget {
  const DeliverCargoScreen({super.key});

  @override
  State<DeliverCargoScreen> createState() => _DeliverCargoScreenState();
}

class _DeliverCargoScreenState extends State<DeliverCargoScreen> {
  final _searchController = TextEditingController();
  CargoModel? _foundCargo;
  bool _searching = false;
  bool _delivering = false;

  Future<void> _search() async {
    if (_searchController.text.isEmpty) return;
    
    setState(() {
      _searching = true;
      _foundCargo = null;
    });

    try {
      final results = await ApiService.searchCargo(_searchController.text);
      if (results.isNotEmpty) {
        setState(() {
          _foundCargo = CargoModel.fromJson(results.first);
        });
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No cargo found with this ID'), backgroundColor: Color(0xFFEF4444)),
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

  Future<void> _markAsDelivered() async {
    if (_foundCargo == null) return;

    setState(() => _delivering = true);
    try {
      await ApiService.updateCargoStatus(_foundCargo!.id, 'Delivered', location: 'Recipient Handover');
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Parcel successfully delivered to recipient!'),
            backgroundColor: Color(0xFF10B981),
          ),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Delivery Error: $e'), backgroundColor: const Color(0xFFEF4444)),
        );
      }
    } finally {
      if (mounted) setState(() => _delivering = false);
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
          'Deliver Cargo',
          style: GoogleFonts.outfit(fontWeight: FontWeight.w700, color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 20),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const HugeIcon(icon: HugeIcons.strokeRoundedCheckmarkBadge01, color: Color(0xFF3B82F6), size: 28),
                      const Gap(12),
                      Text(
                        'Recipient Verification',
                        style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
                      ),
                    ],
                  ),
                  const Gap(8),
                  Text(
                    'Enter tracking ID to locate the parcel and mark as delivered.',
                    style: GoogleFonts.inter(fontSize: 13, color: const Color(0xFF94A3B8)),
                  ),
                  const Gap(24),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          style: GoogleFonts.inter(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Enter Tracking ID',
                            hintStyle: GoogleFonts.inter(color: const Color(0xFF475569)),
                            filled: true,
                            fillColor: const Color(0xFF0F172A).withValues(alpha: 0.5),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                      const Gap(12),
                      SizedBox(
                        height: 56,
                        child: IconButton.filled(
                          onPressed: _searching ? null : _search,
                          icon: _searching 
                              ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)) 
                              : const HugeIcon(icon: HugeIcons.strokeRoundedSearch01, color: Colors.white),
                          style: IconButton.styleFrom(
                            backgroundColor: const Color(0xFF3B82F6),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            if (_foundCargo != null) ...[
              const Gap(32),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: const Color(0xFF3B82F6).withValues(alpha: 0.2)),
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
                            'FOUND PARCEL',
                            style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w800, color: const Color(0xFF3B82F6)),
                          ),
                        ),
                        Text(
                          '#${_foundCargo!.id.substring(0, 8).toUpperCase()}',
                          style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700, color: const Color(0xFF64748B)),
                        ),
                      ],
                    ),
                    const Gap(16),
                    Text(
                      _foundCargo!.receiverName,
                      style: GoogleFonts.outfit(fontSize: 22, fontWeight: FontWeight.w700, color: Colors.white),
                    ),
                    Text(
                      _foundCargo!.receiverPhone,
                      style: GoogleFonts.inter(fontSize: 14, color: const Color(0xFF94A3B8)),
                    ),
                    const Gap(16),
                    const Divider(color: Color(0xFF334155)),
                    const Gap(16),
                    _buildDetailRow(HugeIcons.strokeRoundedPackage, 'Description', _foundCargo!.description),
                    const Gap(12),
                    _buildDetailRow(HugeIcons.strokeRoundedLocation01, 'Destination', _foundCargo!.toAddress),
                    const Gap(12),
                    _buildDetailRow(HugeIcons.strokeRoundedCircleArrowDownDouble, 'Status', _foundCargo!.status.displayLabel),
                    
                    const Gap(32),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: FilledButton(
                        onPressed: _delivering ? null : _markAsDelivered,
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

  Widget _buildDetailRow(List<List<dynamic>> icon, String label, String value) {
    return Row(
      children: [
        HugeIcon(icon: icon, color: const Color(0xFF64748B), size: 18),
        const Gap(12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: GoogleFonts.inter(fontSize: 11, color: const Color(0xFF64748B), fontWeight: FontWeight.w600)),
            Text(value, style: GoogleFonts.inter(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500)),
          ],
        ),
      ],
    );
  }
}
