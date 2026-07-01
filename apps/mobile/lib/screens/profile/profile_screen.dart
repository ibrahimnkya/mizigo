import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../theme/app_theme.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/common/danger_action_sheet.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _scrollController = ScrollController();
  bool _showCompactHeader = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final show = _scrollController.offset > 140;
    if (show != _showCompactHeader) setState(() => _showCompactHeader = show);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

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
          color: AppTheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
          border: Border(
            top: BorderSide(color: AppTheme.border),
            left: BorderSide(color: AppTheme.border),
            right: BorderSide(color: AppTheme.border),
          ),
        ),
        padding: const EdgeInsets.fromLTRB(0, 12, 0, 36),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40, height: 4,
              decoration: BoxDecoration(color: AppTheme.border, borderRadius: BorderRadius.circular(2)),
            ),
            const Gap(8),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
              leading: Container(
                width: 44, height: 44,
                decoration: BoxDecoration(
                  color: AppTheme.cPrimary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.camera_alt_outlined, color: AppTheme.cPrimary, size: 22),
              ),
              title: Text('Camera', style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w600, color: AppTheme.textPrimary)),
              onTap: () => _pickImage(ImageSource.camera),
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
              leading: Container(
                width: 44, height: 44,
                decoration: BoxDecoration(
                  color: AppTheme.accent.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.photo_outlined, color: AppTheme.accent, size: 22),
              ),
              title: Text('Gallery', style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w600, color: AppTheme.textPrimary)),
              onTap: () => _pickImage(ImageSource.gallery),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _confirmLogout(AuthProvider auth) async {
    await DangerActionBottomSheet.show(
      context: context,
      title: 'Sign Out',
      message: 'Are you sure you want to sign out of your account? You will need to log in again to access your data.',
      confirmText: 'Sign Out',
      cancelText: 'Cancel',
      onConfirm: () async {
        if (mounted) await auth.logout();
      },
    );
  }

  Widget _miniAvatar(String name, String? avatarUrl) {
    Widget child;
    if (avatarUrl != null && avatarUrl.isNotEmpty) {
      child = avatarUrl.startsWith('http')
          ? Image.network(avatarUrl, fit: BoxFit.cover,
              errorBuilder: (_, _, _) => _miniInitial(name))
          : Image.file(File(avatarUrl), fit: BoxFit.cover,
              errorBuilder: (_, _, _) => _miniInitial(name));
    } else {
      child = _miniInitial(name);
    }
    return Container(
      width: 36, height: 36,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: ClipOval(child: child),
    );
  }

  Widget _miniInitial(String name) => Center(
    child: Text(
      name.isNotEmpty ? name[0].toUpperCase() : '?',
      style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white60),
    ),
  );

  Widget _headerIcon({required VoidCallback onTap, required Widget icon, Color? bg}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40, height: 40,
        decoration: BoxDecoration(
          color: bg ?? Colors.black.withValues(alpha: 0.05),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black.withValues(alpha: 0.05)),
        ),
        child: Center(child: icon),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    final user = auth.user;
    final name = user?.name ?? 'User';
    final phone = user?.phone ?? 'Not set';
    final avatarUrl = user?.avatarUrl;

    final theme = Theme.of(context);
    final appBarTheme = theme.appBarTheme;
    final appBarBg = appBarTheme.backgroundColor ?? theme.primaryColor;
    final appBarTextColor = appBarTheme.titleTextStyle?.color ?? Colors.white;
    final appBarIconColor = appBarTheme.iconTheme?.color ?? Colors.white;

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          // ── Sticky Top Bar ──────────────────────────────────────────────
          SliverAppBar(
            pinned: true,
            backgroundColor: appBarBg,
            automaticallyImplyLeading: false,
            toolbarHeight: 60,
            elevation: 0,
            surfaceTintColor: Colors.transparent,
            titleSpacing: 16,
            title: AnimatedSwitcher(
              duration: const Duration(milliseconds: 220),
              transitionBuilder: (child, anim) => FadeTransition(
                opacity: anim,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 0.25),
                    end: Offset.zero,
                  ).animate(anim),
                  child: child,
                ),
              ),
              child: _showCompactHeader
                  ? Row(
                      key: const ValueKey('compact'),
                      children: [
                        _miniAvatar(name, avatarUrl),
                        const Gap(10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(name, style: GoogleFonts.outfit(fontSize: 15, fontWeight: FontWeight.w700, color: appBarTextColor)),
                            Text(phone, style: GoogleFonts.inter(fontSize: 12, color: appBarTextColor.withValues(alpha: 0.6))),
                          ],
                        ),
                      ],
                    )
                  : const SizedBox.shrink(key: ValueKey('empty')),
            ),
            actions: [
              _headerIcon(
                onTap: () => context.push('/profile/support'),
                icon: HugeIcon(icon: HugeIcons.strokeRoundedCustomerService, color: appBarIconColor, size: 18),
              ),
              const Gap(8),
              _headerIcon(
                onTap: () => _confirmLogout(auth),
                icon: HugeIcon(icon: HugeIcons.strokeRoundedLogout03, color: AppTheme.danger, size: 18),
              ),
              const Gap(12),
            ],
          ),

          // ── Scrollable Content ──────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Expanded user card (scrolls away, triggers compact header)
                  _UserInfoCard(
                    name: name,
                    phone: phone,
                    avatarUrl: avatarUrl,
                    onAvatarTap: _showImagePickerSheet,
                  ),
                  const Gap(28),

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
                  const Gap(20),

                  _MenuSection(
                    title: 'About & Legal',
                    items: [
                      _MenuItem(icon: HugeIcons.strokeRoundedLegalDocument02, title: 'Terms & Conditions', onTap: () => context.push('/profile/legal/terms')),
                      _MenuItem(icon: HugeIcons.strokeRoundedLegalHammer, title: 'Privacy Policy', onTap: () => context.push('/profile/legal/privacy')),
                      _MenuItem(
                        icon: HugeIcons.strokeRoundedSourceCodeSquare,
                        title: 'App Version',
                        trailing: Text('1.2.1', style: GoogleFonts.inter(fontSize: 14, color: const Color(0xFF64748B), fontWeight: FontWeight.w500)),
                        onTap: () {},
                      ),
                    ],
                  ),
                  const Gap(20),

                  _MenuSection(
                    title: 'Support & Account',
                    items: [
                      _MenuItem(icon: HugeIcons.strokeRoundedHelpCircle, title: 'Support & Help', onTap: () => context.push('/profile/support')),
                      _MenuItem(icon: HugeIcons.strokeRoundedDelete01, title: 'Delete Account', iconColor: AppTheme.danger, onTap: () => context.push('/profile/delete-account')),
                    ],
                  ),
                  const Gap(40),
                ],
              ),
            ),
          ),
        ],
      ),
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Avatar
            GestureDetector(
              onTap: onAvatarTap,
              child: Stack(
                children: [
                  Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                      color: AppTheme.background,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white.withValues(alpha: 0.1), width: 3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: avatarUrl != null && avatarUrl!.isNotEmpty
                          ? avatarUrl!.startsWith('http')
                                ? Image.network(
                                    avatarUrl!,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) =>
                                        _buildPlaceholder(context),
                                  )
                                : Image.file(
                                    File(avatarUrl!),
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) =>
                                        _buildPlaceholder(context),
                                  )
                          : _buildPlaceholder(context),
                    ),
                  ),
                  Positioned(
                    bottom: 2,
                    right: 2,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: theme.primaryColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: theme.cardTheme.color ?? const Color(0xFF1E293B), width: 2.5),
                      ),
                      child: Center(
                        child: HugeIcon(
                          icon: avatarUrl != null && avatarUrl!.isNotEmpty
                              ? HugeIcons.strokeRoundedPencilEdit01
                              : HugeIcons.strokeRoundedPlusSign,
                          color: Colors.white,
                          size: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(16),
            Text(
              name,
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: AppTheme.textPrimary,
                letterSpacing: -0.5,
              ),
            ),
            const Gap(4),
            Text(
              phone,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: AppTheme.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholder(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Text(
        name.isNotEmpty ? name[0].toUpperCase() : '?',
        style: GoogleFonts.outfit(
          fontSize: 48,
          fontWeight: FontWeight.w700,
          color: theme.textTheme.headlineMedium?.color?.withValues(alpha: 0.5),
        ),
      ),
    );
  }
}

