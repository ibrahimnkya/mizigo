import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';

class NumericKeypad extends StatelessWidget {
  final Function(String) onNumberPressed;
  final VoidCallback onDeletePressed;

  const NumericKeypad({
    super.key,
    required this.onNumberPressed,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Column(
        children: [
          _buildRow(['1', '2', '3']),
          _buildRow(['4', '5', '6']),
          _buildRow(['7', '8', '9']),
          _buildRow(['', '0', 'backspace']),
        ],
      ),
    );
  }

  Widget _buildRow(List<String> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: items.map((item) {
          if (item == '') return const Expanded(child: SizedBox());
          if (item == 'backspace') {
            return Expanded(
              child: InkWell(
                onTap: onDeletePressed,
                borderRadius: BorderRadius.circular(40),
                child: const Center(
                  child: HugeIcon(
                    icon: HugeIcons.strokeRoundedDelete02,
                    color: Color(0xFF1E293B),
                    size: 24,
                  ),
                ),
              ),
            );
          }
          return Expanded(
            child: InkWell(
              onTap: () => onNumberPressed(item),
              borderRadius: BorderRadius.circular(40),
              child: Center(
                child: Text(
                  item,
                  style: GoogleFonts.outfit(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF1E293B),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
