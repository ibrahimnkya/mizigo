import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../models/operation_model.dart';
import '../../models/parcel_model.dart';
import '../../services/api_service.dart';
import '../../theme/staff_palette.dart';
import '../../widgets/auth/clerk_auth_widgets.dart';
import '../../widgets/profile/premium_settings_components.dart';
import '../../widgets/staff/parcel_cards.dart';
import '../../widgets/staff/parcel_number_field.dart';
import '../../widgets/staff/parcel_search_suggestions.dart';
import '../../utils/parcel_search.dart';
import '../../providers/parcel_provider.dart';
import 'package:provider/provider.dart';
import '../../widgets/staff/staff_settings.dart';

/// Deliver Parcel — find the parcel (search or scan), check it's at the
/// station, then verify the receiver's 6-digit delivery code.
class DeliverParcelScreen extends StatefulWidget {
  const DeliverParcelScreen({super.key});

  @override
  State<DeliverParcelScreen> createState() => _DeliverParcelScreenState();
}

class _DeliverParcelScreenState extends State<DeliverParcelScreen> {
  final _searchController = TextEditingController();
  final _searchFocus = FocusNode();
  ParcelModel? _foundParcel;

  /// Text that produced [_foundParcel]; "Find Parcel" shows only when the
  /// field differs from it (i.e. there's a new query to look up).
  String _lastLookup = '';
  bool _searching = false;
  bool _delivering = false;

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  Future<void> _search() async {
    final query = _searchController.text.trim();
    if (query.isEmpty) return;
    FocusScope.of(context).unfocus();
    // Smart search over parcels already loaded first; the server only if none match.
    final local = searchParcels(context.read<ParcelProvider>().parcels, query);
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
        setState(() {
          _foundParcel = ParcelModel.fromJson(results.first);
          _lastLookup = query;
        });
      }
    } catch (e) {
      if (mounted) MizigoToasts.showError(context, 'Search failed. Check your connection.');
    } finally {
      if (mounted) setState(() => _searching = false);
    }
  }

  /// Shows [p] as the found parcel.
  void _useParcel(ParcelModel p) {
    setState(() {
      _foundParcel = p;
      _lastLookup = _searchController.text.trim();
    });
  }

  Future<void> _scan() async {
    final code = await context.push<String>('/scanner', extra: ParcelOperation.deliver);
    if (code != null && mounted) {
      _searchController.text = code;
      _search();
    }
  }

  Future<void> _verify() async {
    final codeController = TextEditingController();
    final code = await showStaffSheet<String>(
      context,
      title: 'Verify Delivery',
      builder: (sheetContext) {
        final palette = StaffPalette.of(sheetContext);
        void submit() {
          if (codeController.text.length == 6) Navigator.pop(sheetContext, codeController.text);
        }

        return Padding(
          padding: EdgeInsets.fromLTRB(24, 4, 24, 8 + MediaQuery.of(sheetContext).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Ask the receiver for the 6-digit delivery code sent to their phone.',
                style: GoogleFonts.outfit(fontSize: 15, height: 1.4, color: palette.fg(0.7)),
              ),
              const Gap(18),
              ClerkCodeField(controller: codeController, onCompleted: (_) => submit()),
              const Gap(24),
              ListenableBuilder(
                listenable: codeController,
                builder: (_, _) => StaffButton(
                  label: 'Confirm Delivery',
                  icon: HugeIcons.strokeRoundedPackageDelivered,
                  color: const Color(0xFF10B981),
                  onPressed: codeController.text.length == 6 ? submit : null,
                ),
              ),
            ],
          ),
        );
      },
    );
    // Dispose after the sheet's close animation, which still reads it.
    Future.delayed(const Duration(milliseconds: 500), codeController.dispose);
    if (code != null) _finalize(code);
  }

  Future<void> _finalize(String code) async {
    final parcel = _foundParcel;
    if (parcel == null) return;
    setState(() => _delivering = true);
    try {
      await ApiService.deliverParcel(parcel.id, code);
      if (!mounted) return;
      MizigoToasts.showSuccess(context, 'Parcel delivered');
      context.pop();
    } catch (e) {
      if (mounted) MizigoToasts.showError(context, 'Delivery failed: $e');
    } finally {
      if (mounted) setState(() => _delivering = false);
    }
  }

  void _showHelp() {
    showStaffSheet<void>(
      context,
      title: 'How to deliver',
      builder: (_) => const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          StaffSheetTile(
            icon: HugeIcons.strokeRoundedQrCode,
            label: 'Find the parcel',
            subtitle: 'Scan its QR code or type the parcel number',
            onTap: null,
          ),
          StaffSheetTile(
            icon: HugeIcons.strokeRoundedUserCheck01,
            label: 'Check the receiver',
            subtitle: 'Confirm their name and phone match the parcel',
            onTap: null,
          ),
          StaffSheetTile(
            icon: HugeIcons.strokeRoundedSecurityPassword,
            label: 'Enter their code',
            subtitle: 'The 6-digit code they received by SMS',
            onTap: null,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    final parcel = _foundParcel;
    final ready = parcel?.status == ParcelStatus.atStation || parcel?.status == ParcelStatus.offloaded;

    return StaffSettingsScaffold(
      title: 'Deliver Parcel',
      onBack: () => context.pop(),
      trailing: IconButton(
        tooltip: 'Help',
        onPressed: _showHelp,
        icon: HugeIcon(icon: HugeIcons.strokeRoundedHelpCircle, color: palette.fg(), size: 24),
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
        // Only once something has been typed.
        ListenableBuilder(
          listenable: _searchController,
          builder: (_, _) {
            final text = _searchController.text.trim();
            return text.isEmpty || (_foundParcel != null && text == _lastLookup)
                ? const SizedBox.shrink()
                : Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: StaffButton(
                      label: 'Find Parcel',
                      icon: HugeIcons.strokeRoundedSearch01,
                      loading: _searching,
                      onPressed: _search,
                    ),
                  );
          },
        ),
        const Gap(16),
        if (parcel == null && !_searching)
          StaffGlassCard(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                const HugeIcon(icon: HugeIcons.strokeRoundedPackageDelivered, color: Color(0xFF10B981), size: 32),
                const Gap(16),
                Expanded(
                  child: Text(
                    'Scan the parcel QR code or enter its number to start a delivery.',
                    style: GoogleFonts.outfit(fontSize: 15, height: 1.4, color: palette.fg(0.75)),
                  ),
                ),
              ],
            ),
          ),
        if (parcel != null) ...[
          ParcelSummaryCard(
            parcel: parcel,
            footer: Row(
              children: [
                HugeIcon(icon: HugeIcons.strokeRoundedUser, color: palette.fg(0.55), size: 16),
                const Gap(6),
                Expanded(
                  child: Text(
                    [parcel.receiverName, parcel.receiverPhone].where((x) => x.isNotEmpty).join(' • '),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.outfit(fontSize: 14, color: palette.fg(0.75)),
                  ),
                ),
              ],
            ),
          ),
          const Gap(16),
          if (ready)
            StaffButton(
              label: 'Verify & Deliver',
              icon: HugeIcons.strokeRoundedSecurityCheck,
              color: const Color(0xFF10B981),
              loading: _delivering,
              onPressed: _verify,
            )
          else
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFFD97706).withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFD97706).withValues(alpha: 0.5)),
              ),
              child: Row(
                children: [
                  const HugeIcon(icon: HugeIcons.strokeRoundedAlert02, color: Color(0xFFD97706), size: 22),
                  const Gap(12),
                  Expanded(
                    child: Text(
                      parcel.status == ParcelStatus.delivered
                          ? 'This parcel has already been delivered.'
                          : 'This parcel isn’t at the station yet (${parcel.status.displayLabel}).',
                      style: GoogleFonts.outfit(fontSize: 14, height: 1.35, color: palette.fg(0.85)),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ],
    );
  }
}
