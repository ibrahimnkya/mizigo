import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import '../../../providers/auth_provider.dart';
import '../../../widgets/profile/premium_settings_components.dart';
import '../../../widgets/staff/staff_settings.dart';

/// Personal Information — editable name/phone, read-only work details.
class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key});

  @override
  State<PersonalInformationScreen> createState() => _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  static const _roleLabels = {
    'CLERK': 'Station Clerk',
    'TRAIN_GUARD': 'Train Guard',
    'STATION_MASTER': 'Station Master',
  };

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  bool _saving = false;

  String _initialName = '';
  String _initialPhone = '';

  @override
  void initState() {
    super.initState();
    final user = context.read<AuthProvider>().user;
    _initialName = user?.name ?? '';
    _initialPhone = user?.phone ?? '';
    _nameController.text = _initialName;
    _phoneController.text = _initialPhone;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  bool get _hasChanges =>
      _nameController.text.trim() != _initialName || _phoneController.text.trim() != _initialPhone;

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    FocusScope.of(context).unfocus();
    setState(() => _saving = true);
    final auth = context.read<AuthProvider>();
    final ok = await auth.updateProfile(
      name: _nameController.text.trim(),
      phone: _phoneController.text.trim(),
    );
    if (!mounted) return;
    setState(() => _saving = false);
    if (ok) {
      MizigoToasts.showSuccess(context, 'Personal information updated');
      Navigator.pop(context);
    } else {
      MizigoToasts.showError(context, auth.error ?? 'Failed to update personal information');
    }
  }

  String? _required(String? v) => (v == null || v.trim().isEmpty) ? 'This field is required' : null;

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthProvider>().user;
    final role = user?.role?.toUpperCase() ?? '';
    final email = user?.email ?? '';

    return StaffSettingsScaffold(
      title: 'Personal Info',
      onBack: () => Navigator.pop(context),
      children: [
        StaffGlassCard(
          title: 'Your Details',
          child: Form(
            key: _formKey,
            onChanged: () => setState(() {}),
            child: Column(
              children: [
                StaffTextField(
                  label: 'Full Name',
                  controller: _nameController,
                  icon: HugeIcons.strokeRoundedUser,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  validator: _required,
                ),
                const Gap(16),
                StaffTextField(
                  label: 'Phone Number',
                  controller: _phoneController,
                  icon: HugeIcons.strokeRoundedSmartPhone01,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                  validator: _required,
                ),
              ],
            ),
          ),
        ),
        const Gap(10),
        StaffGlassCard(
          title: 'Work Details',
          subtitle: 'Managed by your administrator.',
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: Column(
            children: [
              StaffInfoRow(
                icon: HugeIcons.strokeRoundedMail01,
                label: 'Email Address',
                value: email.isNotEmpty ? email : 'Not set',
              ),
              const StaffDivider(),
              StaffInfoRow(
                icon: HugeIcons.strokeRoundedShippingCenter,
                label: 'Assigned Station',
                value: (user?.station?.isNotEmpty ?? false) ? user!.station! : 'Not assigned',
              ),
              const StaffDivider(),
              StaffInfoRow(
                icon: HugeIcons.strokeRoundedBriefcase02,
                label: 'Role',
                value: _roleLabels[role] ?? (role.isNotEmpty ? role : 'User'),
              ),
            ],
          ),
        ),
        const Gap(24),
        StaffButton(
          label: 'Save Changes',
          loading: _saving,
          onPressed: _hasChanges ? _save : null,
        ),
      ],
    );
  }
}
