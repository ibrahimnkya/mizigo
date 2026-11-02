import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/app_theme.dart';
import '../../theme/staff_palette.dart';

/// "Step 2 of 3 · Receiver" with a segmented progress bar, for multi-step
/// flows such as Receive Parcel.
class StepProgress extends StatelessWidget {
  const StepProgress({super.key, required this.step, required this.total, required this.label});

  /// 1-based current step.
  final int step;
  final int total;
  final String label;

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Step $step of $total',
                style: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.w600, color: AppTheme.tecOrange),
              ),
              TextSpan(
                text: '  ·  $label',
                style: GoogleFonts.outfit(fontSize: 14, color: palette.fg(0.65)),
              ),
            ],
          ),
        ),
        const Gap(8),
        Row(
          children: [
            for (var i = 1; i <= total; i++) ...[
              if (i > 1) const Gap(6),
              Expanded(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: 5,
                  decoration: BoxDecoration(
                    color: i <= step ? AppTheme.tecOrange : palette.surface(0.15),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
