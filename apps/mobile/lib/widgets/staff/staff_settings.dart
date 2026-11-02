import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../theme/staff_palette.dart';
import '../common/station_header_art.dart';

/// Shared building blocks for the staff settings screens (App Settings,
/// Printer Settings, …): blurred header art, sticky centered title with a back
/// arrow, glass cards, settings rows and glass bottom sheets. All colors come
/// from [StaffPalette], so the screens follow the selected theme.

/// Orange used for values, links and selection on settings screens.
const kStaffAccent = Color(0xFFE8913A);

/// Red for destructive actions and failures.
const kStaffDanger = Color(0xFFF87171);

/// Green for success / connected states.
const kStaffSuccess = Color(0xFF34D399);

/// The one download icon used everywhere (buttons, sheets, headers).
const kStaffDownloadIcon = HugeIcons.strokeRoundedDownload04;

/// Page shell: themed background, blurred header art, sticky title, scrolling
/// list of [children].
class StaffSettingsScaffold extends StatelessWidget {
  const StaffSettingsScaffold({
    super.key,
    required this.title,
    required this.children,
    this.onBack,
    this.onRefresh,
    this.trailing,
    this.bottom,
  });

  final String title;
  final List<Widget> children;
  final VoidCallback? onBack;

  /// Optional top-right action (e.g. a help button), 56px wide.
  final Widget? trailing;

  /// Optional action pinned below the list (e.g. a primary button).
  final Widget? bottom;

  /// Enables pull-to-refresh when set.
  final Future<void> Function()? onRefresh;

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);

    Widget list = ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.fromLTRB(18, 8, 18, 32 + MediaQuery.of(context).padding.bottom),
      children: children,
    );
    if (onRefresh != null) {
      list = RefreshIndicator(
        onRefresh: onRefresh!,
        color: kStaffAccent,
        backgroundColor: palette.navBackground,
        child: list,
      );
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: palette.overlayStyle,
      child: Scaffold(
        backgroundColor: palette.background,
        body: Stack(
          children: [
            const StationHeaderArt(blur: 8),
            SafeArea(
              bottom: false,
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 56,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 56,
                          child: onBack == null
                              ? null
                              : Semantics(
                                  button: true,
                                  label: 'Back',
                                  child: GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: onBack,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 22),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: HugeIcon(
                                          icon: HugeIcons.strokeRoundedArrowLeft02,
                                          color: palette.fg(),
                                          size: 26,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                        Expanded(
                          child: Text(
                            title,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.outfit(fontSize: 24, fontWeight: FontWeight.w700, color: palette.fg()),
                          ),
                        ),
                        SizedBox(width: 56, child: trailing),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(child: list),
                  if (bottom != null)
                    SafeArea(
                      top: false,
                      minimum: const EdgeInsets.fromLTRB(18, 8, 18, 12),
                      child: bottom!,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Rounded translucent card with an optional bold title and title-row action.
class StaffGlassCard extends StatelessWidget {
  const StaffGlassCard({
    super.key,
    this.title,
    this.subtitle,
    this.titleAction,
    required this.child,
    this.padding = const EdgeInsets.fromLTRB(16, 0, 16, 16),
  });

  final String? title;

  /// Short explanation under the title.
  final String? subtitle;
  final Widget? titleAction;
  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: palette.surface(0.12),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: palette.surface(0.12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: subtitle == null ? 20 : 4),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title!,
                      style: GoogleFonts.outfit(fontSize: 19, fontWeight: FontWeight.w700, color: palette.fg()),
                    ),
                  ),
                  ?titleAction,
                ],
              ),
            ),
          if (subtitle != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                subtitle!,
                style: GoogleFonts.outfit(fontSize: 14, height: 1.35, color: palette.fg(0.6)),
              ),
            ),
          child,
        ],
      ),
    );
  }
}

/// Thin separator between rows inside a [StaffGlassCard].
class StaffDivider extends StatelessWidget {
  const StaffDivider({super.key});

  @override
  Widget build(BuildContext context) =>
      Divider(height: 1, thickness: 1, color: StaffPalette.of(context).surface(0.10));
}

/// Settings row: icon, title, optional accent value and a chevron.
class StaffSettingsTile extends StatelessWidget {
  const StaffSettingsTile({
    super.key,
    required this.icon,
    required this.title,
    this.value,
    this.onTap,
    this.showChevron = true,
  });

  final List<List<dynamic>> icon;
  final String title;
  final String? value;
  final VoidCallback? onTap;
  final bool showChevron;

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 52,
        child: Row(
          children: [
            HugeIcon(icon: icon, color: palette.fg(), size: 24),
            const SizedBox(width: 20),
            Expanded(
              child: Text(title, style: GoogleFonts.outfit(fontSize: 17, color: palette.fg())),
            ),
            if (value != null)
              Text(value!, style: GoogleFonts.outfit(fontSize: 17, color: kStaffAccent)),
            if (showChevron) ...[
              const SizedBox(width: 14),
              HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01, color: palette.fg(), size: 20),
            ],
          ],
        ),
      ),
    );
  }
}

