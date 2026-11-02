import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../models/operation_model.dart';
import '../../models/parcel_model.dart';
import '../../services/api_service.dart';
import '../../theme/staff_palette.dart';
import '../../widgets/profile/premium_settings_components.dart';
import '../../widgets/staff/parcel_cards.dart';
import '../../widgets/staff/parcel_number_field.dart';
import '../../widgets/staff/parcel_search_suggestions.dart';
import '../../utils/parcel_search.dart';
import '../../providers/parcel_provider.dart';
import 'package:provider/provider.dart';
import '../../widgets/staff/staff_settings.dart';

/// Offload Parcels — select in-transit parcels (from the list, a search or a
/// scan) and offload them together at this station.
class OffloadParcelScreen extends StatefulWidget {
  const OffloadParcelScreen({super.key});

  @override
  State<OffloadParcelScreen> createState() => _OffloadParcelScreenState();
}

class _OffloadParcelScreenState extends State<OffloadParcelScreen> {
  final _searchController = TextEditingController();
  final _searchFocus = FocusNode();
  List<ParcelModel> _transitItems = [];
  final Set<String> _selected = {};
  bool _loading = true;
  bool _submitting = false;
  bool _searching = false;
  ParcelModel? _foundParcel;

  @override
  void initState() {
    super.initState();
    _fetchTransitItems();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  static bool _inTransit(ParcelModel c) =>
      c.status == ParcelStatus.inTransit || c.status == ParcelStatus.dispatched;

  Future<void> _fetchTransitItems() async {
    setState(() => _loading = true);
    try {
      final raw = await ApiService.getParcels();
      final items = raw.map((j) => ParcelModel.fromJson(j)).where(_inTransit).toList();
      if (mounted) setState(() => _transitItems = items);
    } catch (e) {
      if (mounted) MizigoToasts.showError(context, 'Couldn’t load parcels in transit');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _search() async {
    final query = _searchController.text.trim();
    if (query.isEmpty) return;
    FocusScope.of(context).unfocus();
    // Smart search over parcels already loaded first; the server only if none match.
    final local = searchParcels([..._transitItems, ...context.read<ParcelProvider>().parcels], query);
    if (local.isNotEmpty) {
      _useParcel(local.first);
      return;
    }
    setState(() {
      _searching = true;
      _foundParcel = null;
    });
    try {
      final results = await ApiService.searchParcel(query);
      if (!mounted) return;
      if (results.isEmpty) {
        MizigoToasts.showError(context, 'No parcel found for “$query”');
      } else {
        final p = ParcelModel.fromJson(results.first);
        setState(() {
          _foundParcel = p;
          if (_inTransit(p)) _selected.add(p.id);
        });
      }
    } catch (_) {
      if (mounted) MizigoToasts.showError(context, 'Search failed. Check your connection.');
    } finally {
      if (mounted) setState(() => _searching = false);
    }
  }

  /// Shows [p] as the found parcel (and selects it if it can be acted on).
  void _useParcel(ParcelModel p) {
    setState(() {
      _foundParcel = p;
      if (_inTransit(p)) _selected.add(p.id);
    });
  }

  Future<void> _scan() async {
    final code = await context.push<String>('/scanner', extra: ParcelOperation.offload);
    if (code != null && mounted) {
      _searchController.text = code;
      _search();
    }
  }

  void _toggle(String id) => setState(() => _selected.contains(id) ? _selected.remove(id) : _selected.add(id));

  Future<void> _offloadSelected() async {
    if (_selected.isEmpty) return;
    final count = _selected.length;
    final confirmed = await showStaffConfirmSheet(
      context,
      title: 'Offload $count parcel${count == 1 ? '' : 's'}?',
      message: 'They’ll be marked as offloaded at this station and receivers will be notified by SMS.',
      confirmText: 'Offload',
    );
    if (!confirmed || !mounted) return;

    setState(() => _submitting = true);
    var succeeded = 0;
    var failed = 0;
    for (final id in _selected.toList()) {
      try {
        await ApiService.offloadParcel(id);
        succeeded++;
      } catch (_) {
        failed++;
      }
    }
    if (!mounted) return;
    setState(() => _submitting = false);
    if (succeeded > 0) MizigoToasts.showSuccess(context, '$succeeded parcel${succeeded == 1 ? '' : 's'} offloaded');
    if (failed > 0) MizigoToasts.showError(context, '$failed couldn’t be offloaded. Try again.');
    if (succeeded > 0) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    final found = _foundParcel;
    final listed = _transitItems.where((p) => p.id != found?.id).toList();
    final allSelected = _transitItems.isNotEmpty && _transitItems.every((p) => _selected.contains(p.id));

    return StaffSettingsScaffold(
      title: 'Offload Parcels',
      onBack: () => context.pop(),
      onRefresh: _fetchTransitItems,
      bottom: StaffButton(
        label: _selected.isEmpty
            ? 'Select parcels to offload'
            : 'Offload ${_selected.length} parcel${_selected.length == 1 ? '' : 's'}',
        icon: HugeIcons.strokeRoundedPackage01,
        loading: _submitting,
        onPressed: _selected.isEmpty ? null : _offloadSelected,
      ),
      children: [
        ParcelLookupBar(
          field: ParcelSearchSuggestions(
            controller: _searchController,
            focusNode: _searchFocus,
            onParcelSelected: _useParcel,
            fieldBuilder: (_) => ParcelNumberField(
              controller: _searchController,
              focusNode: _searchFocus,
              freeText: true,
              loading: _searching,
              onSubmitted: (_) => _search(),
            ),
          ),
          onScan: _scan,
        ),
        if (found != null) ...[
          const Gap(16),
          ParcelSummaryCard(
            parcel: found,
            selected: _inTransit(found) ? _selected.contains(found.id) : null,
            onTap: _inTransit(found) ? () => _toggle(found.id) : null,
          ),
          if (!_inTransit(found))
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 4),
              child: Text(
                'This parcel is ${found.status.displayLabel.toLowerCase()}, so it can’t be offloaded.',
                style: GoogleFonts.outfit(fontSize: 14, color: const Color(0xFFD97706)),
              ),
            ),
        ],
        const Gap(20),
        Row(
          children: [
            Text(
              'In Transit',
              style: GoogleFonts.outfit(fontSize: 19, fontWeight: FontWeight.w700, color: palette.fg()),
            ),
            const Gap(8),
            if (!_loading)
              Text('${_transitItems.length}', style: GoogleFonts.outfit(fontSize: 16, color: palette.fg(0.5))),
            const Spacer(),
            if (_transitItems.isNotEmpty)
              TextButton(
                onPressed: () => setState(() {
                  if (allSelected) {
                    _selected.removeAll(_transitItems.map((p) => p.id));
                  } else {
                    _selected.addAll(_transitItems.map((p) => p.id));
                  }
                }),
                child: Text(allSelected ? 'Clear' : 'Select all', style: GoogleFonts.outfit(fontSize: 15)),
              ),
          ],
        ),
        const Gap(8),
        if (_loading)
          for (var i = 0; i < 3; i++)
            Container(
              height: 150,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(color: palette.surface(0.08), borderRadius: BorderRadius.circular(24)),
            )
        else if (_transitItems.isEmpty)
          StaffGlassCard(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                HugeIcon(icon: HugeIcons.strokeRoundedSpeedTrain01, color: palette.fg(0.4), size: 30),
                const Gap(16),
                Expanded(
                  child: Text(
                    'No parcels are in transit right now. Pull down to refresh.',
                    style: GoogleFonts.outfit(fontSize: 15, height: 1.4, color: palette.fg(0.7)),
                  ),
                ),
              ],
            ),
          )
        else
          for (final p in listed)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ParcelSummaryCard(parcel: p, selected: _selected.contains(p.id), onTap: () => _toggle(p.id)),
            ),
      ],
    );
  }
}
