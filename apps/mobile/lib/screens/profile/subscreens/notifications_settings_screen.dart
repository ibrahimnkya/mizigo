import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../widgets/staff/staff_settings.dart';

/// Notification preferences (saved on this device).
class NotificationsSettingsScreen extends StatefulWidget {
  const NotificationsSettingsScreen({super.key});

  @override
  State<NotificationsSettingsScreen> createState() => _NotificationsSettingsScreenState();
}

class _NotificationsSettingsScreenState extends State<NotificationsSettingsScreen> {
  static const _pushKey = 'notif_push';
  static const _smsKey = 'notif_sms';
  static const _emailKey = 'notif_email';
  static const _promoKey = 'notif_promotions';

  bool _pushEnabled = true;
  bool _smsEnabled = true;
  bool _emailEnabled = false;
  bool _promotionsEnabled = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    setState(() {
      _pushEnabled = prefs.getBool(_pushKey) ?? _pushEnabled;
      _smsEnabled = prefs.getBool(_smsKey) ?? _smsEnabled;
      _emailEnabled = prefs.getBool(_emailKey) ?? _emailEnabled;
      _promotionsEnabled = prefs.getBool(_promoKey) ?? _promotionsEnabled;
    });
  }

  Future<void> _set(String key, bool value, void Function(bool) apply) async {
    setState(() => apply(value));
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  @override
  Widget build(BuildContext context) {
    return StaffSettingsScaffold(
      title: 'Notifications',
      onBack: () => Navigator.pop(context),
      children: [
        StaffGlassCard(
          title: 'Delivery Alerts',
          subtitle: 'Stay updated on parcels, pickups and station operations.',
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: Column(
            children: [
              StaffSwitchTile(
                icon: HugeIcons.strokeRoundedNotification01,
                title: 'Push Notifications',
                subtitle: 'Real-time updates on this device',
                value: _pushEnabled,
                onChanged: (v) => _set(_pushKey, v, (x) => _pushEnabled = x),
              ),
              const StaffDivider(),
              StaffSwitchTile(
                icon: HugeIcons.strokeRoundedMessageNotification01,
                title: 'SMS Alerts',
                subtitle: 'Text messages for important updates',
                value: _smsEnabled,
                onChanged: (v) => _set(_smsKey, v, (x) => _smsEnabled = x),
              ),
              const StaffDivider(),
              StaffSwitchTile(
                icon: HugeIcons.strokeRoundedMail01,
                title: 'Email Notifications',
                subtitle: 'Receipts and tracking links',
                value: _emailEnabled,
                onChanged: (v) => _set(_emailKey, v, (x) => _emailEnabled = x),
              ),
            ],
          ),
        ),
        const Gap(10),
        StaffGlassCard(
          title: 'Offers & Promotions',
          subtitle: 'Special deals, discount codes and new services.',
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: StaffSwitchTile(
            icon: HugeIcons.strokeRoundedDiscount,
            title: 'Marketing Emails',
            subtitle: 'Discounts and product news',
            value: _promotionsEnabled,
            onChanged: (v) => _set(_promoKey, v, (x) => _promotionsEnabled = x),
          ),
        ),
      ],
    );
  }
}
