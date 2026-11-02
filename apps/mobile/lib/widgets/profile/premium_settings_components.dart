import 'dart:async';
import 'dart:ui' show ImageFilter;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:gap/gap.dart';
import '../../theme/app_theme.dart';
import '../../theme/staff_palette.dart';

class SettingsGroup extends StatelessWidget {
  final String? title;
  final List<Widget> children;
  final String? description;

  const SettingsGroup({
    super.key,
    this.title,
    required this.children,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 8),
            child: Text(
              title!.toUpperCase(),
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.5),
                letterSpacing: 1.2,
              ),
            ),
          ),
        ],
        Container(
          decoration: BoxDecoration(
            color: AppTheme.background,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppTheme.border,
            ),
          ),
          child: Column(
            children: [
              for (int i = 0; i < children.length; i++) ...[
                children[i],
                if (i < children.length - 1)
                  Divider(
                    height: 1,
                    indent: 56,
                    color: AppTheme.border,
                  ),
              ],
            ],
          ),
        ),
        if (description != null) ...[
          const Gap(8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              description!,
              style: GoogleFonts.inter(
                fontSize: 13,
                color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.6),
                height: 1.4,
              ),
            ),
          ),
        ],
        const Gap(24),
      ],
    );
  }
}

class SettingsTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final dynamic icon; // Supports IconData or List<List<dynamic>> for HugeIcons
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? iconColor;
  final bool showChevron;
  final bool isDestructive;

  const SettingsTile({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.trailing,
    this.onTap,
    this.iconColor,
    this.showChevron = true,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            if (icon != null) ...[
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: isDestructive
                      ? Colors.red.withValues(alpha: 0.1)
                      : (iconColor ?? theme.primaryColor).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: _buildIcon(context),
                ),
              ),
              const Gap(16),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isDestructive
                          ? Colors.red
                          : theme.textTheme.bodyLarge?.color,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const Gap(2),
                    Text(
                      subtitle!,
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (trailing != null) ...[
              trailing!,
            ] else if (showChevron) ...[
               HugeIcon(
                icon: HugeIcons.strokeRoundedArrowRight01,
                size: 18,
                color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.4),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(BuildContext context) {
    final theme = Theme.of(context);
    final color = isDestructive ? Colors.red : (iconColor ?? theme.primaryColor);
    
    if (icon is IconData) {
      return Icon(icon as IconData, color: color, size: 20);
    } else {
      return HugeIcon(
        icon: icon as List<List<dynamic>>,
        color: color,
        size: 20,
      );
    }
  }
}

class SettingsSwitchTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final dynamic icon;
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color? iconColor;

  const SettingsSwitchTile({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    required this.value,
    required this.onChanged,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsTile(
      title: title,
      subtitle: subtitle,
      icon: icon,
      iconColor: iconColor,
      showChevron: false,
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeThumbColor: Theme.of(context).primaryColor,
        activeTrackColor: Theme.of(context).primaryColor.withValues(alpha: 0.2),
        inactiveTrackColor: Colors.grey.withValues(alpha: 0.1),
      ),
    );
  }
}

class SettingsAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// See-through bar (for screens with header art behind it).
  final bool transparent;

  final String title;
  final List<Widget>? actions;
  final VoidCallback? onBack;

  const SettingsAppBar({
    super.key,
    required this.title,
    this.actions,
    this.onBack,
    this.transparent = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appBarTheme = theme.appBarTheme;
    final appBarBgColor = transparent ? Colors.transparent : (appBarTheme.backgroundColor ?? theme.primaryColor);
    final appBarTextColor = appBarTheme.titleTextStyle?.color ?? Colors.white;

    return AppBar(
      backgroundColor: appBarBgColor,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      leading: IconButton(
        onPressed: onBack ?? () => Navigator.of(context).pop(),
        icon: const HugeIcon(
          icon: HugeIcons.strokeRoundedArrowLeft01,
          color: Colors.white,
          size: 22,
        ),
      ),
      title: Text(
        title,
        style: GoogleFonts.outfit(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: appBarTextColor,
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class SettingsCTAButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final bool isLoading;
  final dynamic icon;

  const SettingsCTAButton({
    super.key,
    required this.title,
    this.onTap,
    this.isLoading = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    final onPrimaryColor = theme.colorScheme.onPrimary;

    return SizedBox(
      width: double.infinity,
      height: 56,
      child: FilledButton(
        onPressed: isLoading ? null : onTap,
        style: FilledButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: onPrimaryColor,
          disabledBackgroundColor: theme.disabledColor.withValues(alpha: 0.12),
          disabledForegroundColor: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
        child: isLoading
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: onPrimaryColor,
                  strokeWidth: 2.5,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    _buildIcon(onPrimaryColor),
                    const Gap(10),
                  ],
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: onPrimaryColor,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildIcon(Color color) {
    if (icon is IconData) {
      return Icon(icon as IconData, color: color, size: 20);
    } else if (icon is List<List<dynamic>>) {
      return HugeIcon(
        icon: icon as List<List<dynamic>>,
        color: color,
        size: 20,
      );
    }
    return const SizedBox.shrink();
  }
}

class MizigoToasts {
  static const _success = Color(0xFF34D399);
  static const _error = Color(0xFFF87171);
  static const _info = Color(0xFFE8913A);

  static void showSuccess(BuildContext context, String message) =>
      _show(context, message, _success, HugeIcons.strokeRoundedCheckmarkCircle02, 'Success');

  static void showError(BuildContext context, String message) {
    final display = message.toLowerCase().contains('api') ? 'Couldn’t reach the server. Try again.' : message;
    _show(context, display, _error, HugeIcons.strokeRoundedAlert02, 'Error');
  }

  static void showInfo(BuildContext context, String message) =>
      _show(context, message, _info, HugeIcons.strokeRoundedInformationCircle, 'Info');

  static OverlayEntry? _current;
  static Timer? _dismissTimer;

  /// Shows the toast as an [OverlayEntry], not a dialog route. A route here
  /// would be closed with `Navigator.pop()`, and if a screen was pushed in the
  /// meantime (e.g. "code sent" → open the code screen) that pop would close
  /// the new screen instead of the toast.
  static void _show(
    BuildContext context,
    String message,
    Color statusColor,
    List<List<dynamic>> icon,
    String type,
  ) {
    final overlay = Overlay.maybeOf(context, rootOverlay: true);
    if (overlay == null) return;

    _remove();
    late final OverlayEntry entry;
    entry = OverlayEntry(
      builder: (_) => _ToastBanner(
        message: message,
        statusColor: statusColor,
        icon: icon,
        type: type,
        onDismiss: () {
          if (identical(_current, entry)) _remove();
        },
      ),
    );
    _current = entry;
    overlay.insert(entry);
    _dismissTimer = Timer(const Duration(seconds: 3), () {
      if (identical(_current, entry)) _remove();
    });
  }

  static void _remove() {
    _dismissTimer?.cancel();
    _dismissTimer = null;
    _current?.remove();
    _current = null;
  }
}

class _ToastBanner extends StatefulWidget {
  const _ToastBanner({
    required this.message,
    required this.statusColor,
    required this.icon,
    required this.type,
    required this.onDismiss,
  });

  final String message;
  final Color statusColor;
  final List<List<dynamic>> icon;
  final String type;
  final VoidCallback onDismiss;

  @override
  State<_ToastBanner> createState() => _ToastBannerState();
}

class _ToastBannerState extends State<_ToastBanner> with SingleTickerProviderStateMixin {
  late final AnimationController _anim = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 220),
  )..forward();

  @override
  void dispose() {
    _anim.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    final top = MediaQuery.of(context).padding.top + 10;
    final curved = CurvedAnimation(parent: _anim, curve: Curves.easeOutCubic);
    final color = widget.statusColor;

    return Positioned(
      top: top,
      left: 16,
      right: 16,
      child: FadeTransition(
        opacity: curved,
        child: SlideTransition(
          position: Tween(begin: const Offset(0, -0.4), end: Offset.zero).animate(curved),
          child: Semantics(
            liveRegion: true,
            label: '${widget.type}: ${widget.message}',
            child: Dismissible(
              key: const ValueKey('toast'),
              direction: DismissDirection.up,
              onDismissed: (_) => widget.onDismiss(),
              child: GestureDetector(
                onTap: widget.onDismiss,
                child: Material(
                  color: Colors.transparent,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(22),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(12, 12, 16, 12),
                        decoration: BoxDecoration(
                          color: palette.navBackground.withValues(alpha: 0.94),
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(color: palette.navBorder),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.25),
                              blurRadius: 24,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 38,
                              height: 38,
                              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
                              child: Center(child: HugeIcon(icon: widget.icon, color: Colors.white, size: 20)),
                            ),
                            const Gap(12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    widget.type,
                                    style: GoogleFonts.outfit(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: palette.fg(),
                                    ),
                                  ),
                                  Text(
                                    widget.message,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.outfit(fontSize: 14, height: 1.3, color: palette.fg(0.7)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
