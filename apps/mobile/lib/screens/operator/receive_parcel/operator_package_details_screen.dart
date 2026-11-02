import 'package:flutter/material.dart';
import 'operator_receiver_screen.dart' show ReceiveContactDraft;
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../../providers/auth_provider.dart';
import '../../../services/api_service.dart';
import '../../../theme/staff_palette.dart';
import '../../../widgets/profile/premium_settings_components.dart';
import '../../../widgets/staff/staff_settings.dart';
import '../../../widgets/staff/step_progress.dart';
import '../../../utils/money_input.dart';

class OperatorPackageDetailsScreen extends StatefulWidget {
  const OperatorPackageDetailsScreen({super.key});

  @override
  State<OperatorPackageDetailsScreen> createState() => _OperatorPackageDetailsScreenState();
}

class _OperatorPackageDetailsScreenState extends State<OperatorPackageDetailsScreen> {
  final _nameCtrl = TextEditingController();
  final _valueCtrl = TextEditingController();
  final _descCtrl = TextEditingController();
  final _weightCtrl = TextEditingController();
  final _destinationCtrl = TextEditingController();
  String? _destinationStationId;

  String? _condition;
  String? _parcelType; // Renamed for naming consistency
  String? _urgency;
  String? _packageSize;
  bool _hasError = false; // Track validation error for dots

  bool _includeAdditionalServices = false;
  final Set<String> _selectedServices = {};

  late Map<String, String> _apiConditions = Map.from(conditions);
  late Map<String, String> _apiParcelTypes = Map.from(parcelTypes);
  late Map<String, String> _apiPackageSizes = Map.from(packageSizes);
  late Map<String, String> _apiUrgencies = Map.from(urgencies);

  static final List<Map<String, dynamic>> additionalServicesList = [
    {
      'id': 'insurance',
      'name': 'Cargo Insurance',
      'price': 3000.0,
      'description': 'Protection against loss, damage, or theft',
      'icon': HugeIcons.strokeRoundedShield01,
    },
    {
      'id': 'packaging',
      'name': 'Secure Packaging',
      'price': 2000.0,
      'description': 'Bubble wrap, secure box sealing, or nylon packing',
      'icon': HugeIcons.strokeRoundedPackage,
    },
    {
      'id': 'fragile',
      'name': 'Special Handling',
      'price': 2500.0,
      'description': 'Priority placement, fragile sticker and padding',
      'icon': HugeIcons.strokeRoundedAlertCircle,
    },
  ];

  static const Map<String, String> conditions = {
    'Brand New': 'Unused, factory-sealed item.',
    'Refurbished': 'Restored, tested, and certified.',
    'Used': 'Previously owned, functional condition.',
  };

  static const Map<String, String> parcelTypes = {
    // Renamed from parcelTypes
    'Parcel': 'User provides their own packaging',
    'Pallet': 'Stacked bulk goods',
    'Container': 'Large volume parcels',
    'Fragile Goods': 'Handle with extra care',
  };

  static const Map<String, String> urgencies = {
    'Express': 'Faster delivery, higher priority.',
    'Standard': 'Standard delivery, normal priority.',
    'MGR': 'High-priority management delivery.',
  };

  static const Map<String, String> packageSizes = {
    'Document': 'A4-sized paper, lightweight',
    'A3 Nylon Packing': 'Small packets, soft parcels',
    'Size 1': 'Small Box – Approx. 30cm x 30cm x 30cm',
    'Size 2': 'Medium Box – Approx. 50cm x 50cm x 50cm',
    'Size 3': 'Large Box – Approx. 70cm x 70cm x 70cm',
  };

  @override
  void initState() {
    super.initState();
    ReceiveContactDraft.clear(); // a new receive flow starts with empty contacts
    _loadParameters();
  }

  Future<void> _loadParameters() async {
    try {
      final data = await ApiService.getParcelParameters();
      if (mounted) {
        setState(() {
          _apiConditions = data['parcelConditions']!;
          _apiParcelTypes = data['parcelTypes']!;
          _apiPackageSizes = data['packageSizes']!;
          if (data.containsKey('deliveryPriorities')) {
            _apiUrgencies = data['deliveryPriorities']!;
          }
        });
      }
    } catch (_) {
      // Keep static defaults if call fails
    }
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _valueCtrl.dispose();
    _descCtrl.dispose();
    _weightCtrl.dispose();
    _destinationCtrl.dispose();
    super.dispose();
  }

