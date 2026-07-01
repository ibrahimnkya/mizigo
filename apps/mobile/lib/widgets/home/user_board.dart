import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class UserBoard extends StatelessWidget {
  final String userName;
  final VoidCallback onTap;
  final bool printerConnected;
  final bool isPrinterLoading;
  final VoidCallback onPrinterTap;

  const UserBoard({
    super.key,
    required this.userName,
    required this.onTap,
    required this.printerConnected,
    required this.isPrinterLoading,
    required this.onPrinterTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back,',
                  style: TextStyle(
                    color: theme.textTheme.bodyMedium?.color,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  userName,
                  style: TextStyle(
                    color: theme.textTheme.bodyLarge?.color,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: onPrinterTap,
            borderRadius: BorderRadius.circular(50),
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: theme.cardTheme.color,
                shape: BoxShape.circle,
                border: Border.all(
                  color: theme.dividerColor,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.02),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  HugeIcon(
                    icon: HugeIcons.strokeRoundedPrinter,
                    color: theme.iconTheme.color,
                    size: 20,
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: isPrinterLoading
                            ? Colors.yellow
                            : (printerConnected ? Colors.green : Colors.red),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: theme.cardTheme.color ?? theme.scaffoldBackgroundColor,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(50),
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: theme.cardTheme.color,
                shape: BoxShape.circle,
                border: Border.all(
                  color: theme.dividerColor,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.02),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: HugeIcon(
                  icon: HugeIcons.strokeRoundedUser,
                  color: theme.iconTheme.color,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
