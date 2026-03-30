import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../providers/payment_provider.dart';

class AddPaymentMethodScreen extends StatefulWidget {
  const AddPaymentMethodScreen({super.key});

  @override
  State<AddPaymentMethodScreen> createState() => _AddPaymentMethodScreenState();
}

class _AddPaymentMethodScreenState extends State<AddPaymentMethodScreen> {
  int _selectedType = 0; // 0 = Mobile Money, 1 = Card
  
  final _mmNetworkController = TextEditingController();
  final _mmPhoneController = TextEditingController();
  
  final _cardNameController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _cardExpiryController = TextEditingController();
  final _cardCvvController = TextEditingController();

  @override
  void dispose() {
    _mmNetworkController.dispose();
    _mmPhoneController.dispose();
    _cardNameController.dispose();
    _cardNumberController.dispose();
    _cardExpiryController.dispose();
    _cardCvvController.dispose();
    super.dispose();
  }

  void _saveMethod() async {
    String type = '';
    String details = '';

    if (_selectedType == 0) {
      final network = _mmNetworkController.text.trim();
      final phone = _mmPhoneController.text.trim();
      if (network.isEmpty || phone.isEmpty) return;
      type = network;
      details = '•••• ${phone.length > 4 ? phone.substring(phone.length - 4) : phone}';
    } else {
      final number = _cardNumberController.text.trim();
      final name = _cardNameController.text.trim();
      if (number.isEmpty || name.isEmpty) return;
      type = 'Card';
      details = '•••• ${number.length > 4 ? number.substring(number.length - 4) : number}';
    }

    final newMethod = PaymentMethod(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      type: type,
      details: details,
      isDefault: false,
    );

    await context.read<PaymentProvider>().addMethod(newMethod);

    if (mounted) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Payment method added successfully',
            style: GoogleFonts.inter(),
          ),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  Widget _buildTypeSelector() {
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => setState(() => _selectedType = 0),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: _selectedType == 0
                    ? theme.primaryColor.withValues(alpha: 0.1)
                    : theme.cardColor,
                /* border: Border.all(
                  color: _selectedType == 0
                      ? theme.primaryColor
                      : theme.dividerColor,
                ), */
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.phone_android,
                    color: _selectedType == 0
                        ? const Color(0xFF3B82F6)
                        : const Color(0xFF94A3B8),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Mobile Money',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: _selectedType == 0
                          ? FontWeight.w600
                          : FontWeight.w500,
                      color: _selectedType == 0
                          ? const Color(0xFF3B82F6)
                          : const Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: GestureDetector(
            onTap: () => setState(() => _selectedType = 1),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: _selectedType == 1
                    ? theme.primaryColor.withValues(alpha: 0.1)
                    : theme.cardColor,
                /* border: Border.all(
                  color: _selectedType == 1
                      ? theme.primaryColor
                      : theme.dividerColor,
                ), */
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.credit_card,
                    color: _selectedType == 1
                        ? const Color(0xFF3B82F6)
                        : const Color(0xFF94A3B8),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Credit Card',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: _selectedType == 1
                          ? FontWeight.w600
                          : FontWeight.w500,
                      color: _selectedType == 1
                          ? const Color(0xFF3B82F6)
                          : const Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, String hint, TextEditingController controller) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.8),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            style: GoogleFonts.inter(
              fontSize: 16,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: GoogleFonts.inter(color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.4)),
              filled: true,
              fillColor: theme.brightness == Brightness.dark ? Colors.white.withValues(alpha: 0.05) : const Color(0xFFF8FAFC),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Theme.of(context).dividerColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
              ),
            ),
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
          'Add Payment Method',
          style: GoogleFonts.outfit(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: theme.textTheme.titleLarge?.color,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTypeSelector(),
            const SizedBox(height: 32),
            if (_selectedType == 0) ...[
              _buildTextField('Mobile Network', 'M-Pesa, Airtel Money, etc.', _mmNetworkController),
              _buildTextField('Phone Number', '+255 123 456 789', _mmPhoneController),
            ] else ...[
              _buildTextField('Cardholder Name', 'Jane Doe', _cardNameController),
              _buildTextField('Card Number', '0000 0000 0000 0000', _cardNumberController),
              Row(
                children: [
                  Expanded(child: _buildTextField('Expiry Date', 'MM/YY', _cardExpiryController)),
                  const SizedBox(width: 16),
                  Expanded(child: _buildTextField('CVV', '•••', _cardCvvController)),
                ],
              ),
            ],
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ElevatedButton(
            onPressed: _saveMethod,
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: Text(
              'Save Payment Method',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

