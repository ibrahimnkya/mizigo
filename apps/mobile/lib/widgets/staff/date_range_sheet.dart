import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';

import '../../theme/staff_palette.dart';
import 'staff_settings.dart';

/// Themed date-range bottom sheet: quick presets plus custom From / To.
/// Resolves to the chosen range (whole days, inclusive) or null if dismissed.
Future<DateTimeRange?> showStaffDateRangeSheet(
  BuildContext context, {
  DateTimeRange? initial,
  String title = 'Select dates',
}) {
  return showStaffSheet<DateTimeRange>(
    context,
    title: title,
    builder: (sheetContext) => _DateRangeBody(initial: initial),
  );
}

class _DateRangeBody extends StatefulWidget {
  const _DateRangeBody({this.initial});

  final DateTimeRange? initial;

  @override
  State<_DateRangeBody> createState() => _DateRangeBodyState();
}

class _DateRangeBodyState extends State<_DateRangeBody> {
  static final _fmt = DateFormat('d MMM yyyy');
  late DateTime? _start = widget.initial?.start;
  late DateTime? _end = widget.initial?.end;

  static DateTime _day(DateTime d) => DateTime(d.year, d.month, d.day);

  List<(String, DateTimeRange)> get _presets {
    final today = _day(DateTime.now());
    final monthStart = DateTime(today.year, today.month);
    final lastMonthStart = DateTime(today.year, today.month - 1);
    return [
      ('Today', DateTimeRange(start: today, end: today)),
      ('Yesterday', DateTimeRange(start: today.subtract(const Duration(days: 1)), end: today.subtract(const Duration(days: 1)))),
      ('Last 7 days', DateTimeRange(start: today.subtract(const Duration(days: 6)), end: today)),
      ('Last 30 days', DateTimeRange(start: today.subtract(const Duration(days: 29)), end: today)),
      ('This month', DateTimeRange(start: monthStart, end: today)),
      ('Last month', DateTimeRange(start: lastMonthStart, end: monthStart.subtract(const Duration(days: 1)))),
    ];
  }

  String _label(DateTimeRange r) =>
      r.start == r.end ? _fmt.format(r.start) : '${_fmt.format(r.start)} – ${_fmt.format(r.end)}';

  Future<void> _pick({required bool start}) async {
    final today = _day(DateTime.now());
    final picked = await showDatePicker(
      context: context,
      initialDate: (start ? _start : _end) ?? today,
      firstDate: start ? DateTime(today.year - 3) : (_start ?? DateTime(today.year - 3)),
      lastDate: start ? (_end ?? today) : today,
      helpText: start ? 'From' : 'To',
    );
    if (picked == null) return;
    setState(() => start ? _start = picked : _end = picked);
  }

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    final ready = _start != null && _end != null;
    final current = ready ? DateTimeRange(start: _start!, end: _end!) : null;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const StaffSheetSectionLabel('Quick picks'),
          for (final (name, range) in _presets)
            StaffSheetTile(
              icon: HugeIcons.strokeRoundedCalendar03,
              label: name,
              subtitle: _label(range),
              selected: current != null && current.start == range.start && current.end == range.end,
              onTap: () => Navigator.pop(context, range),
            ),
          const StaffSheetSectionLabel('Custom range'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Expanded(
                  child: _DateBox(
                    label: 'From',
                    value: _start == null ? 'Choose' : _fmt.format(_start!),
                    onTap: () => _pick(start: true),
                  ),
                ),
                const Gap(10),
                Expanded(
                  child: _DateBox(
                    label: 'To',
                    value: _end == null ? 'Choose' : _fmt.format(_end!),
                    onTap: () => _pick(start: false),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
            child: StaffButton(
              label: ready ? 'Apply · ${_label(current!)}' : 'Choose both dates',
              icon: HugeIcons.strokeRoundedCheckmarkCircle02,
              onPressed: ready ? () => Navigator.pop(context, current) : null,
            ),
          ),
          if (!ready)
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
              child: Text(
                'Or tap a quick pick above.',
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(fontSize: 13, color: palette.fg(0.5)),
              ),
            ),
        ],
      ),
    );
  }
}

class _DateBox extends StatelessWidget {
  const _DateBox({required this.label, required this.value, required this.onTap});

  final String label;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    final chosen = value != 'Choose';
    return Material(
      color: palette.surface(0.08),
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: chosen ? kStaffAccent : palette.fg(0.2)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: GoogleFonts.outfit(fontSize: 12, color: palette.fg(0.55))),
              const Gap(2),
              Text(
                value,
                style: GoogleFonts.outfit(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: chosen ? palette.fg() : palette.fg(0.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
