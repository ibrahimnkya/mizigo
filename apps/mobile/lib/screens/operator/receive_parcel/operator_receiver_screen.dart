import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../widgets/common/country_selector.dart';
import 'package:flutter/services.dart';
import '../../../theme/staff_palette.dart';
import '../../../widgets/profile/premium_settings_components.dart';
import '../../../widgets/staff/staff_settings.dart';
import '../../../widgets/staff/step_progress.dart';

class OperatorReceiverScreen extends StatefulWidget {
  final Map<String, dynamic> packageData;

  const OperatorReceiverScreen({super.key, required this.packageData});

  @override
  State<OperatorReceiverScreen> createState() => _OperatorReceiverScreenState();
}

/// Contact details typed during the current receive flow. Kept outside the
/// widget so going back to Package Details and forward again keeps them;
/// cleared once the parcel is saved.
class ReceiveContactDraft {
  static String senderName = '';
  static String senderPhone = '';
  static String receiverName = '';
  static String receiverPhone = '';
  static Country? senderCountry;
  static Country? receiverCountry;

  static void clear() {
    senderName = senderPhone = receiverName = receiverPhone = '';
    senderCountry = receiverCountry = null;
  }
}

class _OperatorReceiverScreenState extends State<OperatorReceiverScreen> {
  final _senderNameCtrl = TextEditingController(text: ReceiveContactDraft.senderName);
  final _senderPhoneCtrl = TextEditingController(text: ReceiveContactDraft.senderPhone);

  final _receiverNameCtrl = TextEditingController(text: ReceiveContactDraft.receiverName);
  final _receiverPhoneCtrl = TextEditingController(text: ReceiveContactDraft.receiverPhone);

  Country _senderCountry = ReceiveContactDraft.senderCountry ?? countries.first;
  Country _receiverCountry = ReceiveContactDraft.receiverCountry ?? countries.first;
  bool _hasError = false; // Track validation error for dots

  void _saveDraft() {
    ReceiveContactDraft.senderName = _senderNameCtrl.text;
    ReceiveContactDraft.senderPhone = _senderPhoneCtrl.text;
    ReceiveContactDraft.receiverName = _receiverNameCtrl.text;
    ReceiveContactDraft.receiverPhone = _receiverPhoneCtrl.text;
    ReceiveContactDraft.senderCountry = _senderCountry;
    ReceiveContactDraft.receiverCountry = _receiverCountry;
  }

  @override
  void dispose() {
    _saveDraft();
    _senderNameCtrl.dispose();
    _senderPhoneCtrl.dispose();
    _receiverNameCtrl.dispose();
    _receiverPhoneCtrl.dispose();
    super.dispose();
  }

  void _onNext() {
    if (_senderNameCtrl.text.isEmpty ||
        _senderPhoneCtrl.text.isEmpty ||
        _receiverNameCtrl.text.isEmpty ||
        _receiverPhoneCtrl.text.isEmpty) {
      setState(() => _hasError = true);
      return;
    }
    setState(() => _hasError = false);

    final combinedData = {
      ...widget.packageData,
      'senderName': _senderNameCtrl.text,
      'senderPhone': '${_senderCountry.dialCode}${_senderPhoneCtrl.text}',
      'receiverName': _receiverNameCtrl.text,
      'receiverPhone': '${_receiverCountry.dialCode}${_receiverPhoneCtrl.text}',
    };

    context.push('/operator-receive/payment', extra: combinedData);
  }

