import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../services/api_service.dart';

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
        return StatefulBuilder(
          builder: (ctx, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(ctx).viewInsets.bottom,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                ),
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Drag handle
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Theme.of(context).dividerColor,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Change Password',
                      style: GoogleFonts.outfit(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).textTheme.titleLarge?.color,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Enter your current password and a new one.',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.7),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Current Password
                    TextField(
                      controller: currentPasswordController,
                      obscureText: isObscureCurrent,
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Current Password',
                        hintStyle: GoogleFonts.inter(
                          color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.4),
                          fontSize: 14,
                        ),
                        prefixIcon: const Icon(Icons.lock_outline, size: 20),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isObscureCurrent ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                            size: 20,
                            color: Theme.of(context).iconTheme.color?.withValues(alpha: 0.5),
                          ),
                          onPressed: () {
                            setModalState(() {
                              isObscureCurrent = !isObscureCurrent;
                            });
                          },
                        ),
                        prefixIconColor: WidgetStateColor.resolveWith(
                          (s) => s.contains(WidgetState.focused)
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).iconTheme.color?.withValues(alpha: 0.5) ?? const Color(0xFF94A3B8),
                        ),
                        filled: true,
                        fillColor: WidgetStateColor.resolveWith(
                          (s) => s.contains(WidgetState.focused)
                              ? (Theme.of(context).brightness == Brightness.dark ? Colors.white.withValues(alpha: 0.05) : Colors.white)
                              : (Theme.of(context).brightness == Brightness.dark ? Colors.white.withValues(alpha: 0.05) : const Color(0xFFF8FAFC)),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 18),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                              color: Theme.of(context).dividerColor, width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor, width: 2.0),
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
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                      decoration: InputDecoration(
                        hintText: 'New Password',
                        hintStyle: GoogleFonts.inter(
                          color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.4),
                          fontSize: 14,
                        ),
                        prefixIcon: const Icon(Icons.lock_outline, size: 20),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isObscureNew ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                            size: 20,
                            color: Theme.of(context).iconTheme.color?.withValues(alpha: 0.5),
                          ),
                          onPressed: () {
                            setModalState(() {
                              isObscureNew = !isObscureNew;
                            });
                          },
                        ),
                        prefixIconColor: WidgetStateColor.resolveWith(
                          (s) => s.contains(WidgetState.focused)
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).iconTheme.color?.withValues(alpha: 0.5) ?? const Color(0xFF94A3B8),
                        ),
                        filled: true,
                        fillColor: WidgetStateColor.resolveWith(
                          (s) => s.contains(WidgetState.focused)
                              ? (Theme.of(context).brightness == Brightness.dark ? Colors.white.withValues(alpha: 0.05) : Colors.white)
                              : (Theme.of(context).brightness == Brightness.dark ? Colors.white.withValues(alpha: 0.05) : const Color(0xFFF8FAFC)),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 18),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                              color: Theme.of(context).dividerColor, width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor, width: 2.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: FilledButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Password updated successfully.',
                                style: GoogleFonts.inter(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              backgroundColor: Theme.of(context).brightness == Brightness.dark ? Colors.white.withValues(alpha: 0.1) : const Color(0xFF1E293B),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14)),
                          elevation: 0,
                        ),
                        child: Text(
                          'Update Password',
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildActionTile({
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).textTheme.bodyLarge?.color,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.inter(fontSize: 14, color: const Color(0xFF64748B)),
      ),
      trailing: const Icon(Icons.chevron_right, color: Color(0xFF94A3B8)),
      onTap: onTap,
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
          'Login & Security',
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
            'AUTHENTICATION',
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF94A3B8),
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 16),
          _buildActionTile(
            title: 'Change Password',
            subtitle: 'Last changed 3 months ago',
            onTap: _showChangePasswordSheet,
          ),
          Divider(color: theme.dividerColor),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Two-Factor Authentication',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: theme.textTheme.bodyLarge?.color,
              ),
            ),
            subtitle: Text(
              'Add an extra layer of security',
              style: GoogleFonts.inter(
                fontSize: 14,
                color: const Color(0xFF64748B),
              ),
            ),
            trailing: Switch(
              value: _twoFactorEnabled,
              onChanged: (val) => setState(() => _twoFactorEnabled = val),
              activeThumbColor: Colors.white,
              activeTrackColor: theme.primaryColor,
            ),
          ),
          const SizedBox(height: 40),
          Text(
            'ACTIVE SESSIONS',
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF94A3B8),
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 16),
          if (_isLoadingSessions)
            const Center(child: CircularProgressIndicator())
          else if (_sessions.isEmpty)
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(
                Icons.phone_iphone,
                color: Color(0xFF3B82F6),
                size: 32,
              ),
              title: Text(
                '$_currentDeviceName (Current)',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: theme.textTheme.bodyLarge?.color,
                ),
              ),
              subtitle: Text(
                'Active now',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: const Color(0xFF64748B),
                ),
              ),
            )
          else
            ..._sessions.map((session) {
              final isCurrent = session['isCurrent'] ?? false;
              return ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  session['deviceName'].toString().toLowerCase().contains('chrome') || 
                  session['deviceName'].toString().toLowerCase().contains('browser')
                      ? Icons.desktop_windows_outlined
                      : Icons.phone_android_outlined,
                  color: const Color(0xFF3B82F6),
                  size: 32,
                ),
                title: Text(
                  '${session['deviceName']}${isCurrent ? ' (Current)' : ''}',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: theme.textTheme.bodyLarge?.color,
                  ),
                ),
                subtitle: Text(
                  '${session['location']} • ${session['lastActive']}',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: const Color(0xFF64748B),
                  ),
                ),
                trailing: !isCurrent 
                    ? TextButton(
                        onPressed: () {
                          // TODO: Implement logout from other session
                        },
                        child: Text(
                          'Logout',
                          style: GoogleFonts.inter(
                            color: Colors.redAccent,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    : null,
              );
            }),
        ],
      ),
    );
  }
}

