import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:gap/gap.dart';
import '../../../widgets/profile/premium_settings_components.dart';

class NotificationsSettingsScreen extends StatefulWidget {
  const NotificationsSettingsScreen({super.key});

  @override
  State<NotificationsSettingsScreen> createState() =>
      _NotificationsSettingsScreenState();
}

class _NotificationsSettingsScreenState
    extends State<NotificationsSettingsScreen> {
  bool _pushEnabled = true;
  bool _emailEnabled = false;
  bool _smsEnabled = true;
  bool _promotionsEnabled = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: const SettingsAppBar(
        title: 'Notifications',
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        children: [
          _buildGroupHeader('Delivery Alerts', 'Stay updated on your shipments, pickups, and operations in real-time.'),
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
                  title: 'Push Notifications',
                  subtitle: 'Real-time updates on your device',
                  icon: HugeIcons.strokeRoundedNotification01,
                  value: _pushEnabled,
                  onChanged: (val) => setState(() => _pushEnabled = val),
                ),
                _buildDivider(theme),
                _buildSwitchTile(
                  context,
                  title: 'SMS Alerts',
                  subtitle: 'Get text messages for important updates',
                  icon: HugeIcons.strokeRoundedMessageNotification01,
                  value: _smsEnabled,
                  onChanged: (val) => setState(() => _smsEnabled = val),
                ),
                _buildDivider(theme),
                _buildSwitchTile(
                  context,
                  title: 'Email Notifications',
                  subtitle: 'Detailed receipts and tracking links',
                  icon: HugeIcons.strokeRoundedMail01,
                  value: _emailEnabled,
                  onChanged: (val) => setState(() => _emailEnabled = val),
                ),
              ],
            ),
          ),
          
          const Gap(32),
          
          _buildGroupHeader('Offers & Promotions', 'Get notified about special deals, discount codes, and new services.'),
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
            child: _buildSwitchTile(
              context,
              title: 'Marketing Emails',
              subtitle: 'Special discounts and product news',
              icon: HugeIcons.strokeRoundedNotification01,
              value: _promotionsEnabled,
              onChanged: (val) => setState(() => _promotionsEnabled = val),
            ),
          ),
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
