import 'dart:ui' show ImageFilter;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:gap/gap.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../widgets/profile/premium_settings_components.dart';

class PrivacyPermissionsScreen extends StatefulWidget {
  const PrivacyPermissionsScreen({super.key});

  @override
  State<PrivacyPermissionsScreen> createState() =>
      _PrivacyPermissionsScreenState();
}

class _PrivacyPermissionsScreenState extends State<PrivacyPermissionsScreen> {
  bool _locationEnabled = false;
  bool _cameraEnabled = false;
  bool _contactsEnabled = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  Future<void> _checkPermissions() async {
    final locationStatus = await Permission.location.status;
    final cameraStatus = await Permission.camera.status;
    final contactsStatus = await Permission.contacts.status;

    if (mounted) {
      setState(() {
        _locationEnabled = locationStatus.isGranted;
        _cameraEnabled = cameraStatus.isGranted;
        _contactsEnabled = contactsStatus.isGranted;
        _isLoading = false;
      });
    }
  }

  Future<void> _onRequestPermission(
      Permission permission, String name, bool value, Function(bool) updateState) async {
    if (value) {
      final status = await permission.request();
      if (mounted) {
        setState(() {
          updateState(status.isGranted);
        });
      }
      if (status.isPermanentlyDenied) {
        _showSettingsPrompt(name);
      }
    } else {
      _showRevokeDialog(name);
    }
  }

  void _showSettingsPrompt(String permissionName) {
    final theme = Theme.of(context);
    showDialog(
      context: context,
      builder: (ctx) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: AlertDialog(
          backgroundColor: theme.cardTheme.color ?? theme.colorScheme.surface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          title: Text(
            'Permission Required',
            style: GoogleFonts.outfit(
              fontWeight: FontWeight.w700,
              color: theme.textTheme.titleLarge?.color,
            ),
          ),
          content: Text(
            'To enable $permissionName, please open your device settings and allow Mizigo access.',
            style: GoogleFonts.inter(
              color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.8),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text(
                'Cancel',
                style: GoogleFonts.inter(
                  color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(ctx);
                openAppSettings();
              },
              style: FilledButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: theme.colorScheme.onPrimary,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(
                'Open Settings',
                style: GoogleFonts.inter(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showRevokeDialog(String permissionName) {
    final theme = Theme.of(context);
    showDialog(
      context: context,
      builder: (ctx) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: AlertDialog(
          backgroundColor: theme.cardTheme.color ?? theme.colorScheme.surface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          title: Text(
            'Disable Permission',
            style: GoogleFonts.outfit(
              fontWeight: FontWeight.w700,
              color: theme.textTheme.titleLarge?.color,
            ),
          ),
          content: Text(
            'System permissions must be disabled in your device settings. Would you like to open settings now?',
            style: GoogleFonts.inter(
              color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.8),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text(
                'Not Now',
                style: GoogleFonts.inter(
                  color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(ctx);
                openAppSettings();
              },
              style: FilledButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: theme.colorScheme.onPrimary,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(
                'Open Settings',
                style: GoogleFonts.inter(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _savePreferences() {
    MizigoToasts.showSuccess(context, 'Privacy preferences updated successfully');
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: const SettingsAppBar(
        title: 'Privacy & Permissions',
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: theme.colorScheme.primary,
              ),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildGroupHeader('Device Permissions', 'Manage how Mizigo accesses hardware and services on your device.'),
                  const Gap(12),
                  Container(
                    decoration: BoxDecoration(
                      color: theme.cardTheme.color ?? theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: theme.colorScheme.outline.withValues(alpha: 0.5),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.03),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _buildSwitchTile(
                          context,
                          title: 'Location Services',
                          subtitle: 'Track deliveries and supply exact station estimates',
                          icon: HugeIcons.strokeRoundedLocation01,
                          value: _locationEnabled,
                          onChanged: (val) => _onRequestPermission(
                            Permission.location,
                            'Location Services',
                            val,
                            (res) => _locationEnabled = res,
                          ),
                        ),
                        _buildDivider(theme),
                        _buildSwitchTile(
                          context,
                          title: 'Camera Access',
                          subtitle: 'Scan QR codes and attach profile pictures',
                          icon: HugeIcons.strokeRoundedCamera01,
                          value: _cameraEnabled,
                          onChanged: (val) => _onRequestPermission(
                            Permission.camera,
                            'Camera Access',
                            val,
                            (res) => _cameraEnabled = res,
                          ),
                        ),
                        _buildDivider(theme),
                        _buildSwitchTile(
                          context,
                          title: 'Contacts Access',
                          subtitle: 'Choose receiver details from your contact list',
                          icon: HugeIcons.strokeRoundedUserList,
                          value: _contactsEnabled,
                          onChanged: (val) => _onRequestPermission(
                            Permission.contacts,
                            'Contacts Access',
                            val,
                            (res) => _contactsEnabled = res,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(32),
                  
                  // Action Buttons Section
                  SettingsCTAButton(
                    title: 'Save Changes',
                    onTap: _savePreferences,
                  ),
                  const Gap(16),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: OutlinedButton(
                      onPressed: openAppSettings,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: theme.colorScheme.primary,
                        side: BorderSide(color: theme.colorScheme.primary, width: 1.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          HugeIcon(
                            icon: HugeIcons.strokeRoundedSlidersHorizontal,
                            color: theme.colorScheme.primary,
                            size: 20,
                          ),
                          const Gap(10),
                          Text(
                            'Open Device Settings',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap(40),
                ],
              ),
            ),
    );
  }

  Widget _buildGroupHeader(String title, String description) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.6),
              letterSpacing: 1.2,
            ),
          ),
          const Gap(4),
          Text(
            description,
            style: GoogleFonts.inter(
              fontSize: 13,
              color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.5),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider(ThemeData theme) {
    return Divider(
      height: 1,
      indent: 72,
      endIndent: 16,
      color: theme.colorScheme.outline.withValues(alpha: 0.5),
    );
  }

  Widget _buildSwitchTile(
    BuildContext context, {
    required String title,
    required String subtitle,
    required List<List<dynamic>> icon,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          // Left Accent Indicator
          Container(
            width: 4,
            height: 36,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const Gap(12),
          // Circular Icon Enclosure
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: HugeIcon(
                icon: icon,
                color: theme.colorScheme.primary,
                size: 20,
              ),
            ),
          ),
          const Gap(16),
          // Title & Subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: theme.textTheme.bodyLarge?.color,
                  ),
                ),
                const Gap(2),
                Text(
                  subtitle,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: Colors.white,
            activeTrackColor: theme.colorScheme.primary,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: theme.disabledColor.withValues(alpha: 0.1),
          ),
        ],
      ),
    );
  }
}
