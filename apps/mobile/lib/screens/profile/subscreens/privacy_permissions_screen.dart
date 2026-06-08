import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPermissionsScreen extends StatefulWidget {
  const PrivacyPermissionsScreen({super.key});

  @override
  State<PrivacyPermissionsScreen> createState() =>
      _PrivacyPermissionsScreenState();
}

class _PrivacyPermissionsScreenState extends State<PrivacyPermissionsScreen> {
  bool _locationEnabled = true;
  bool _cameraEnabled = true;
  bool _contactsEnabled = false;

  Widget _buildPermissionTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Theme.of(context).iconTheme.color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: Colors.white,
            activeTrackColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: theme.iconTheme.color),
        title: Text(
          'Privacy & Permissions',
          style: GoogleFonts.outfit(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: theme.textTheme.titleLarge?.color,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text(
            'DEVICE PERMISSIONS',
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).textTheme.bodySmall?.color?.withValues(alpha: 0.5),
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 24),
          _buildPermissionTile(
            icon: Icons.location_on_outlined,
            title: 'Location Services',
            subtitle:
                'Required to track your deliveries accurately and provide accurate estimates.',
            value: _locationEnabled,
            onChanged: (val) => setState(() => _locationEnabled = val),
          ),
          _buildPermissionTile(
            icon: Icons.camera_alt_outlined,
            title: 'Camera Access',
            subtitle:
                'Used for taking profile photos and scanning QR codes during delivery.',
            value: _cameraEnabled,
            onChanged: (val) => setState(() => _cameraEnabled = val),
          ),
          _buildPermissionTile(
            icon: Icons.contact_phone_outlined,
            title: 'Contacts',
            subtitle:
                'Helps you easily select recipients from your phone\'s address book.',
            value: _contactsEnabled,
            onChanged: (val) => setState(() => _contactsEnabled = val),
          ),
        ],
      ),
    );
  }
}
