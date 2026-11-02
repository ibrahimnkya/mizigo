import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../services/api_service.dart';
import '../../widgets/profile/premium_settings_components.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/common/station_header_art.dart';
import '../../widgets/staff/staff_settings.dart';
import '../../theme/staff_palette.dart';

// ── Design tokens (match the maroon glass design) ───────────────────────────
const _bgMid = Color(0xFF5A1219);
const _accent = Color(0xFFE8913A); // orange "+" badge
const _danger = Color(0xFFF87171);

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<void> _pickImage(ImageSource source) async {
    Navigator.of(context).pop();
    final auth = context.read<AuthProvider>();
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: source, imageQuality: 85, maxWidth: 800);
    if (picked != null && mounted) await auth.saveAvatarPath(picked.path);
  }

  void _showImagePickerSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        decoration: BoxDecoration(
          color: StaffPalette.of(context).navBackground,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
          border: Border.all(color: StaffPalette.of(context).surface(0.12)),
        ),
        padding: const EdgeInsets.fromLTRB(0, 12, 0, 36),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: StaffPalette.of(context).fg(0.2),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const Gap(8),
            _sheetTile(
              icon: HugeIcons.strokeRoundedCamera01,
              label: 'Camera',
              color: StaffPalette.of(context).fg(),
              onTap: () => _pickImage(ImageSource.camera),
            ),
            _sheetTile(
              icon: HugeIcons.strokeRoundedImage01,
              label: 'Gallery',
              color: _accent,
              onTap: () => _pickImage(ImageSource.gallery),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _confirmLogout() async {
    final confirmed = await showStaffConfirmSheet(
      context,
      title: 'Log out of MiziGO?',
      message: 'You’ll need your phone number and PIN to sign in again.',
      confirmText: 'Log Out',
      danger: true,
    );
    if (!confirmed || !mounted) return;
    await context.read<AuthProvider>().logout();
    if (mounted) context.go('/login');
  }

  Widget _sheetTile({
    required List<List<dynamic>> icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) =>
      StaffSheetTile(icon: icon, label: label, color: color, onTap: onTap);

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    final user = auth.user;
    final name = user?.name ?? 'User';
    final phone = user?.phone ?? 'Not set';
    final avatarUrl = user?.avatarUrl;

    // The tab bar sits below the page, so only a normal margin is needed.
    const bottomPad = 24.0;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: StaffPalette.of(context).overlayStyle,
      child: Scaffold(
        backgroundColor: StaffPalette.of(context).background,
        body: Stack(
          children: [
            const StationHeaderArt(blur: 8),
            SafeArea(
              bottom: false,
              child: Column(
                children: [
                  // Sticky header: stays put while the content below scrolls.
                  const Gap(28),
                  Text(
                    'You',
                    style: GoogleFonts.outfit(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: StaffPalette.of(context).fg(),
                    ),
                  ),
                  const Gap(16),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.fromLTRB(18, 8, 18, bottomPad),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _UserInfoCard(
                            name: name,
                            phone: phone,
                            avatarUrl: avatarUrl,
                            onAvatarTap: _showImagePickerSheet,
                          ),
                          const Gap(10),
                          _MenuSection(
                            title: 'Account & Preferences',
                            items: [
                              _MenuItem(icon: HugeIcons.strokeRoundedUserList, title: 'Personal Information', onTap: () => context.push('/profile/personal-info')),
                              _MenuItem(icon: HugeIcons.strokeRoundedSlidersHorizontal, title: 'App Settings', onTap: () => context.push('/profile/app-settings')),
                              _MenuItem(icon: HugeIcons.strokeRoundedPrinter, title: 'Printer Settings', onTap: () => context.push('/profile/printer-settings')),
                              _MenuItem(icon: HugeIcons.strokeRoundedNotification01, title: 'Notifications', onTap: () => context.push('/profile/notifications')),
                              _MenuItem(icon: HugeIcons.strokeRoundedSecurityPassword, title: 'Login & Security', onTap: () => context.push('/profile/security')),
                              _MenuItem(icon: HugeIcons.strokeRoundedAccess, title: 'Privacy & Permissions', onTap: () => context.push('/profile/privacy')),
                            ],
                          ),
                          const Gap(10),
                          _MenuSection(
                            title: 'About & Legal',
                            items: [
                              _MenuItem(icon: HugeIcons.strokeRoundedLegalDocument02, title: 'Terms & Conditions', onTap: () => context.push('/profile/legal/terms')),
                              _MenuItem(icon: HugeIcons.strokeRoundedLegalHammer, title: 'Privacy Policy', onTap: () => context.push('/profile/legal/privacy')),
                            ],
                          ),
                          const Gap(10),
                          _MenuSection(
                            title: 'Support & Account',
                            items: [
                              _MenuItem(icon: HugeIcons.strokeRoundedHelpCircle, title: 'Support & Help', onTap: () => context.push('/profile/support')),
                              _MenuItem(icon: HugeIcons.strokeRoundedLogout03, title: 'Log Out', danger: true, onTap: _confirmLogout),
                              _MenuItem(icon: HugeIcons.strokeRoundedDelete01, title: 'Delete Account', danger: true, onTap: () => context.push('/profile/delete-account')),
                            ],
                          ),
                          const Gap(10),
                          // App version sits in its own card at the very bottom.
                          _GlassCard(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                            child: const _AppVersionTile(),
                          ),
                        ],
                      ),
                    ),
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

/// Frosted-glass container used by the user card and the menu sections.
class _GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const _GlassCard({required this.child, this.padding = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: StaffPalette.of(context).surface(0.12),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: StaffPalette.of(context).surface(0.12)),
      ),
      child: child,
    );
  }
}

class _UserInfoCard extends StatelessWidget {
  final String name;
  final String phone;
  final String? avatarUrl;
  final VoidCallback onAvatarTap;

  const _UserInfoCard({
    required this.name,
    required this.phone,
    this.avatarUrl,
    required this.onAvatarTap,
  });

  bool get _hasAvatar => avatarUrl != null && avatarUrl!.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onAvatarTap,
            child: SizedBox(
              width: 104,
              height: 104,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Colors.white, // avatar placeholder stays white in every theme
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: _hasAvatar
                          ? (avatarUrl!.startsWith('http')
                          ? Image.network(
                        avatarUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (_, _, _) => _placeholder(),
                      )
                          : Image.file(
                        File(avatarUrl!),
                        fit: BoxFit.cover,
                        errorBuilder: (_, _, _) => _placeholder(),
                      ))
                          : _placeholder(),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(color: _accent, shape: BoxShape.circle),
                      child: Center(
                        child: HugeIcon(
                          icon: _hasAvatar
                              ? HugeIcons.strokeRoundedPencilEdit01
                              : HugeIcons.strokeRoundedPlusSign,
                          color: StaffPalette.of(context).fg(),
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Gap(14),
          Text(
            name,
            textAlign: TextAlign.center,
            style: GoogleFonts.outfit(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: StaffPalette.of(context).fg(),
            ),
          ),
          const Gap(2),
          Text(
            phone,
            textAlign: TextAlign.center,
            style: GoogleFonts.outfit(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: StaffPalette.of(context).fg(0.55),
            ),
          ),
        ],
      ),
    );
  }

  Widget _placeholder() => Center(
    child: Text(
      name.isNotEmpty ? name[0].toUpperCase() : '?',
      style: GoogleFonts.outfit(
        fontSize: 44,
        fontWeight: FontWeight.w700,
        color: _bgMid,
      ),
    ),
  );
}

class _MenuSection extends StatelessWidget {
  final String title;
  final List<_MenuItem> items;

  const _MenuSection({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              title,
              style: GoogleFonts.outfit(
                fontSize: 19,
                fontWeight: FontWeight.w700,
                color: StaffPalette.of(context).fg(),
              ),
            ),
          ),
          for (final item in items) ...[
            Divider(height: 1, thickness: 1, color: StaffPalette.of(context).surface(0.10)),
            item,
          ],
        ],
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final List<List<dynamic>> icon;
  final String title;
  final bool danger;
  final Widget? trailing;
  final VoidCallback onTap;

  const _MenuItem({
    required this.icon,
    required this.title,
    this.danger = false,
    this.trailing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = danger ? _danger : StaffPalette.of(context).fg();

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 52,
        child: Row(
          children: [
            HugeIcon(icon: icon, color: color, size: 22),
            const Gap(20),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.outfit(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: color,
                ),
              ),
            ),
            trailing ??
                HugeIcon(
                  icon: HugeIcons.strokeRoundedArrowRight01,
                  color: color,
                  size: 20,
                ),
          ],
        ),
      ),
    );
  }
}