class _MenuSection extends StatelessWidget {
  final String title;
  final List<_MenuItem> items;

  const _MenuSection({
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: AppTheme.surface,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
          side: BorderSide(
            color: AppTheme.border,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
              child: Text(
                title.toUpperCase(),
                style: GoogleFonts.outfit(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF64748B),
                  letterSpacing: 1.2,
                ),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              padding: const EdgeInsets.only(bottom: 16, top: 0),
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 64, right: 20),
                child: Divider(
                  height: 1,
                  color: AppTheme.border,
                ),
              ),
              itemBuilder: (context, index) => items[index],
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final List<List<dynamic>> icon;
  final String title;
  final Color iconColor;
  final Widget? trailing;
  final bool showTrailing;
  final VoidCallback onTap;

  const _MenuItem({
    required this.icon,
    required this.title,
    this.iconColor = Colors.white,
    this.trailing,
    required this.onTap,
  }) : showTrailing = true;

  @override
  Widget build(BuildContext context) {
    final effectiveIconColor = iconColor == Colors.white
        ? AppTheme.textSecondary
        : iconColor;

    return Material(
      color: Colors.transparent,
      child: ListTile(
        onTap: onTap,
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppTheme.background,
            borderRadius: BorderRadius.circular(12),
          ),
          child: HugeIcon(icon: icon, color: effectiveIconColor, size: 20),
        ),
        title: Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: iconColor == AppTheme.danger ? AppTheme.danger : AppTheme.textPrimary,
          ),
        ),
        trailing: !showTrailing
            ? null
            : trailing ??
                  HugeIcon(
                    icon: HugeIcons.strokeRoundedArrowRight01,
                    color: AppTheme.textMuted,
                    size: 18,
                  ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}

