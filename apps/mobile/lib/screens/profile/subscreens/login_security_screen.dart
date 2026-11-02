import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../services/api_service.dart';
import '../../../theme/staff_palette.dart';
import '../../../widgets/staff/parcel_badges.dart';
import '../../../widgets/staff/staff_settings.dart';

/// Login & Security — authentication options and signed-in devices.
class LoginSecurityScreen extends StatefulWidget {
  const LoginSecurityScreen({super.key});

  @override
  State<LoginSecurityScreen> createState() => _LoginSecurityScreenState();
}

class _LoginSecurityScreenState extends State<LoginSecurityScreen> {
  bool _twoFactorEnabled = false;
  String _currentDeviceName = 'This device';
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
      if (mounted) setState(() => _isLoadingSessions = false);
    }
  }

  Future<void> _fetchDeviceInfo() async {
    final deviceInfo = DeviceInfoPlugin();
    String name = 'This device';
    try {
      if (Platform.isAndroid) {
        final info = await deviceInfo.androidInfo;
        name = '${info.brand} ${info.model}';
      } else if (Platform.isIOS) {
        name = (await deviceInfo.iosInfo).name;
      } else if (Platform.isMacOS) {
        name = (await deviceInfo.macOsInfo).computerName;
      }
    } catch (_) {}
    if (mounted) setState(() => _currentDeviceName = name);
  }

  Future<void> _refresh() async {
    setState(() => _isLoadingSessions = true);
    await _fetchSessions();
  }

  @override
  Widget build(BuildContext context) {
    return StaffSettingsScaffold(
      title: 'Login & Security',
      onBack: () => Navigator.pop(context),
      onRefresh: _refresh,
      children: [
        StaffGlassCard(
          title: 'Authentication',
          subtitle: 'Extra verification when signing in.',
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: StaffSwitchTile(
            icon: HugeIcons.strokeRoundedShield01,
            title: 'Two-Factor Authentication',
            subtitle: 'Add an extra layer of security',
            value: _twoFactorEnabled,
            onChanged: (v) => setState(() => _twoFactorEnabled = v),
          ),
        ),
        const Gap(10),
        StaffGlassCard(
          title: 'Active Sessions',
          subtitle: 'Devices currently signed in to your account.',
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: _isLoadingSessions
              ? const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Center(child: CircularProgressIndicator(strokeWidth: 2, color: kStaffAccent)),
                )
              : _sessions.isEmpty
                  ? _SessionTile(name: _currentDeviceName, detail: 'Active now', isCurrent: true, isBrowser: false)
                  : Column(
                      children: [
                        for (var i = 0; i < _sessions.length; i++) ...[
                          if (i > 0) const StaffDivider(),
                          _sessionFromJson(_sessions[i] as Map<String, dynamic>),
                        ],
                      ],
                    ),
        ),
      ],
    );
  }

  Widget _sessionFromJson(Map<String, dynamic> session) {
    final isCurrent = session['isCurrent'] == true;
    final deviceName = session['deviceName']?.toString() ?? 'Device';
    final location = session['location']?.toString() ?? 'Unknown location';
    final lastActive = session['lastActive']?.toString() ?? 'Active';
    final lower = deviceName.toLowerCase();
    final isBrowser = lower.contains('chrome') || lower.contains('browser') || lower.contains('safari');
    return _SessionTile(
      name: deviceName,
      detail: '$location • $lastActive',
      isCurrent: isCurrent,
      isBrowser: isBrowser,
      onLogout: isCurrent
          ? null
          : () {
              // Remote sign-out isn't available from the API yet.
            },
    );
  }
}

class _SessionTile extends StatelessWidget {
  const _SessionTile({
    required this.name,
    required this.detail,
    required this.isCurrent,
    required this.isBrowser,
    this.onLogout,
  });

  final String name;
  final String detail;
  final bool isCurrent;
  final bool isBrowser;
  final VoidCallback? onLogout;

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          HugeIcon(
            icon: isBrowser ? HugeIcons.strokeRoundedComputer : HugeIcons.strokeRoundedSmartPhone01,
            color: palette.fg(),
            size: 24,
          ),
          const Gap(20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.outfit(fontSize: 17, color: palette.fg()),
                      ),
                    ),
                    if (isCurrent) ...[
                      const Gap(8),
                      const StaffBadge(label: 'This device', color: Color(0xFF059669), small: true),
                    ],
                  ],
                ),
                const Gap(2),
                Text(detail, style: GoogleFonts.outfit(fontSize: 14, color: palette.fg(0.6))),
              ],
            ),
          ),
          if (onLogout != null)
            TextButton(
              onPressed: onLogout,
              child: Text('Logout', style: GoogleFonts.outfit(fontSize: 15, color: kStaffDanger)),
            ),
        ],
      ),
    );
  }
}
