import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:gap/gap.dart';
import '../../theme/app_theme.dart';
import '../../providers/cargo_provider.dart';

const _services = [
  {'name': 'Bodaboda', 'icon': Icons.two_wheeler, 'size': '0.4×0.4×0.4m', 'weight': '20kg'},
  {'name': 'Small Vehicle', 'icon': Icons.directions_car_outlined, 'size': '1×1×1m', 'weight': '150kg'},
  {'name': 'Minivan/Kirikuu', 'icon': Icons.airport_shuttle_outlined, 'size': '1.5×1.2×1.2m', 'weight': '300kg'},
  {'name': 'Canter/Fuso', 'icon': Icons.local_shipping_outlined, 'size': '2.8×2×2m', 'weight': '5,000kg'},
  {'name': 'Large Truck', 'icon': Icons.fire_truck_outlined, 'size': '4.2×3×3m', 'weight': '10,000kg'},
];

const _additionalServices = ['INSURANCE', 'FRAGILE', 'EXPRESS', 'STANDARD'];

class SendCargoScreen extends StatefulWidget {
  const SendCargoScreen({super.key});
  @override
  State<SendCargoScreen> createState() => _SendCargoScreenState();
}

class _SendCargoScreenState extends State<SendCargoScreen> {
  int _step = 0;
  // Step 1
  final _fromCtrl = TextEditingController();
  final _toCtrl = TextEditingController();
  String _pickupType = 'SGR_STATION';
  // Step 2
  String? _serviceType;
  int _helpers = 0;
  // Step 3
  final _cargoTypeCtrl = TextEditingController();
  final _cargoSizeCtrl = TextEditingController();
  final _receiverNameCtrl = TextEditingController();
  final _receiverPhoneCtrl = TextEditingController();
  bool _receiverPays = false;
  final Set<String> _extras = {};

  @override
  void dispose() {
    _fromCtrl.dispose(); _toCtrl.dispose();
    _cargoTypeCtrl.dispose(); _cargoSizeCtrl.dispose();
    _receiverNameCtrl.dispose(); _receiverPhoneCtrl.dispose();
    super.dispose();
  }

  Widget _buildStep() {
    switch (_step) {
      case 0: return _buildRouteStep();
      case 1: return _buildServiceStep();
      case 2: return _buildDetailsStep();
      default: return _buildConfirmStep();
    }
  }

