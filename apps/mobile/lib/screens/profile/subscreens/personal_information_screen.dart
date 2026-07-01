import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:gap/gap.dart';
import '../../../providers/auth_provider.dart';
import '../../../widgets/profile/premium_settings_components.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key});

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _saving = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _stationController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize with actual user information
    final user = context.read<AuthProvider>().user;
    if (user != null) {
      _nameController.text = user.name;
      _emailController.text = user.email;
      _phoneController.text = user.phone ?? '';
      _stationController.text = user.station ?? 'Not Assigned';
      _roleController.text = user.role ?? 'User';
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _stationController.dispose();
    _roleController.dispose();
    super.dispose();
  }

  Future<void> _saveChanges() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _saving = true);
      final success = await context.read<AuthProvider>().updateProfile(
            name: _nameController.text.trim(),
            phone: _phoneController.text.trim(),
          );
          
      if (mounted) {
        setState(() => _saving = false);
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Personal information updated successfully',
                style: GoogleFonts.inter(color: Colors.white),
              ),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          );
          Navigator.pop(context);
        } else {
          final errorMsg = context.read<AuthProvider>().error ?? 'Failed to update personal information';
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                errorMsg,
                style: GoogleFonts.inter(color: Colors.white),
              ),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          );
        }
      }
    }
  }

  Widget _buildTextField(
    BuildContext context,
    String label,
    TextEditingController controller,
    TextInputType keyboardType, {
    bool enabled = true,
    required List<List<dynamic>> icon,
  }) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 8),
            child: Row(
              children: [
                // Left Accent Indicator for labels
                Container(
                  width: 3,
                  height: 12,
                  decoration: BoxDecoration(
                    color: enabled ? theme.colorScheme.primary : theme.disabledColor.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(1.5),
                  ),
                ),
                const Gap(8),
                Text(
                  label,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
          TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            enabled: enabled,
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: enabled
                  ? theme.textTheme.bodyLarge?.color
                  : theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.5),
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: enabled
                  ? theme.scaffoldBackgroundColor
                  : theme.disabledColor.withValues(alpha: 0.05),
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: enabled 
                        ? theme.colorScheme.primary.withValues(alpha: 0.1)
                        : theme.disabledColor.withValues(alpha: 0.05),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: HugeIcon(
                      icon: icon,
                      color: enabled
                          ? theme.colorScheme.primary
                          : theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.3) ?? Colors.grey,
                      size: 18,
                    ),
                  ),
                ),
              ),
              prefixIconConstraints: const BoxConstraints(
                minWidth: 60,
                minHeight: 36,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: theme.colorScheme.outline.withValues(alpha: 0.5)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: theme.colorScheme.outline.withValues(alpha: 0.5)),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: theme.colorScheme.outline.withValues(alpha: 0.2)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: theme.colorScheme.primary, width: 2),
              ),
            ),
            validator: (value) {
              if (enabled && (value == null || value.isEmpty)) {
                return 'This field is required';
              }
              return null;
            },
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
      appBar: const SettingsAppBar(
        title: 'Personal Info',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
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
                    _buildTextField(
                      context,
                      'Full Name',
                      _nameController,
                      TextInputType.name,
                      icon: HugeIcons.strokeRoundedUser,
                    ),
                    _buildTextField(
                      context,
                      'Email Address',
                      _emailController,
                      TextInputType.emailAddress,
                      enabled: false,
                      icon: HugeIcons.strokeRoundedMail01,
                    ),
                    _buildTextField(
                      context,
                      'Phone Number',
                      _phoneController,
                      TextInputType.phone,
                      icon: HugeIcons.strokeRoundedSmartPhone01,
                    ),
                    _buildTextField(
                      context,
                      'Assigned Station',
                      _stationController,
                      TextInputType.text,
                      enabled: false,
                      icon: HugeIcons.strokeRoundedShippingCenter,
                    ),
                    _buildTextField(
                      context,
                      'User Role',
                      _roleController,
                      TextInputType.text,
                      enabled: false,
                      icon: HugeIcons.strokeRoundedBriefcase02,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              SettingsCTAButton(
                title: 'Save Changes',
                onTap: _saving ? null : _saveChanges,
                isLoading: _saving,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