  void _showCountryPicker(bool isSender) async {
    final result = await showModalBottomSheet<Country>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const CountryPickerSheet(),
    );
    if (result != null) {
      setState(() {
        if (isSender) {
          _senderCountry = result;
        } else {
          _receiverCountry = result;
        }
      });
    }
  }

  List<String> get _missing => [
    if (_senderNameCtrl.text.trim().isEmpty) 'sender name',
    if (_senderPhoneCtrl.text.length < 9) 'sender phone',
    if (_receiverNameCtrl.text.trim().isEmpty) 'receiver name',
    if (_receiverPhoneCtrl.text.length < 9) 'receiver phone',
  ];

  void _submit() {
    if (_missing.isNotEmpty) {
      setState(() => _hasError = true);
      MizigoToasts.showError(context, 'Please add: ${_missing.join(', ')}');
      return;
    }
    _onNext();
  }

  void _showStepHelp(BuildContext context) {
    showStaffSheet<void>(
      context,
      title: 'Sender & receiver',
      builder: (_) => const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          StaffSheetTile(
            icon: HugeIcons.strokeRoundedUser,
            label: 'Sender',
            subtitle: 'The person handing over the parcel today',
            onTap: null,
          ),
          StaffSheetTile(
            icon: HugeIcons.strokeRoundedUserCheck01,
            label: 'Receiver',
            subtitle: 'Gets SMS updates and the delivery code',
            onTap: null,
          ),
          StaffSheetTile(
            icon: HugeIcons.strokeRoundedSmartPhone01,
            label: 'Phone numbers',
            subtitle: '9 digits without the leading 0, e.g. 712 345 678',
            onTap: null,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    return StaffSettingsScaffold(
      title: 'Contact Details',
      onBack: () => context.pop(),
      trailing: IconButton(
        tooltip: 'Help',
        onPressed: () => _showStepHelp(context),
        icon: HugeIcon(icon: HugeIcons.strokeRoundedHelpCircle, color: palette.fg(), size: 24),
      ),
      // Shown only once every required detail is filled in.
      bottom: _missing.isEmpty
          ? StaffButton(
              label: 'Continue to Payment',
              icon: HugeIcons.strokeRoundedArrowRight02,
              iconAfter: true,
              onPressed: _submit,
            )
          : null,
      children: [
        const StepProgress(step: 2, total: 3, label: 'Contacts'),
        const Gap(16),
        StaffGlassCard(
          title: 'Sender',
          child: Column(
            children: [
              StaffTextField(
                label: 'Full name',
                hint: 'e.g. Amina Saleh',
                controller: _senderNameCtrl,
                icon: HugeIcons.strokeRoundedUser,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                onChanged: (_) => setState(() {}),
              ),
              const Gap(14),
              _PhoneField(
                label: 'Phone number',
                controller: _senderPhoneCtrl,
                country: _senderCountry,
                onPickCountry: () => _showCountryPicker(true),
                onChanged: () => setState(() {}),
              ),
            ],
          ),
        ),
        const Gap(10),
        StaffGlassCard(
          title: 'Receiver',
          child: Column(
            children: [
              StaffTextField(
                label: 'Full name',
                hint: 'e.g. Jacob Ibrahim',
                controller: _receiverNameCtrl,
                icon: HugeIcons.strokeRoundedUserCheck01,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                onChanged: (_) => setState(() {}),
              ),
              const Gap(14),
              _PhoneField(
                label: 'Phone number',
                controller: _receiverPhoneCtrl,
                country: _receiverCountry,
                onPickCountry: () => _showCountryPicker(false),
                onChanged: () => setState(() {}),
              ),
            ],
          ),
        ),
        if (_hasError && _missing.isNotEmpty) ...[
          const Gap(12),
          Text('Still needed: ${_missing.join(', ')}.', style: GoogleFonts.outfit(fontSize: 14, color: kStaffDanger)),
        ],
      ],
    );
  }
}

/// Phone input: tappable flag + dial code prefix, 9 local digits (a typed
/// leading 0 is dropped automatically).
class _PhoneField extends StatelessWidget {
  const _PhoneField({
    required this.label,
    required this.controller,
    required this.country,
    required this.onPickCountry,
    required this.onChanged,
  });

  final String label;
  final TextEditingController controller;
  final Country country;
  final VoidCallback onPickCountry;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    OutlineInputBorder border(Color c, [double w = 1]) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: c, width: w),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(label, style: GoogleFonts.outfit(fontSize: 14, color: palette.fg(0.7))),
        ),
        TextField(
          controller: controller,
          keyboardType: TextInputType.phone,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            _DropLeadingZero(),
            LengthLimitingTextInputFormatter(9),
          ],
          onChanged: (_) => onChanged(),
          cursorColor: kStaffAccent,
          style: GoogleFonts.outfit(fontSize: 16, letterSpacing: 1, color: palette.fg()),
          decoration: InputDecoration(
            filled: true,
            fillColor: palette.surface(0.06),
            hintText: '712 345 678',
            hintStyle: GoogleFonts.outfit(fontSize: 16, color: palette.fg(0.45)),
            prefixIcon: GestureDetector(
              onTap: onPickCountry,
              child: Padding(
                padding: const EdgeInsets.only(left: 14, right: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(country.flag, style: const TextStyle(fontSize: 20)),
                    const Gap(6),
                    Text(
                      country.dialCode,
                      style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w600, color: palette.fg()),
                    ),
                    HugeIcon(icon: HugeIcons.strokeRoundedArrowDown01, color: palette.fg(0.6), size: 16),
                  ],
                ),
              ),
            ),
            prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
            contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
            border: border(palette.fg(0.25)),
            enabledBorder: border(palette.fg(0.25)),
            focusedBorder: border(kStaffAccent, 1.5),
          ),
        ),
      ],
    );
  }
}

class _DropLeadingZero extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (!newValue.text.startsWith('0')) return newValue;
    final text = newValue.text.replaceFirst(RegExp(r'^0+'), '');
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