/// Pill button for settings cards: filled accent, or outlined (e.g. danger).
class StaffButton extends StatelessWidget {
  const StaffButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.color = kStaffAccent,
    this.outlined = false,
    this.loading = false,
    this.iconAfter = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final List<List<dynamic>>? icon;
  final Color color;
  final bool outlined;
  final bool loading;

  /// Put the icon after the label (e.g. a forward arrow on "Continue").
  final bool iconAfter;

  @override
  Widget build(BuildContext context) {
    final fgColor = outlined ? color : Colors.white;
    final content = loading
        ? SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: fgColor))
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null && !iconAfter) ...[
                HugeIcon(icon: icon!, color: fgColor, size: 20),
                const SizedBox(width: 8),
              ],
              Flexible(
                child: Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w600, color: fgColor),
                ),
              ),
              if (icon != null && iconAfter) ...[
                const SizedBox(width: 8),
                HugeIcon(icon: icon!, color: fgColor, size: 20),
              ],
            ],
          );

    final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(14));
    return SizedBox(
      height: 48,
      child: outlined
          ? OutlinedButton(
              onPressed: loading ? null : onPressed,
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: color.withValues(alpha: 0.7)),
                shape: shape,
                padding: const EdgeInsets.symmetric(horizontal: 12),
              ),
              child: content,
            )
          : ElevatedButton(
              onPressed: loading ? null : onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                disabledBackgroundColor: color.withValues(alpha: 0.5),
                elevation: 0,
                shape: shape,
                padding: const EdgeInsets.symmetric(horizontal: 12),
              ),
              child: content,
            ),
    );
  }
}

/// Glass bottom sheet matching the settings screens.
Future<T?> showStaffSheet<T>(
  BuildContext context, {
  required String title,
  Widget? titleAction,
  required WidgetBuilder builder,
}) {
  final palette = StaffPalette.of(context);
  return showModalBottomSheet<T>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (sheetContext) => Container(
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
      decoration: BoxDecoration(
        color: palette.navBackground,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
        border: Border.all(color: palette.surface(0.12)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          // Figma "Camera / Gallery / Remove Photo" sheet spacing.
          padding: const EdgeInsets.fromLTRB(0, 12, 0, 28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(color: palette.fg(0.2), borderRadius: BorderRadius.circular(2)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 16, 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: GoogleFonts.outfit(fontSize: 19, fontWeight: FontWeight.w700, color: palette.fg()),
                      ),
                    ),
                    ?titleAction,
                  ],
                ),
              ),
              Flexible(child: builder(sheetContext)),
            ],
          ),
        ),
      ),
    ),
  );
}

/// Row with icon, title, subtitle and an accent switch.
class StaffSwitchTile extends StatelessWidget {
  const StaffSwitchTile({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    required this.value,
    required this.onChanged,
  });

  final List<List<dynamic>> icon;
  final String title;
  final String? subtitle;
  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    return MergeSemantics(
      child: InkWell(
        onTap: onChanged == null ? null : () => onChanged!(!value),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              HugeIcon(icon: icon, color: palette.fg(), size: 24),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: GoogleFonts.outfit(fontSize: 17, color: palette.fg())),
                    if (subtitle != null) ...[
                      const SizedBox(height: 2),
                      Text(subtitle!, style: GoogleFonts.outfit(fontSize: 14, height: 1.3, color: palette.fg(0.6))),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Switch(
                value: value,
                onChanged: onChanged,
                activeThumbColor: Colors.white,
                activeTrackColor: kStaffAccent,
                inactiveThumbColor: palette.fg(0.8),
                inactiveTrackColor: palette.surface(0.15),
                trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Read-only detail row: icon, small label and the value underneath.
class StaffInfoRow extends StatelessWidget {
  const StaffInfoRow({super.key, required this.icon, required this.label, required this.value});

  final List<List<dynamic>> icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          HugeIcon(icon: icon, color: palette.fg(0.85), size: 24),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: GoogleFonts.outfit(fontSize: 13, color: palette.fg(0.55))),
                const SizedBox(height: 2),
                Text(value, style: GoogleFonts.outfit(fontSize: 17, color: palette.fg())),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Labelled text input in the glass style.
class StaffTextField extends StatelessWidget {
  const StaffTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.icon,
    this.hint,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.maxLines = 1,
    this.autofocus = false,
    this.inputFormatters,
  });

  final String label;
  final TextEditingController controller;
  final List<List<dynamic>> icon;
  final String? hint;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final int maxLines;
  final bool autofocus;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    OutlineInputBorder border(Color c, [double w = 1]) =>
        OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: c, width: w));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(label, style: GoogleFonts.outfit(fontSize: 14, color: palette.fg(0.7))),
        ),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          textInputAction: textInputAction,
          validator: validator,
          onChanged: onChanged,
          maxLines: maxLines,
          minLines: 1,
          autofocus: autofocus,
          cursorColor: kStaffAccent,
          style: GoogleFonts.outfit(fontSize: 16, color: palette.fg()),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.outfit(fontSize: 16, color: palette.fg(0.45)),
            filled: true,
            fillColor: palette.surface(0.06),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 14, right: 10),
              child: HugeIcon(icon: icon, color: palette.fg(0.8), size: 22),
            ),
            prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
            contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
            border: border(palette.fg(0.25)),
            enabledBorder: border(palette.fg(0.25)),
            focusedBorder: border(kStaffAccent, 1.5),
            errorBorder: border(kStaffDanger),
            focusedErrorBorder: border(kStaffDanger, 1.5),
            errorStyle: GoogleFonts.outfit(fontSize: 13, color: kStaffDanger),
          ),
        ),
      ],
    );
  }
}

