import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';

import '../../models/parcel_model.dart';
import '../../providers/parcel_provider.dart';
import '../../theme/staff_palette.dart';
import '../../utils/parcel_search.dart';
import 'parcel_badges.dart';

/// Wraps a search field with a live suggestions dropdown drawn from the
/// parcels already loaded in [ParcelProvider]:
/// - matching parcels (tap to open),
/// - with [phrases], completions for the word being typed — places
///   ("to Dodoma"), people and status words — tap to fill the search.
class ParcelSearchSuggestions extends StatefulWidget {
  const ParcelSearchSuggestions({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.fieldBuilder,
    required this.onParcelSelected,
    this.phrases = false,
  });

  final TextEditingController controller;
  final FocusNode focusNode;

  /// Builds the actual search field (it must use [controller] and [focusNode]).
  final WidgetBuilder fieldBuilder;
  final ValueChanged<ParcelModel> onParcelSelected;
  final bool phrases;

  @override
  State<ParcelSearchSuggestions> createState() => _ParcelSearchSuggestionsState();
}

sealed class _Suggestion {}

class _Phrase extends _Suggestion {
  _Phrase(this.label, this.query, this.icon);
  final String label;
  final String query;
  final List<List<dynamic>> icon;
}

class _ParcelHit extends _Suggestion {
  _ParcelHit(this.parcel);
  final ParcelModel parcel;
}

const _statusPhrases = ['delivered', 'in transit', 'at station', 'received', 'cancelled', 'express', 'today', 'yesterday'];

class _ParcelSearchSuggestionsState extends State<ParcelSearchSuggestions> {
  static const _maxParcels = 4;
  static const _maxPhrases = 3;

  Iterable<_Suggestion> _build(String raw) {
    final query = raw.trim();
    if (query.isEmpty) return const [];
    final parcels = context.read<ParcelProvider>().parcels;
    final out = <_Suggestion>[];

    if (widget.phrases) {
      final words = query.split(RegExp(r'\s+'));
      final last = words.last.toLowerCase();
      final head = words.take(words.length - 1).join(' ');
      final prev = words.length > 1 ? words[words.length - 2].toLowerCase() : '';
      if (last.length >= 2 && last != 'to' && last != 'from') {
        String withWord(String w) => [if (head.isNotEmpty) head, w].join(' ');
        final seen = <String>{};
        void add(String label, String q, List<List<dynamic>> icon) {
          if (seen.add(q.toLowerCase()) && out.length < _maxPhrases) out.add(_Phrase(label, q, icon));
        }

        String city(String a) => a.split(',').first.trim();
        for (final p in parcels) {
          for (final c in [city(p.fromAddress), city(p.toAddress)]) {
            if (c.toLowerCase().startsWith(last) && c.toLowerCase() != last) {
              if (prev == 'to' || prev == 'from') {
                add('${prev[0].toUpperCase()}${prev.substring(1)} $c', withWord(c), HugeIcons.strokeRoundedLocation01);
              } else {
                add('To $c', withWord('to $c'), HugeIcons.strokeRoundedLocation01);
                add('From $c', withWord('from $c'), HugeIcons.strokeRoundedLocation01);
              }
            }
          }
          for (final n in [p.receiverName, p.senderName ?? '']) {
            if (n.toLowerCase().startsWith(last) && n.toLowerCase() != last) {
              add(n, withWord(n), HugeIcons.strokeRoundedUser);
            }
          }
        }
        for (final s in _statusPhrases) {
          if (s.startsWith(last) && s != last) add(s[0].toUpperCase() + s.substring(1), withWord(s), HugeIcons.strokeRoundedFilter);
        }
      }
    }

    out.addAll(searchParcels(parcels, query).take(_maxParcels).map(_ParcelHit.new));
    return out;
  }

  void _select(_Suggestion s) {
    switch (s) {
      case _Phrase(:final query):
        final text = '$query ';
        widget.controller.value = TextEditingValue(
          text: text,
          selection: TextSelection.collapsed(offset: text.length),
        );
        widget.focusNode.requestFocus();
      case _ParcelHit(:final parcel):
        widget.focusNode.unfocus();
        widget.onParcelSelected(parcel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => RawAutocomplete<_Suggestion>(
        textEditingController: widget.controller,
        focusNode: widget.focusNode,
        optionsBuilder: (value) => _build(value.text),
        displayStringForOption: (s) => widget.controller.text,
        onSelected: _select,
        fieldViewBuilder: (context, _, _, _) => widget.fieldBuilder(context),
        optionsViewBuilder: (context, onSelected, options) =>
            _SuggestionPanel(width: constraints.maxWidth, options: options.toList(), onSelected: onSelected),
      ),
    );
  }
}

class _SuggestionPanel extends StatelessWidget {
  const _SuggestionPanel({required this.width, required this.options, required this.onSelected});

  final double width;
  final List<_Suggestion> options;
  final ValueChanged<_Suggestion> onSelected;

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: Material(
          color: palette.navBackground,
          elevation: 8,
          shadowColor: Colors.black.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(18),
          clipBehavior: Clip.antiAlias,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: width, minWidth: width, maxHeight: 320),
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 6),
              shrinkWrap: true,
              children: [
                for (final o in options)
                  switch (o) {
                    _Phrase() => _row(
                        context,
                        icon: o.icon,
                        title: o.label,
                        subtitle: 'Search',
                        trailing: HugeIcon(icon: HugeIcons.strokeRoundedArrowUpLeft01, color: palette.fg(0.4), size: 18),
                        onTap: () => onSelected(o),
                      ),
                    _ParcelHit(:final parcel) => _row(
                        context,
                        image: true,
                        title: (parcel.trackingNumber?.isNotEmpty ?? false) ? parcel.trackingNumber! : 'Parcel',
                        subtitle: '${parcel.fromAddress.split(',').first.trim()} → '
                            '${parcel.toAddress.split(',').first.trim()}'
                            '${parcel.receiverName.isNotEmpty ? ' • ${parcel.receiverName}' : ''}',
                        trailing: ParcelStatusBadge(status: parcel.status, small: true),
                        onTap: () => onSelected(o),
                      ),
                  },
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _row(
    BuildContext context, {
    List<List<dynamic>>? icon,
    bool image = false,
    required String title,
    required String subtitle,
    required Widget trailing,
    required VoidCallback onTap,
  }) {
    final palette = StaffPalette.of(context);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(color: palette.surface(0.12), borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: image
                    ? Image.asset('assets/images/staff_parcel.png', width: 22, height: 22)
                    : HugeIcon(icon: icon!, color: palette.fg(0.85), size: 18),
              ),
            ),
            const Gap(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.outfit(fontSize: 15, fontWeight: FontWeight.w600, color: palette.fg()),
                  ),
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.outfit(fontSize: 13, color: palette.fg(0.55)),
                  ),
                ],
              ),
            ),
            const Gap(8),
            trailing,
          ],
        ),
      ),
    );
  }
}
