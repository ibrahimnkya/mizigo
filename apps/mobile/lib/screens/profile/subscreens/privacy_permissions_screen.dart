import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../widgets/staff/staff_settings.dart';

/// Privacy & Permissions — device permissions mirror the real OS state and
/// apply immediately (no save step). Re-checked when returning from Settings.
class PrivacyPermissionsScreen extends StatefulWidget {
  const PrivacyPermissionsScreen({super.key});

  @override
  State<PrivacyPermissionsScreen> createState() => _PrivacyPermissionsScreenState();
}

class _PrivacyPermissionsScreenState extends State<PrivacyPermissionsScreen> with WidgetsBindingObserver {
  bool _locationEnabled = false;
  bool _cameraEnabled = false;
  bool _contactsEnabled = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _checkPermissions();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Back from the system Settings app: show what the user changed there.
    if (state == AppLifecycleState.resumed) _checkPermissions();
  }

  Future<void> _checkPermissions() async {
    final location = await Permission.location.status;
    final camera = await Permission.camera.status;
    final contacts = await Permission.contacts.status;
    if (!mounted) return;
    setState(() {
      _locationEnabled = location.isGranted;
      _cameraEnabled = camera.isGranted;
      _contactsEnabled = contacts.isGranted;
      _isLoading = false;
    });
  }

  Future<void> _toggle(Permission permission, String name, bool turnOn, void Function(bool) apply) async {
    if (turnOn) {
      final status = await permission.request();
      if (!mounted) return;
      setState(() => apply(status.isGranted));
      if (status.isPermanentlyDenied) {
        final open = await showStaffConfirmSheet(
          context,
          title: 'Permission Required',
          message: 'To enable $name, open your device settings and allow MiziGO access.',
          confirmText: 'Open Settings',
        );
        if (open) openAppSettings();
      }
    } else {
      final open = await showStaffConfirmSheet(
        context,
        title: 'Turn Off $name',
        message: 'Permissions can only be turned off in your device settings. Open settings now?',
        confirmText: 'Open Settings',
        cancelText: 'Not Now',
      );
      if (open) openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return StaffSettingsScaffold(
      title: 'Privacy & Permissions',
      onBack: () => Navigator.pop(context),
      children: [
        StaffGlassCard(
          title: 'Device Permissions',
          subtitle: 'How MiziGO uses your phone’s hardware and services.',
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: _isLoading
              ? const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Center(child: CircularProgressIndicator(strokeWidth: 2, color: kStaffAccent)),
                )
              : Column(
                  children: [
                    StaffSwitchTile(
                      icon: HugeIcons.strokeRoundedLocation01,
                      title: 'Location',
                      subtitle: 'Station location for parcel registration and printers',
                      value: _locationEnabled,
                      onChanged: (v) => _toggle(Permission.location, 'Location', v, (x) => _locationEnabled = x),
                    ),
                    const StaffDivider(),
                    StaffSwitchTile(
                      icon: HugeIcons.strokeRoundedCamera01,
                      title: 'Camera',
                      subtitle: 'Scan parcel QR codes and take profile photos',
                      value: _cameraEnabled,
                      onChanged: (v) => _toggle(Permission.camera, 'Camera', v, (x) => _cameraEnabled = x),
                    ),
                    const StaffDivider(),
                    StaffSwitchTile(
                      icon: HugeIcons.strokeRoundedUserList,
                      title: 'Contacts',
                      subtitle: 'Pick receiver details from your contacts',
                      value: _contactsEnabled,
                      onChanged: (v) => _toggle(Permission.contacts, 'Contacts', v, (x) => _contactsEnabled = x),
                    ),
                  ],
                ),
        ),
        const Gap(10),
        StaffGlassCard(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: StaffSettingsTile(
            icon: HugeIcons.strokeRoundedSlidersHorizontal,
            title: 'Manage in device settings',
            onTap: openAppSettings,
          ),
        ),
      ],
    );
  }
}