/// Checkbox row for consents/acknowledgements.
class StaffCheckboxTile extends StatelessWidget {
  const StaffCheckboxTile({
    super.key,
    required this.text,
    required this.value,
    required this.onChanged,
    this.activeColor = kStaffAccent,
  });

  final String text;
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    return MergeSemantics(
      child: InkWell(
        onTap: () => onChanged(!value),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(
                  value: value,
                  onChanged: (v) => onChanged(v ?? false),
                  activeColor: activeColor,
                  checkColor: Colors.white,
                  side: BorderSide(color: palette.fg(0.5), width: 1.5),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(text, style: GoogleFonts.outfit(fontSize: 15, height: 1.4, color: palette.fg(0.85))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Selectable pill (single choice lists such as a reason picker).
class StaffChoiceChip extends StatelessWidget {
  const StaffChoiceChip({super.key, required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    return Semantics(
      selected: selected,
      button: true,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: selected ? kStaffAccent.withValues(alpha: 0.18) : palette.surface(0.08),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: selected ? kStaffAccent : palette.fg(0.2)),
          ),
          child: Text(
            label,
            style: GoogleFonts.outfit(
              fontSize: 15,
              fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
              color: selected ? kStaffAccent : palette.fg(0.85),
            ),
          ),
        ),
      ),
    );
  }
}

/// Glass confirmation sheet; resolves to true when confirmed.
Future<bool> showStaffConfirmSheet(
  BuildContext context, {
  required String title,
  required String message,
  required String confirmText,
  String cancelText = 'Cancel',
  bool danger = false,
}) async {
  final palette = StaffPalette.of(context);
  final result = await showStaffSheet<bool>(
    context,
    title: title,
    builder: (sheetContext) => Padding(
      padding: const EdgeInsets.fromLTRB(24, 4, 24, 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(message, style: GoogleFonts.outfit(fontSize: 15, height: 1.45, color: palette.fg(0.75))),
          const SizedBox(height: 24),
          StaffButton(
            label: confirmText,
            color: danger ? kStaffDanger : kStaffAccent,
            onPressed: () => Navigator.pop(sheetContext, true),
          ),
          const SizedBox(height: 10),
          StaffButton(
            label: cancelText,
            color: palette.fg(0.7),
            outlined: true,
            onPressed: () => Navigator.pop(sheetContext, false),
          ),
        ],
      ),
    ),
  );
  return result ?? false;
}

/// Option row for bottom sheets, matching the Figma photo sheet (Camera /
/// Gallery / Remove Photo): tinted 44px rounded-square icon + label. Optional
/// [subtitle]; [selected] shows an accent check for single-choice lists.
class StaffSheetTile extends StatelessWidget {
  const StaffSheetTile({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.subtitle,
    this.color,
    this.selected = false,
  });

  final List<List<dynamic>> icon;
  final String label;
  final String? subtitle;
  final VoidCallback? onTap;

  /// Icon/tint color; defaults to the theme text color (accent when selected).
  final Color? color;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    final tint = color ?? (selected ? kStaffAccent : palette.fg());
    return Semantics(
      selected: selected,
      button: true,
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(color: tint.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(12)),
          child: Center(child: HugeIcon(icon: icon, color: tint, size: 22)),
        ),
        title: Text(
          label,
          style: GoogleFonts.outfit(
            fontSize: 16,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
            color: selected ? kStaffAccent : palette.fg(),
          ),
        ),
        subtitle: subtitle == null
            ? null
            : Text(subtitle!, style: GoogleFonts.outfit(fontSize: 13, color: palette.fg(0.55))),
        trailing: selected
            ? const HugeIcon(icon: HugeIcons.strokeRoundedCheckmarkCircle02, color: kStaffAccent, size: 22)
            : null,
      ),
    );
  }
}

/// Small section label inside a sheet (e.g. "Wagon / Train").
class StaffSheetSectionLabel extends StatelessWidget {
  const StaffSheetSectionLabel(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 4),
        child: Text(
          text.toUpperCase(),
          style: GoogleFonts.outfit(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
            color: StaffPalette.of(context).fg(0.5),
          ),
        ),
      );
}
