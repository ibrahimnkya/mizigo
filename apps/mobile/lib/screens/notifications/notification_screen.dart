import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import '../../theme/app_theme.dart';
import '../../providers/cargo_provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Map<String, dynamic>> _notifications = [];
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final data = await context.read<CargoProvider>().getNotifications();
      if (mounted) {
        setState(() {
          _notifications = data;
          _loading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Notifications'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/home'),
        ),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(child: Text(_error!, style: const TextStyle(color: AppTheme.danger)))
              : _notifications.isEmpty
                  ? _buildEmpty()
                  : _buildList(),
    );
  }

  Widget _buildEmpty() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 64, height: 64,
            decoration: BoxDecoration(color: AppTheme.accentLight, borderRadius: BorderRadius.circular(16)),
            child: const Icon(Icons.notifications_none_outlined, color: AppTheme.accent, size: 30),
          ),
          const Gap(16),
          const Text('No notifications yet', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: AppTheme.textPrimary)),
          const Gap(4),
          const Text("You'll be notified when your cargo status changes.", style: TextStyle(color: AppTheme.textMuted, fontSize: 13), textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _buildList() {
    return RefreshIndicator(
      onRefresh: _load,
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _notifications.length,
        separatorBuilder: (context, index) => const Gap(10),
        itemBuilder: (_, i) => _NotifCard(notif: _notifications[i]),
      ),
    );
  }
}

class _NotifCard extends StatelessWidget {
  final Map<String, dynamic> notif;
  const _NotifCard({required this.notif});

  Color get _typeColor {
    switch ((notif['type'] as String? ?? '').toUpperCase()) {
      case 'SUCCESS': return AppTheme.success;
      case 'WARNING': return AppTheme.warning;
      case 'ERROR': return AppTheme.danger;
      default: return AppTheme.accent;
    }
  }

  IconData get _typeIcon {
    switch ((notif['type'] as String? ?? '').toUpperCase()) {
      case 'SUCCESS': return Icons.check_circle_outline_rounded;
      case 'WARNING': return Icons.warning_amber_rounded;
      case 'ERROR': return Icons.error_outline_rounded;
      default: return Icons.notifications_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    final createdAt = notif['createdAt'] != null
        ? DateFormat('d MMM yyyy, HH:mm').format(DateTime.parse(notif['createdAt'] as String))
        : '';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppTheme.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40, height: 40,
            decoration: BoxDecoration(color: _typeColor.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
            child: Icon(_typeIcon, color: _typeColor, size: 20),
          ),
          const Gap(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(notif['title'] as String? ?? '', style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: AppTheme.textPrimary)),
                const Gap(3),
                Text(notif['message'] as String? ?? '', style: const TextStyle(color: AppTheme.textSecondary, fontSize: 13, height: 1.4)),
                const Gap(6),
                Text(createdAt, style: const TextStyle(color: AppTheme.textMuted, fontSize: 11)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
