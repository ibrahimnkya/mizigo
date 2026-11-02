import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';

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

/// Dispatch Parcels — choose a wagon and travel date, select received parcels
/// (from the list, a search or a scan) and dispatch them together.
class SendParcelToStationScreen extends StatefulWidget {
  const SendParcelToStationScreen({super.key});

  @override
  State<SendParcelToStationScreen> createState() => _SendParcelToStationScreenState();
}

class _SendParcelToStationScreenState extends State<SendParcelToStationScreen> {
  final _searchController = TextEditingController();
  final _searchFocus = FocusNode();
  List<ParcelModel> _readyItems = [];
  final Set<String> _selected = {};
  bool _loading = true;
  bool _submitting = false;
  bool _searching = false;
  ParcelModel? _foundParcel;

  /// Train wagons: {id, plateNumber}
  List<Map<String, String>> _wagons = [];
  Map<String, String>? _wagon;
  DateTime _travelDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _fetchItems();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  static bool _ready(ParcelModel c) => c.status == ParcelStatus.received;

  Future<void> _fetchItems() async {
    setState(() => _loading = true);
    try {
      final results = await Future.wait([ApiService.getParcels(), ApiService.getVehicles()]);
      final parcels = results[0].map((j) => ParcelModel.fromJson(j)).where(_ready).toList();
      final wagons = results[1]
          .where((v) => v['id'] != null && v['plateNumber'] != null)
          .map((v) => {'id': v['id'].toString(), 'plateNumber': v['plateNumber'].toString()})
          .toList();
      if (mounted) {
        setState(() {
          _readyItems = parcels;
          _wagons = wagons;
        });
      }
    } catch (_) {
      if (mounted) MizigoToasts.showError(context, 'Couldn’t load parcels and wagons');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _search() async {
    final query = _searchController.text.trim();
    if (query.isEmpty) return;
    FocusScope.of(context).unfocus();
    // Smart search over parcels already loaded first; the server only if none match.
    final local = searchParcels([..._readyItems, ...context.read<ParcelProvider>().parcels], query);
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
          if (_ready(p)) _selected.add(p.id);
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
      if (_ready(p)) _selected.add(p.id);
    });
  }

  Future<void> _scan() async {
    final code = await context.push<String>('/scanner', extra: ParcelOperation.dispatch);
    if (code != null && mounted) {
      _searchController.text = code;
      _search();
    }
  }

  void _toggle(String id) => setState(() => _selected.contains(id) ? _selected.remove(id) : _selected.add(id));

  void _pickWagon() {
    showStaffSheet<void>(
      context,
      title: 'Choose wagon / train',
      builder: (sheetContext) => _wagons.isEmpty
          ? Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
              child: Text(
                'No wagons available. Pull down on the page to refresh.',
                style: GoogleFonts.outfit(fontSize: 15, color: StaffPalette.of(sheetContext).fg(0.6)),
              ),
            )
          : ListView(
              shrinkWrap: true,
              children: [
                for (final w in _wagons)
                  StaffSheetTile(
                    icon: HugeIcons.strokeRoundedSpeedTrain01,
                    label: w['plateNumber']!,
                    selected: _wagon?['id'] == w['id'],
                    onTap: () {
                      setState(() => _wagon = w);
                      Navigator.pop(sheetContext);
                    },
                  ),
              ],
            ),
    );
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _travelDate,
      firstDate: DateTime(now.year, now.month, now.day),
      lastDate: now.add(const Duration(days: 30)),
    );
    if (picked != null) setState(() => _travelDate = picked);
  }

  Future<void> _dispatchSelected() async {
    final wagon = _wagon;
    if (_selected.isEmpty || wagon == null) return;
    final count = _selected.length;
    final confirmed = await showStaffConfirmSheet(
      context,
      title: 'Dispatch $count parcel${count == 1 ? '' : 's'}?',
      message: 'On ${wagon['plateNumber']}, travelling ${DateFormat('EEE d MMM').format(_travelDate)}.',
      confirmText: 'Dispatch',
    );
    if (!confirmed || !mounted) return;

    setState(() => _submitting = true);
    var succeeded = 0;
    var failed = 0;
    for (final id in _selected.toList()) {
      try {
        await ApiService.dispatchParcel(id, wagon['id']!, _travelDate);
        succeeded++;
      } catch (_) {
        failed++;
      }
    }
    if (!mounted) return;
    setState(() => _submitting = false);
    if (succeeded > 0) MizigoToasts.showSuccess(context, '$succeeded parcel${succeeded == 1 ? '' : 's'} dispatched');
    if (failed > 0) MizigoToasts.showError(context, '$failed couldn’t be dispatched. Try again.');
    if (succeeded > 0) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    final found = _foundParcel;
    final listed = _readyItems.where((p) => p.id != found?.id).toList();
    final allSelected = _readyItems.isNotEmpty && _readyItems.every((p) => _selected.contains(p.id));
    final count = _selected.length;

    return StaffSettingsScaffold(
      title: 'Dispatch Parcels',
      onBack: () => context.pop(),
      onRefresh: _fetchItems,
      bottom: StaffButton(
        label: count == 0
            ? 'Select parcels to dispatch'
            : _wagon == null
                ? 'Choose a wagon'
                : 'Dispatch $count parcel${count == 1 ? '' : 's'}',
        icon: HugeIcons.strokeRoundedDeliveryTruck01,
        loading: _submitting,
        onPressed: count == 0 ? null : (_wagon == null ? _pickWagon : _dispatchSelected),
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
            selected: _ready(found) ? _selected.contains(found.id) : null,
            onTap: _ready(found) ? () => _toggle(found.id) : null,
          ),
          if (!_ready(found))
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 4),
              child: Text(
                'This parcel is ${found.status.displayLabel.toLowerCase()}, so it can’t be dispatched.',
                style: GoogleFonts.outfit(fontSize: 14, color: const Color(0xFFD97706)),
              ),
            ),
        ],
        const Gap(16),
        StaffGlassCard(
          title: 'Train & Date',
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 6),
          child: Column(
            children: [
              StaffSettingsTile(
                icon: HugeIcons.strokeRoundedSpeedTrain01,
                title: 'Wagon',
                value: _wagon?['plateNumber'] ?? 'Choose',
                onTap: _pickWagon,
              ),
              const StaffDivider(),
              StaffSettingsTile(
                icon: HugeIcons.strokeRoundedCalendar03,
                title: 'Travel date',
                value: DateFormat('EEE d MMM').format(_travelDate),
                onTap: _pickDate,
              ),
            ],
          ),
        ),
        const Gap(20),
        Row(
          children: [
            Text(
              'Ready to Dispatch',
              style: GoogleFonts.outfit(fontSize: 19, fontWeight: FontWeight.w700, color: palette.fg()),
            ),
            const Gap(8),
            if (!_loading)
              Text('${_readyItems.length}', style: GoogleFonts.outfit(fontSize: 16, color: palette.fg(0.5))),
            const Spacer(),
            if (_readyItems.isNotEmpty)
              TextButton(
                onPressed: () => setState(() {
                  if (allSelected) {
                    _selected.removeAll(_readyItems.map((p) => p.id));
                  } else {
                    _selected.addAll(_readyItems.map((p) => p.id));
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
        else if (_readyItems.isEmpty)
          StaffGlassCard(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                HugeIcon(icon: HugeIcons.strokeRoundedPackageReceive, color: palette.fg(0.4), size: 30),
                const Gap(16),
                Expanded(
                  child: Text(
                    'No received parcels are waiting for dispatch. Pull down to refresh.',
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