  void _showStationPicker(BuildContext context) async {
    final auth = context.read<AuthProvider>();
    final currentStation = auth.user?.station;

    final result = await showModalBottomSheet<dynamic>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _StationPickerSheet(excludeStation: currentStation),
    );
    if (result != null && result is Map) {
      setState(() {
        _destinationCtrl.text = result['name']?.toString() ?? '';
        _destinationStationId = result['id']?.toString();
      });
    }
  }

  void _showStepHelp(BuildContext context) {
    const items = [
      (HugeIcons.strokeRoundedShippingCenter, 'Destination', 'The station where the receiver will collect the parcel.'),
      (HugeIcons.strokeRoundedPackage, 'Parcel name', 'What it is, e.g. “Laptop” or “Women clothes”.'),
      (HugeIcons.strokeRoundedCoins01, 'Declared value', 'Market value in TSh — used for insurance reference.'),
      (HugeIcons.strokeRoundedWeightScale, 'Weight', 'In kilograms; used to calculate the price.'),
      (HugeIcons.strokeRoundedAnalytics01, 'Specifications', 'Condition, packaging type, priority and size.'),
    ];
    showStaffSheet<void>(
      context,
      title: 'What to fill in',
      builder: (_) => ListView(
        shrinkWrap: true,
        children: [
          for (final (icon, title, body) in items)
            StaffSheetTile(icon: icon, label: title, subtitle: body, onTap: null),
        ],
      ),
    );
  }

  void _showSelectionSheet(
    BuildContext context,
    String title,
    Map<String, String> items,
    String? currentValue,
    ValueChanged<String> onSelect,
  ) {
    showStaffSheet<void>(
      context,
      title: title,
      builder: (sheetContext) => ListView(
        shrinkWrap: true,
        children: [
          for (final e in items.entries)
            StaffSheetTile(
              icon: HugeIcons.strokeRoundedCheckList,
              label: e.key,
              subtitle: e.value.isEmpty ? null : e.value,
              selected: e.key == currentValue,
              onTap: () {
                onSelect(e.key);
                Navigator.pop(sheetContext);
              },
            ),
        ],
      ),
    );
  }

  void _showAdditionalServicesModal(BuildContext context) {
    showStaffSheet<void>(
      context,
      title: 'Additional Services',
      builder: (sheetContext) => StatefulBuilder(
        builder: (ctx, setSheet) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final svc in additionalServicesList)
              StaffSheetTile(
                icon: svc['icon'] as List<List<dynamic>>,
                label: svc['name'] as String,
                subtitle: '${svc['description']} · + TSh ${NumberFormat('#,###').format(svc['price'])}',
                selected: _selectedServices.contains(svc['id']),
                onTap: () {
                  setSheet(() {});
                  setState(() {
                    final id = svc['id'] as String;
                    _selectedServices.contains(id) ? _selectedServices.remove(id) : _selectedServices.add(id);
                    _includeAdditionalServices = _selectedServices.isNotEmpty;
                  });
                },
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
              child: StaffButton(
                label: 'Done (${_selectedServices.length})',
                onPressed: () => Navigator.pop(sheetContext),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double get _weightKg => double.tryParse(_weightCtrl.text.trim().replaceAll(',', '.')) ?? 0;

  /// Parcels over 0.5 kg are priced as a % of declared value, so it's required.
  bool get _valueRequired => _weightKg > 0.5;

  List<String> get _missing => [
    if (_destinationCtrl.text.isEmpty) 'destination',
    if (_nameCtrl.text.trim().isEmpty) 'parcel name',
    if (_valueRequired && (parseMoney(_valueCtrl.text) ?? 0) <= 0) 'declared value (over 0.5 kg)',
    if (_weightCtrl.text.trim().isEmpty) 'weight',
    if (_condition == null) 'condition',
    if (_parcelType == null) 'type',
    if (_urgency == null) 'priority',
    if (_packageSize == null) 'size',
  ];

  void _onNext() {
    if (_missing.isNotEmpty) {
      setState(() => _hasError = true);
      MizigoToasts.showError(context, 'Please add: ${_missing.join(', ')}');
      return;
    }
    setState(() => _hasError = false);

    final originStation = context.read<AuthProvider>().user?.station ?? 'Headquarters Central';
    final originStationId = context.read<AuthProvider>().user?.stationId ?? '01KPWEWYACW1NRAFBTTGFRSKYS';

    context.push(
      '/operator-receive/receiver',
      extra: {
        'originStation': originStation,
        'originStationId': originStationId,
        'destinationStation': _destinationCtrl.text,
        'destinationStationId': _destinationStationId,
        'packageName': _nameCtrl.text,
        'packageValue': parseMoney(_valueCtrl.text)?.toStringAsFixed(0) ?? '0',
        'parcelDescription': _descCtrl.text,
        'weight': _weightCtrl.text,
        'condition': _condition,
        'parcelType': _parcelType,
        'urgency': _urgency,
        'packageSize': _packageSize,
        'additionalServices': _selectedServices.toList(),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    final servicesTotal = additionalServicesList
        .where((s) => _selectedServices.contains(s['id']))
        .fold<double>(0, (sum, s) => sum + (s['price'] as double));

    return StaffSettingsScaffold(
      title: 'Parcel Details',
      onBack: () => context.pop(),
      trailing: IconButton(
        tooltip: 'Help',
        onPressed: () => _showStepHelp(context),
        icon: HugeIcon(icon: HugeIcons.strokeRoundedHelpCircle, color: palette.fg(), size: 24),
      ),
      // Shown only once every required detail is filled in.
      bottom: _missing.isEmpty
          ? StaffButton(
              label: 'Continue to Receiver',
              icon: HugeIcons.strokeRoundedArrowRight02,
              iconAfter: true,
              onPressed: _onNext,
            )
          : null,
      children: [
        const StepProgress(step: 1, total: 3, label: 'Parcel'),
        const Gap(16),
        StaffGlassCard(
          title: 'Route',
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 6),
          child: Column(
            children: [
              // Receiving station = the signed-in clerk's station (read-only).
              StaffSettingsTile(
                icon: HugeIcons.strokeRoundedBuilding04,
                title: 'From · Your station',
                value: (context.watch<AuthProvider>().user?.station?.isNotEmpty ?? false)
                    ? context.watch<AuthProvider>().user!.station!
                    : 'Not assigned',
                showChevron: false,
              ),
              const StaffDivider(),
              StaffSettingsTile(
                icon: HugeIcons.strokeRoundedShippingCenter,
                title: 'To',
                value: _destinationCtrl.text.isEmpty ? 'Choose' : _destinationCtrl.text,
                onTap: () => _showStationPicker(context),
              ),
            ],
          ),
        ),
        const Gap(10),
        StaffGlassCard(
          title: 'Parcel',
          child: Column(
            children: [
              StaffTextField(
                label: 'Parcel name',
                hint: 'e.g. Electronics',
                controller: _nameCtrl,
                icon: HugeIcons.strokeRoundedPackage,
                textInputAction: TextInputAction.next,
                onChanged: (_) => setState(() {}),
              ),
              const Gap(14),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: StaffTextField(
                      label: _valueRequired ? 'Value (TSh) *' : 'Value (TSh)',
                      hint: _valueRequired ? 'Required' : 'Optional',
                      controller: _valueCtrl,
                      icon: HugeIcons.strokeRoundedCoins01,
                      keyboardType: TextInputType.number,
                      inputFormatters: [ThousandsSeparatorFormatter()],
                      textInputAction: TextInputAction.next,
                      onChanged: (_) => setState(() {}),
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: StaffTextField(
                      label: 'Weight (kg)',
                      hint: '2.5',
                      controller: _weightCtrl,
                      icon: HugeIcons.strokeRoundedWeightScale,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      onChanged: (_) => setState(() {}),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Gap(10),
        StaffGlassCard(
          title: 'Specifications',
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 6),
          child: Column(
            children: [
              StaffSettingsTile(
                icon: HugeIcons.strokeRoundedAnalytics01,
                title: 'Condition',
                value: _condition ?? 'Choose',
                onTap: () => _showSelectionSheet(
                  context,
                  'Parcel Condition',
                  _apiConditions,
                  _condition,
                  (v) => setState(() => _condition = v),
                ),
              ),
              const StaffDivider(),
              StaffSettingsTile(
                icon: HugeIcons.strokeRoundedPackage,
                title: 'Type',
                value: _parcelType ?? 'Choose',
                onTap: () => _showSelectionSheet(
                  context,
                  'Parcel Type',
                  _apiParcelTypes,
                  _parcelType,
                  (v) => setState(() => _parcelType = v),
                ),
              ),
              const StaffDivider(),
              StaffSettingsTile(
                icon: HugeIcons.strokeRoundedSpeedTrain02,
                title: 'Priority',
                value: _urgency ?? 'Choose',
                onTap: () => _showSelectionSheet(
                  context,
                  'Delivery Priority',
                  _apiUrgencies,
                  _urgency,
                  (v) => setState(() => _urgency = v),
                ),
              ),
              const StaffDivider(),
              StaffSettingsTile(
                icon: HugeIcons.strokeRoundedRuler,
                title: 'Size',
                value: _packageSize ?? 'Choose',
                onTap: () => _showSelectionSheet(
                  context,
                  'Package Size',
                  _apiPackageSizes,
                  _packageSize,
                  (v) => setState(() => _packageSize = v),
                ),
              ),
            ],
          ),
        ),
        const Gap(10),
        StaffGlassCard(
          title: 'Additional Services',
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: Column(
            children: [
              StaffSwitchTile(
                icon: HugeIcons.strokeRoundedShield01,
                title: 'Add services',
                subtitle: _selectedServices.isEmpty
                    ? 'Insurance, packaging or special handling'
                    : '${_selectedServices.length} selected · + TSh ${NumberFormat('#,###').format(servicesTotal)}',
                value: _includeAdditionalServices,
                onChanged: (on) {
                  setState(() {
                    _includeAdditionalServices = on;
                    if (!on) _selectedServices.clear();
                  });
                  if (on) _showAdditionalServicesModal(context);
                },
              ),
              if (_includeAdditionalServices)
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => _showAdditionalServicesModal(context),
                    child: Text('Edit services', style: GoogleFonts.outfit(fontSize: 15)),
                  ),
                ),
            ],
          ),
        ),
        const Gap(10),
        StaffGlassCard(
          title: 'Description',
          child: StaffTextField(
            label: 'Optional',
            hint: 'Anything the next station should know',
            controller: _descCtrl,
            icon: HugeIcons.strokeRoundedNote,
            maxLines: 3,
          ),
        ),
        if (_hasError && _missing.isNotEmpty) ...[
          const Gap(12),
          Text('Still needed: ${_missing.join(', ')}.', style: GoogleFonts.outfit(fontSize: 14, color: kStaffDanger)),
        ],
      ],
    );
  }
}

class _StationPickerSheet extends StatefulWidget {
  final String? excludeStation;
  const _StationPickerSheet({this.excludeStation});

  @override
  State<_StationPickerSheet> createState() => _StationPickerSheetState();
}

class _StationPickerSheetState extends State<_StationPickerSheet> {
  final _searchCtrl = TextEditingController();
  List<dynamic> _allStations = [];
  List<dynamic> _filtered = [];
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchStations();
  }

  Future<void> _fetchStations() async {
    try {
      final list = await ApiService.getStations();
      if (mounted) {
        setState(() {
          _allStations = list;
          _filtered = _rank('');
          _loading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _loading = false;
        });
      }
    }
  }

  bool _shouldExclude(String stationName, String? exclude) {
    if (exclude == null || exclude.isEmpty) return false;
    final sNormalized = stationName.toLowerCase();
    final eNormalized = exclude.toLowerCase();

    // Exact match
    if (sNormalized == eNormalized) return true;

    // If one contains the other
    if (sNormalized.contains(eNormalized) || eNormalized.contains(sNormalized)) return true;

    // Short prefix matching (e.g. "moro" matches "Morogoro", "dsm" matches "Dar es Salaam", "dom" matches "Dodoma")
    if (eNormalized.startsWith('moro') && sNormalized.startsWith('moro')) return true;
    if (eNormalized.startsWith('dsm') && sNormalized.startsWith('dar')) return true;
    if (eNormalized.startsWith('dom') && sNormalized.startsWith('dodoma')) return true;
    if (sNormalized.startsWith('moro') && eNormalized.startsWith('moro')) return true;
    if (sNormalized.startsWith('dsm') && eNormalized.startsWith('dar')) return true;
    if (sNormalized.startsWith('dom') && eNormalized.startsWith('dodoma')) return true;

    return false;
  }

  static const _maxShown = 3;

  /// Short forms staff commonly type for stations.
  static const _aliases = {'dsm': 'dar', 'dom': 'dodoma', 'moro': 'morogoro'};

  List<dynamic> get _available =>
      _allStations.where((s) => !_shouldExclude(s['name']?.toString() ?? '', widget.excludeStation)).toList();

  /// Best matches first: exact name/code, prefix, word prefix, aliases,
  /// contains, then one-typo matches. Shows at most [_maxShown] so the sheet
  /// stays small and fits above the keyboard.
  List<dynamic> _rank(String raw) {
    final q = raw.trim().toLowerCase();
    final stations = _available;
    if (q.isEmpty) return stations.take(_maxShown).toList();
    final alias = _aliases[q];
    final scored = <(dynamic, int)>[];
    for (final st in stations) {
      final name = (st['name']?.toString() ?? '').toLowerCase();
      final code = (st['code']?.toString() ?? '').toLowerCase();
      final words = name.split(RegExp(r'[^a-z0-9]+')).where((w) => w.isNotEmpty).toList();
      var score = 0;
      if (name == q || code == q) {
        score = 100;
      } else if (name.startsWith(q) || code.startsWith(q)) {
        score = 80;
      } else if (alias != null && name.startsWith(alias)) {
        score = 70;
      } else if (words.any((w) => w.startsWith(q))) {
        score = 60;
      } else if (name.contains(q)) {
        score = 40;
      } else if (q.length >= 4 &&
          words.any(
            (w) =>
                _withinOneEdit(w.length > q.length + 1 ? w.substring(0, q.length + 1) : w, q) ||
                _withinOneEdit(w.length > q.length ? w.substring(0, q.length) : w, q),
          )) {
        score = 25;
      }
      if (score > 0) scored.add((st, score));
    }
    scored.sort((a, b) => b.$2.compareTo(a.$2));
    return scored.take(_maxShown).map((e) => e.$1).toList();
  }

  /// True if [a] and [b] differ by at most one insert/delete/substitution.
  static bool _withinOneEdit(String a, String b) {
    if ((a.length - b.length).abs() > 1) return false;
    var i = 0, j = 0, edits = 0;
    while (i < a.length && j < b.length) {
      if (a[i] == b[j]) {
        i++;
        j++;
        continue;
      }
      if (++edits > 1) return false;
      if (a.length > b.length) {
        i++;
      } else if (a.length < b.length) {
        j++;
      } else {
        i++;
        j++;
      }
    }
    return edits + (a.length - i) + (b.length - j) <= 1;
  }

  void _onSearch(String q) => setState(() => _filtered = _rank(q));

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    OutlineInputBorder border(Color c, [double w = 1]) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: c, width: w),
    );

    Widget message(List<List<dynamic>> icon, String text) => Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
      child: Column(
        children: [
          HugeIcon(icon: icon, color: palette.fg(0.35), size: 40),
          const Gap(10),
          Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.outfit(fontSize: 15, color: palette.fg(0.65)),
          ),
        ],
      ),
    );

    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
        decoration: BoxDecoration(
          color: palette.navBackground,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
          border: Border.all(color: palette.surface(0.12)),
        ),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Gap(12),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(color: palette.fg(0.2), borderRadius: BorderRadius.circular(2)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Destination station',
                        style: GoogleFonts.outfit(fontSize: 19, fontWeight: FontWeight.w700, color: palette.fg()),
                      ),
                    ),
                    if (!_loading && _error == null)
                      Text(
                        '${_available.length} stations',
                        style: GoogleFonts.outfit(fontSize: 15, color: palette.fg(0.5)),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  height: 48,
                  child: TextField(
                    controller: _searchCtrl,
                    autofocus: true,
                    autocorrect: false,
                    onChanged: _onSearch,
                    textInputAction: TextInputAction.search,
                    cursorColor: kStaffAccent,
                    style: GoogleFonts.outfit(fontSize: 16, color: palette.fg()),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: palette.surface(0.06),
                      hintText: 'Search station name or code',
                      hintStyle: GoogleFonts.outfit(fontSize: 16, color: palette.fg(0.5)),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 12, right: 10),
                        child: HugeIcon(icon: HugeIcons.strokeRoundedSearch01, color: palette.fg(0.85), size: 22),
                      ),
                      prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                      border: border(palette.fg(0.3)),
                      enabledBorder: border(palette.fg(0.3)),
                      focusedBorder: border(kStaffAccent, 1.5),
                    ),
                  ),
                ),
              ),
              if (!_loading && _error == null && _searchCtrl.text.trim().isEmpty && _available.length > _maxShown)
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
                  child: Text(
                    'Type to search ${_available.length} stations',
                    style: GoogleFonts.outfit(fontSize: 13, color: palette.fg(0.5)),
                  ),
                ),
              const Gap(8),
              Flexible(
                child: _loading
                    ? const Padding(
                        padding: EdgeInsets.all(32),
                        child: Center(child: CircularProgressIndicator(strokeWidth: 2.5, color: kStaffAccent)),
                      )
                    : _error != null
                    ? message(HugeIcons.strokeRoundedAlert02, 'Couldn’t load stations. Check your connection.')
                    : _filtered.isEmpty
                    ? message(HugeIcons.strokeRoundedShippingCenter, 'No stations match “${_searchCtrl.text}”.')
                    : ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(bottom: 8),
                        itemCount: _filtered.length,
                        itemBuilder: (_, i) {
                          final station = _filtered[i];
                          final code = station['code']?.toString() ?? '';
                          return StaffSheetTile(
                            icon: HugeIcons.strokeRoundedShippingCenter,
                            label: station['name']?.toString() ?? 'Station',
                            subtitle: code.isEmpty ? null : code,
                            onTap: () => Navigator.pop(context, station),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