/// Shows the installed version and, on tap, asks the backend whether a newer
/// one is available (same endpoint as the start-up update check).
class _AppVersionTile extends StatefulWidget {
  const _AppVersionTile();

  @override
  State<_AppVersionTile> createState() => _AppVersionTileState();
}

class _AppVersionTileState extends State<_AppVersionTile> {
  String _version = '…';
  bool _checking = false;

  @override
  void initState() {
    super.initState();
    PackageInfo.fromPlatform().then((info) {
      if (mounted) setState(() => _version = '${info.version} (${info.buildNumber})');
    });
  }

  static bool _isNewer(String latest, String current) {
    final a = latest.split('.').map((p) => int.tryParse(p) ?? 0).toList();
    final b = current.split('.').map((p) => int.tryParse(p) ?? 0).toList();
    for (var i = 0; i < 3; i++) {
      final x = i < a.length ? a[i] : 0;
      final y = i < b.length ? b[i] : 0;
      if (x != y) return x > y;
    }
    return false;
  }

  Future<void> _check() async {
    if (_checking) return;
    setState(() => _checking = true);
    try {
      final info = await PackageInfo.fromPlatform();
      final res = await ApiService.checkUpdate(info.version);
      if (!mounted) return;
      final latest = res['latestVersion']?.toString() ?? info.version;
      final url = res['downloadUrl']?.toString() ?? '';
      if (_isNewer(latest, info.version)) {
        MizigoToasts.showInfo(context, 'Version $latest is available');
        if (url.isNotEmpty) await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      } else {
        MizigoToasts.showSuccess(context, 'You have the latest version');
      }
    } catch (_) {
      if (mounted) MizigoToasts.showError(context, 'Couldn’t check for updates');
    } finally {
      if (mounted) setState(() => _checking = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    return _MenuItem(
      icon: HugeIcons.strokeRoundedSourceCodeSquare,
      title: 'App Version',
      trailing: _checking
          ? SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2, color: palette.fg(0.6)))
          : Text(_version, style: GoogleFonts.outfit(fontSize: 15, color: palette.fg(0.6))),
      onTap: _check,
    );
  }
}