  Widget _buildRouteStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionTitle('Route'),
        const Gap(16),
        TextFormField(controller: _fromCtrl, decoration: const InputDecoration(labelText: 'Pickup location', prefixIcon: Icon(Icons.trip_origin, color: AppTheme.success))),
        const Gap(16),
        TextFormField(controller: _toCtrl, decoration: const InputDecoration(labelText: 'Destination', prefixIcon: Icon(Icons.location_on_outlined, color: AppTheme.danger))),
        const Gap(20),
        _SectionTitle('Pickup Type'),
        const Gap(12),
        Row(
          children: [
            _PickupChip(label: 'SGR Station', value: 'SGR_STATION', selected: _pickupType == 'SGR_STATION', onTap: () => setState(() => _pickupType = 'SGR_STATION')),
            const Gap(12),
            _PickupChip(label: 'Deliver to Location', value: 'DELIVER_TO_LOCATION', selected: _pickupType == 'DELIVER_TO_LOCATION', onTap: () => setState(() => _pickupType = 'DELIVER_TO_LOCATION')),
          ],
        ),
      ],
    );
  }

  Widget _buildServiceStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionTitle('Select Vehicle Type'),
        const Gap(16),
        ..._services.map((s) {
          final name = s['name'] as String;
          final selected = _serviceType == name;
          return GestureDetector(
            onTap: () => setState(() => _serviceType = name),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: selected ? AppTheme.accentLight : Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: selected ? AppTheme.accent : AppTheme.border, width: selected ? 2 : 1),
              ),
              child: Row(
                children: [
                  Icon(s['icon'] as IconData, color: selected ? AppTheme.accent : AppTheme.textSecondary, size: 24),
                  const Gap(14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name, style: TextStyle(fontWeight: FontWeight.w700, color: selected ? AppTheme.accent : AppTheme.textPrimary)),
                        Text('${s['size']} · Max ${s['weight']}', style: const TextStyle(fontSize: 12, color: AppTheme.textMuted)),
                      ],
                    ),
                  ),
                  if (selected) const Icon(Icons.check_circle, color: AppTheme.accent),
                ],
              ),
            ),
          );
        }),
        if (_serviceType == 'Minivan/Kirikuu') ...[
          const Gap(16),
          _SectionTitle('Helpers needed'),
          const Gap(12),
          Row(
            children: [0, 1, 2].map((h) => GestureDetector(
              onTap: () => setState(() => _helpers = h),
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: _helpers == h ? AppTheme.accent : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: _helpers == h ? AppTheme.accent : AppTheme.border),
                ),
                child: Text(h == 0 ? 'Driver only' : '+$h helper${h > 1 ? 's' : ''}',
                  style: TextStyle(fontWeight: FontWeight.w600, color: _helpers == h ? Colors.white : AppTheme.textSecondary, fontSize: 13)),
              ),
            )).toList(),
          ),
        ],
      ],
    );
  }

  Widget _buildDetailsStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionTitle('Cargo Details'),
        const Gap(16),
        TextFormField(controller: _cargoTypeCtrl, decoration: const InputDecoration(labelText: 'Cargo type (e.g. Electronics)', prefixIcon: Icon(Icons.inventory_outlined))),
        const Gap(16),
        TextFormField(controller: _cargoSizeCtrl, decoration: const InputDecoration(labelText: 'Cargo size (e.g. Large box)', prefixIcon: Icon(Icons.straighten_outlined))),
        const Gap(24),
        _SectionTitle('Receiver Info'),
        const Gap(16),
        TextFormField(controller: _receiverNameCtrl, decoration: const InputDecoration(labelText: 'Receiver full name', prefixIcon: Icon(Icons.person_outline))),
        const Gap(16),
        TextFormField(controller: _receiverPhoneCtrl, keyboardType: TextInputType.phone, decoration: const InputDecoration(labelText: 'Receiver phone', prefixIcon: Icon(Icons.phone_outlined))),
        const Gap(20),
        Row(
          children: [
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Receiver pays?', style: TextStyle(fontWeight: FontWeight.w600, color: AppTheme.textPrimary)),
              const Text('Receiver will be billed', style: TextStyle(fontSize: 12, color: AppTheme.textMuted)),
            ])),
            Switch(value: _receiverPays, onChanged: (v) => setState(() => _receiverPays = v), activeThumbColor: AppTheme.accent),
          ],
        ),
        const Gap(20),
        _SectionTitle('Additional Services'),
        const Gap(12),
        Wrap(
          spacing: 10, runSpacing: 10,
          children: _additionalServices.map((s) {
            final sel = _extras.contains(s);
            return GestureDetector(
              onTap: () => setState(() => sel ? _extras.remove(s) : _extras.add(s)),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: sel ? AppTheme.accent : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: sel ? AppTheme.accent : AppTheme.border),
                ),
                child: Text(s, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: sel ? Colors.white : AppTheme.textSecondary)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildConfirmStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionTitle('Review your shipment'),
        const Gap(16),
        _InfoTile('From', _fromCtrl.text),
        _InfoTile('To', _toCtrl.text),
        _InfoTile('Pickup', _pickupType),
        _InfoTile('Service', _serviceType ?? '-'),
        if (_helpers > 0) _InfoTile('Helpers', '$_helpers'),
        _InfoTile('Cargo Type', _cargoTypeCtrl.text),
        _InfoTile('Cargo Size', _cargoSizeCtrl.text),
        _InfoTile('Receiver', _receiverNameCtrl.text),
        _InfoTile('Receiver Phone', _receiverPhoneCtrl.text),
        _InfoTile('Receiver Pays', _receiverPays ? 'Yes' : 'No'),
        if (_extras.isNotEmpty) _InfoTile('Extras', _extras.join(', ')),
        const Gap(16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: AppTheme.accentLight, borderRadius: BorderRadius.circular(12)),
          child: const Row(
            children: [
              Icon(Icons.info_outline, color: AppTheme.accent, size: 18),
              Gap(10),
              Expanded(child: Text('After submission, your request will be reviewed by an admin. You will be notified once approved.', style: TextStyle(color: AppTheme.accent, fontSize: 13, fontWeight: FontWeight.w500))),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _submit() async {
    final provider = context.read<CargoProvider>();
    final cargo = await provider.createCargo({
      'fromAddress': _fromCtrl.text.trim(),
      'toAddress': _toCtrl.text.trim(),
      'pickupType': _pickupType,
      'serviceType': _serviceType,
      'peopleNeeded': _helpers,
      'cargoType': _cargoTypeCtrl.text.trim(),
      'cargoSize': _cargoSizeCtrl.text.trim(),
      'receiverName': _receiverNameCtrl.text.trim(),
      'receiverPhone': _receiverPhoneCtrl.text.trim(),
      'receiverPays': _receiverPays,
      'additionalServices': _extras.toList(),
    });
    if (cargo != null && mounted) {
      context.go('/cargo/${cargo.id}/status');
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(provider.error ?? 'Failed to submit'), backgroundColor: AppTheme.danger),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final steps = ['Route', 'Service', 'Details', 'Confirm'];
    final provider = context.watch<CargoProvider>();

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Send Cargo'),
        leading: IconButton(icon: const Icon(Icons.close), onPressed: () => context.pop()),
      ),
      body: Column(
        children: [
          // Progress indicator
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
            child: Row(
              children: steps.asMap().entries.map((e) {
                final active = e.key <= _step;
                return Expanded(
                  child: Row(
                    children: [
                      Expanded(child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 4, decoration: BoxDecoration(
                          color: active ? AppTheme.accent : AppTheme.border,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      )),
                      if (e.key < steps.length - 1) const Gap(4),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          // Step label
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            width: double.infinity,
            child: Text('Step ${_step + 1} of ${steps.length}: ${steps[_step]}',
              style: const TextStyle(color: AppTheme.textMuted, fontSize: 13, fontWeight: FontWeight.w600)),
          ),
          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: _buildStep(),
            ),
          ),
          // Actions
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
            child: Row(
              children: [
                if (_step > 0) ...[
                  OutlinedButton(onPressed: () => setState(() => _step--), child: const Icon(Icons.arrow_back)),
                  const Gap(12),
                ],
                Expanded(
                  child: FilledButton(
                    onPressed: provider.loading ? null : () {
                      if (_step < 3) {
                        setState(() => _step++);
                      } else {
                        _submit();
                      }
                    },
                    child: provider.loading
                        ? const SizedBox.square(dimension: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                        : Text(_step < 3 ? 'Continue' : 'Submit Request'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);
  @override Widget build(BuildContext context) => Text(text, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16, color: AppTheme.textPrimary, letterSpacing: -0.3));
}

class _InfoTile extends StatelessWidget {
  final String label, value;
  const _InfoTile(this.label, this.value);
  @override Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 120, child: Text(label, style: const TextStyle(color: AppTheme.textMuted, fontSize: 13))),
        Expanded(child: Text(value, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: AppTheme.textPrimary))),
      ],
    ),
  );
}

class _PickupChip extends StatelessWidget {
  final String label, value;
  final bool selected;
  final VoidCallback onTap;
  const _PickupChip({required this.label, required this.value, required this.selected, required this.onTap});
  @override Widget build(BuildContext context) => Expanded(
    child: GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        decoration: BoxDecoration(
          color: selected ? AppTheme.accentLight : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: selected ? AppTheme.accent : AppTheme.border, width: selected ? 2 : 1),
        ),
        child: Text(label, textAlign: TextAlign.center, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: selected ? AppTheme.accent : AppTheme.textSecondary)),
      ),
    ),
  );
}
