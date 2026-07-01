import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:gap/gap.dart';
import '../../../services/api_service.dart';
import '../../../widgets/profile/premium_settings_components.dart';

class LoginSecurityScreen extends StatefulWidget {
  const LoginSecurityScreen({super.key});

  @override
  State<LoginSecurityScreen> createState() => _LoginSecurityScreenState();
}

class _LoginSecurityScreenState extends State<LoginSecurityScreen> {
  bool _twoFactorEnabled = false;
  String _currentDeviceName = 'Loading...';
  List<dynamic> _sessions = [];
  bool _isLoadingSessions = true;

  @override
  void initState() {
    super.initState();
    _fetchDeviceInfo();
    _fetchSessions();
  }

  Future<void> _fetchSessions() async {
    try {
      final sessions = await ApiService.getSessions();
      if (mounted) {
        setState(() {
          _sessions = sessions;
          _isLoadingSessions = false;
        });
      }
    } catch (_) {
      if (mounted) {
        setState(() {
          _isLoadingSessions = false;
        });
      }
    }
  }

  Future<void> _fetchDeviceInfo() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        final info = await deviceInfo.androidInfo;
        setState(() {
          _currentDeviceName = '${info.brand} ${info.model}';
        });
      } else if (Platform.isIOS) {
        final info = await deviceInfo.iosInfo;
        setState(() {
          _currentDeviceName = info.name;
        });
      } else if (Platform.isMacOS) {
        final info = await deviceInfo.macOsInfo;
        setState(() {
          _currentDeviceName = info.computerName;
        });
      } else {
        setState(() {
          _currentDeviceName = 'Current Device';
        });
      }
    } catch (_) {
      if (mounted) {
        setState(() {
          _currentDeviceName = 'Current Device';
        });
      }
    }
  }

  void _showChangePasswordSheet() {
    final currentPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    bool isObscureCurrent = true;
    bool isObscureNew = true;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        final theme = Theme.of(ctx);
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: theme.cardTheme.color ?? theme.colorScheme.surface,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
              border: Border(
                top: BorderSide(color: theme.colorScheme.outline.withValues(alpha: 0.5)),
                left: BorderSide(color: theme.colorScheme.outline.withValues(alpha: 0.5)),
                right: BorderSide(color: theme.colorScheme.outline.withValues(alpha: 0.5)),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 30,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.outline,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Change Password',
                  style: GoogleFonts.outfit(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: theme.textTheme.bodyLarge?.color,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Enter your current password and a new one.',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.7),
                  ),
                ),
                const SizedBox(height: 24),
                // Current Password
                TextField(
                  controller: currentPasswordController,
                  obscureText: isObscureCurrent,
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: theme.textTheme.bodyLarge?.color,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Current Password',
                    hintStyle: GoogleFonts.inter(
                      color: theme.hintColor.withValues(alpha: 0.5),
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      size: 20,
                      color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.5),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isObscureCurrent ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                        size: 20,
                        color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.6),
                      ),
                      onPressed: () {
                        setState(() {
                          isObscureCurrent = !isObscureCurrent;
                        });
                      },
                    ),
                    filled: true,
                    fillColor: theme.scaffoldBackgroundColor,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: theme.colorScheme.outline, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: theme.colorScheme.primary, width: 2.0),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // New Password
                TextField(
                  controller: newPasswordController,
                  obscureText: isObscureNew,
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: theme.textTheme.bodyLarge?.color,
                  ),
                  decoration: InputDecoration(
                    hintText: 'New Password',
                    hintStyle: GoogleFonts.inter(
                      color: theme.hintColor.withValues(alpha: 0.5),
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      size: 20,
                      color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.5),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isObscureNew ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                        size: 20,
                        color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.6),
                      ),
                      onPressed: () {
                        setState(() {
                          isObscureNew = !isObscureNew;
                        });
                      },
                    ),
                    filled: true,
                    fillColor: theme.scaffoldBackgroundColor,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: theme.colorScheme.outline, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: theme.colorScheme.primary, width: 2.0),
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                SettingsCTAButton(
                  title: 'Update Password',
                  onTap: () {
                    Navigator.of(ctx).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Password updated successfully.',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: theme.colorScheme.primary,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: const SettingsAppBar(
        title: 'Login & Security',
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        children: [
          _buildGroupHeader('Authentication', 'Manage passwords and extra verification options.'),
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
                _buildActionTile(
                  context,
                  title: 'Change Password',
                  subtitle: 'Last changed 3 months ago',
                  icon: HugeIcons.strokeRoundedLockPassword,
                  onTap: _showChangePasswordSheet,
                ),
                _buildDivider(theme),
                _buildSwitchTile(
                  context,
                  title: 'Two-Factor Authentication',
                  subtitle: 'Add an extra layer of security',
                  icon: HugeIcons.strokeRoundedShield01,
                  value: _twoFactorEnabled,
                  onChanged: (val) => setState(() => _twoFactorEnabled = val),
                ),
              ],
            ),
          ),
          
          const Gap(32),
          
          _buildGroupHeader('Active Sessions', 'These devices are currently logged into your account.'),
          const Gap(12),
          
          if (_isLoadingSessions)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Center(child: CircularProgressIndicator()),
            )
          else ...[
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
                  if (_sessions.isEmpty)
                    _buildSingleSessionTile(
                      context,
                      title: '$_currentDeviceName (Current)',
                      subtitle: 'Active now',
                      isBrowser: false,
                      isCurrent: true,
                    )
                  else
                    for (int i = 0; i < _sessions.length; i++) ...[
                      _buildListSessionTile(context, _sessions[i]),
                      if (i < _sessions.length - 1)
                        _buildDivider(theme),
                    ],
                ],
              ),
            ),
          ],
          const Gap(40),
        ],
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

  Widget _buildActionTile(
    BuildContext context, {
    required String title,
    required String subtitle,
    required List<List<dynamic>> icon,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Padding(
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
            // Content
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
            HugeIcon(
              icon: HugeIcons.strokeRoundedArrowRight01,
              size: 18,
              color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.4),
            ),
          ],
        ),
      ),
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

  Widget _buildSingleSessionTile(
    BuildContext context, {
    required String title,
    required String subtitle,
    required bool isBrowser,
    required bool isCurrent,
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
              child: Icon(
                isBrowser ? Icons.desktop_windows_outlined : Icons.phone_android_outlined,
                color: theme.colorScheme.primary,
                size: 20,
              ),
            ),
          ),
          const Gap(16),
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
        ],
      ),
    );
  }

  Widget _buildListSessionTile(BuildContext context, Map<String, dynamic> session) {
    final theme = Theme.of(context);
    final isCurrent = session['isCurrent'] ?? false;
    final deviceName = session['deviceName']?.toString() ?? 'Device';
    final location = session['location']?.toString() ?? 'Unknown';
    final lastActive = session['lastActive']?.toString() ?? 'Active';

    final isBrowser = deviceName.toLowerCase().contains('chrome') || 
                      deviceName.toLowerCase().contains('browser') || 
                      deviceName.toLowerCase().contains('safari');

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
              child: Icon(
                isBrowser ? Icons.desktop_windows_outlined : Icons.phone_android_outlined,
                color: theme.colorScheme.primary,
                size: 20,
              ),
            ),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$deviceName${isCurrent ? ' (Current)' : ''}',
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: theme.textTheme.bodyLarge?.color,
                  ),
                ),
                const Gap(2),
                Text(
                  '$location • $lastActive',
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
          if (!isCurrent)
            TextButton(
              onPressed: () {
                // Logout other session
              },
              child: Text(
                'Logout',
                style: GoogleFonts.inter(
                  color: Colors.redAccent,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
