import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../providers/theme_provider.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/profile/premium_settings_components.dart';

class AppSettingsScreen extends StatefulWidget {
  const AppSettingsScreen({super.key});

  @override
  State<AppSettingsScreen> createState() => _AppSettingsScreenState();
}

class _AppSettingsScreenState extends State<AppSettingsScreen> {
  // Mock settings values (Should be moved to a SettingsProvider for full implementation)
  String _selectedLanguage = 'English';
  String _selectedCurrency = 'TZS (TSh)';

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedLanguage = prefs.getString('language') ?? 'English';
      _selectedCurrency = prefs.getString('currency') ?? 'TZS (TSh)';
    });
  }

  Future<void> _savePreference(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  void _showSelectionSheet(
    String title,
    List<String> options,
    String currentValue,
    Function(String) onSelected,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: AppTheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
            border: Border(
              top: BorderSide(color: AppTheme.border),
              left: BorderSide(color: AppTheme.border),
              right: BorderSide(color: AppTheme.border),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: GoogleFonts.outfit(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textPrimary,
                  ),
                ),
                const SizedBox(height: 16),
                ...options.map((option) {
                  final isSelected = option == currentValue;
                  return ListTile(
                    title: Text(
                      option,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w400,
                        color: isSelected
                            ? AppTheme.accent
                            : AppTheme.textPrimary,
                      ),
                    ),
                    trailing: isSelected
                        ? Icon(Icons.check_circle, color: AppTheme.accent)
                        : null,
                    onTap: () {
                      onSelected(option);
                      Navigator.pop(context);
                    },
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSettingTile({
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    return Material(
      color: Colors.transparent,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        title: Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: theme.textTheme.bodyLarge?.color,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: theme.textTheme.bodySmall?.color ?? const Color(0xFF64748B),
              ),
            ),
            const SizedBox(width: 8),
            HugeIcon(
              icon: HugeIcons.strokeRoundedArrowRight01,
              color: theme.textTheme.bodySmall?.color ?? const Color(0xFF94A3B8),
              size: 18,
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: SettingsAppBar(
        title: 'App Settings',
        onBack: () => Navigator.pop(context),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text(
            'PREFERENCES',
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.6) ?? const Color(0xFF64748B),
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: theme.cardTheme.color ?? theme.cardColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: theme.colorScheme.outline,
              ),
            ),
            child: Column(
              children: [
                _buildSettingTile(
                  title: 'Language',
                  value: _selectedLanguage,
                  onTap: () {
                    _showSelectionSheet(
                      'Select Language',
                      ['English', 'Kiswahili'],
                      _selectedLanguage,
                      (val) {
                        setState(() {
                          _selectedLanguage = val;
                        });
                        _savePreference('language', val);
                      },
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(color: theme.dividerColor, height: 1),
                ),
                _buildSettingTile(
                  title: 'Currency',
                  value: _selectedCurrency,
                  onTap: () {
                    _showSelectionSheet(
                      'Select Currency',
                      ['Dollar (\$)', 'TZS (TSh)'],
                      _selectedCurrency,
                      (val) {
                        setState(() {
                          _selectedCurrency = val;
                        });
                        _savePreference('currency', val);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          _buildThemeChooser(),
        ],
      ),
    );
  }

  Widget _buildThemeChooser() {
    final themeProvider = context.watch<ThemeProvider>();
    final currentMode = themeProvider.currentMode;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'THEME PRESET',
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).textTheme.bodySmall?.color?.withValues(alpha: 0.6) ?? const Color(0xFF64748B),
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildThemeCard(
                mode: MizigoThemeMode.light,
                title: 'Mizigo Light',
                bgColor: const Color(0xFFF8FAFC),
                primaryColor: const Color(0xFF1A1A2E),
                accentColor: const Color(0xFF3B82F6),
                borderColor: const Color(0xFFE2E8F0),
                isSelected: currentMode == MizigoThemeMode.light,
                onTap: () => themeProvider.setThemeMode(MizigoThemeMode.light),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildThemeCard(
                mode: MizigoThemeMode.customLight,
                title: 'Custom Light',
                bgColor: const Color(0xFFF0EEED),
                primaryColor: const Color(0xFF670E1E),
                accentColor: const Color(0xFFFA800B),
                borderColor: const Color(0xFF9C7A7F),
                isSelected: currentMode == MizigoThemeMode.customLight,
                onTap: () => themeProvider.setThemeMode(MizigoThemeMode.customLight),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildThemeCard({
    required MizigoThemeMode mode,
    required String title,
    required Color bgColor,
    required Color primaryColor,
    required Color accentColor,
    required Color borderColor,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    final Color highlightColor = theme.colorScheme.primary;
    final Color previewLineColor = Colors.black.withValues(alpha: 0.15);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: theme.cardTheme.color ?? theme.cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? highlightColor
                : theme.colorScheme.outline,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: highlightColor.withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Column(
          children: [
            Container(
              height: 56,
              width: double.infinity,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: borderColor.withValues(alpha: 0.3), width: 1),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: 6,
                    bottom: 6,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: accentColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 6,
                    top: 6,
                    child: Container(
                      width: 24,
                      height: 10,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 6,
                    bottom: 6,
                    right: 22,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 2,
                          decoration: BoxDecoration(
                            color: previewLineColor,
                            borderRadius: BorderRadius.circular(1),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Container(
                          width: 10,
                          height: 2,
                          decoration: BoxDecoration(
                            color: previewLineColor,
                            borderRadius: BorderRadius.circular(1),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isSelected ? Icons.radio_button_checked_rounded : Icons.radio_button_off_rounded,
                  size: 14,
                  color: isSelected ? highlightColor : const Color(0xFF94A3B8),
                ),
                const SizedBox(width: 4),
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    color: isSelected ? highlightColor : const Color(0xFF334155),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


