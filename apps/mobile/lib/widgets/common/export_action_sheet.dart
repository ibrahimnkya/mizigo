import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';

enum ExportPeriod {
  today('Today'),
  thisWeek('This Week'),
  thisMonth('This Month'),
  last30Days('Last 30 Days'),
  last90Days('Last 90 Days'),
  custom('Custom Range');

  final String label;
  const ExportPeriod(this.label);
}

class ExportBottomSheet extends StatefulWidget {
  final String title;
  final String subtitle;
  final List<String> availableFormats;
  final String actionButtonText;
  final bool includeDateRange;
  final Future<void> Function(String format, DateTimeRange? dateRange) onExport;

  const ExportBottomSheet({
    super.key,
    this.title = 'Export Data',
    this.subtitle = 'Select your preferred export settings.',
    this.availableFormats = const ['PDF', 'CSV', 'Excel'],
    this.actionButtonText = 'Download',
    this.includeDateRange = true,
    required this.onExport,
  });

  static Future<void> show({
    required BuildContext context,
    String title = 'Export Data',
    String subtitle = 'Select your preferred export settings.',
    List<String> availableFormats = const ['PDF', 'CSV', 'Excel'],
    String actionButtonText = 'Download',
    bool includeDateRange = true,
    required Future<void> Function(String format, DateTimeRange? dateRange) onExport,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => ExportBottomSheet(
        title: title,
        subtitle: subtitle,
        availableFormats: availableFormats,
        actionButtonText: actionButtonText,
        includeDateRange: includeDateRange,
        onExport: onExport,
      ),
    );
  }

  @override
  State<ExportBottomSheet> createState() => _ExportBottomSheetState();
}

class _ExportBottomSheetState extends State<ExportBottomSheet> {
  late String selectedFormat;
  ExportPeriod selectedPeriod = ExportPeriod.thisMonth;
  DateTimeRange? customRange;
  bool _isExporting = false;

  @override
  void initState() {
    super.initState();
    selectedFormat = widget.availableFormats.first;
  }

  void _handleExport() async {
    setState(() => _isExporting = true);
    try {
      await widget.onExport(selectedFormat, customRange);
      if (mounted) {
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Export failed: $e', style: GoogleFonts.inter(color: Colors.white)),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isExporting = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF0F172A),
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      padding: EdgeInsets.fromLTRB(24, 24, 24, MediaQuery.of(context).viewInsets.bottom + 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 48,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFF334155),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const Gap(24),
          Text(widget.title,
              style: GoogleFonts.outfit(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.white)),
          const Gap(8),
          Text(widget.subtitle,
              style: GoogleFonts.inter(
                  fontSize: 14, color: const Color(0xFF94A3B8))),
          const Gap(28),

          if (widget.availableFormats.isNotEmpty) ...[
            Text('Format',
                style: GoogleFonts.outfit(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white)),
            const Gap(12),
            Row(
              children: widget.availableFormats.map((format) {
                final isSelected = selectedFormat == format;
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: GestureDetector(
                    onTap: () => setState(() => selectedFormat = format),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFF3B82F6).withValues(alpha: 0.15) : const Color(0xFF1E293B),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected ? const Color(0xFF3B82F6) : Colors.transparent,
                          width: 1.5,
                        ),
                      ),
                      child: Text(
                        format,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: isSelected ? const Color(0xFF3B82F6) : const Color(0xFF94A3B8),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const Gap(24),
          ],

          if (widget.includeDateRange) ...[
            Text('Date Range',
                style: GoogleFonts.outfit(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white)),
            const Gap(12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: ExportPeriod.values.map((period) {
                final isSelected = selectedPeriod == period;
                return GestureDetector(
                  onTap: () async {
                    if (period == ExportPeriod.custom) {
                      final range = await showDateRangePicker(
                        context: context,
                        firstDate: DateTime(2020),
                        lastDate: DateTime.now(),
                        builder: (context, child) => Theme(
                          data: ThemeData.dark().copyWith(
                            colorScheme: const ColorScheme.dark(
                              primary: Color(0xFF3B82F6),
                              surface: Color(0xFF1E293B),
                            ),
                          ),
                          child: child!,
                        ),
                      );
                      if (range != null) {
                        setState(() {
                          selectedPeriod = period;
                          customRange = range;
                        });
                      }
                    } else {
                      setState(() {
                        selectedPeriod = period;
                        customRange = null;
                      });
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xFF3B82F6).withValues(alpha: 0.15) : const Color(0xFF1E293B),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected ? const Color(0xFF3B82F6) : Colors.transparent,
                        width: 1.5,
                      ),
                    ),
                    child: Text(
                      period == ExportPeriod.custom && isSelected && customRange != null
                          ? '${customRange!.start.day}/${customRange!.start.month} - ${customRange!.end.day}/${customRange!.end.month}'
                          : period.label,
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: isSelected ? const Color(0xFF3B82F6) : const Color(0xFF94A3B8),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const Gap(40),
          ],

          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: _isExporting ? null : _handleExport,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3B82F6),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 0,
              ),
              child: _isExporting
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                    )
                  : Text(
                      widget.actionButtonText,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
          ),
          const Gap(12),
        ],
      ),
    );
  }
}
