import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../services/api_service.dart';

/// Background message handler — must be a top-level function.
@pragma('vm:entry-point')
Future<void> _firebaseBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  // No-op: flutter_local_notifications handles display in the foreground.
  // Background/terminated messages are shown by the OS automatically.
  debugPrint('[FCM] Background message: ${message.notification?.title}');
}

class NotificationService {
  static final FlutterLocalNotificationsPlugin _localNotifs =
      FlutterLocalNotificationsPlugin();

  static const AndroidNotificationChannel _channel = AndroidNotificationChannel(
    'mizigo_notifications',
    'Mizigo Notifications',
    description: 'Cargo status updates and payment alerts from Mizigo.',
    importance: Importance.max,
    showBadge: true,
  );

  /// Must be called after Firebase.initializeApp() in main().
  static Future<void> initialize() async {
    // Android local notification setup
    await _localNotifs
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_channel);

    const initSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    await _localNotifs.initialize(
      settings: initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        // Handle notification tap
        debugPrint('[FCM] Notification tapped: ${response.payload}');
      },
    );

    // Request permission (iOS + Android 13+)
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // Register background handler
    FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundHandler);

    // ── Foreground messages: show via flutter_local_notifications ──
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final notification = message.notification;
      if (notification != null) {
        _localNotifs.show(
          id: notification.hashCode,
          title: notification.title,
          body: notification.body,
          notificationDetails: NotificationDetails(
            android: AndroidNotificationDetails(
              _channel.id,
              _channel.name,
              channelDescription: _channel.description,
              importance: Importance.max,
              priority: Priority.high,
            ),
          ),
        );
      }
    });

    // ── Save FCM token to backend ──
    await _registerToken();

    // Refresh token when it changes
    FirebaseMessaging.instance.onTokenRefresh.listen(_saveToken);
  }

  static Future<void> _registerToken() async {
    try {
      final token = await FirebaseMessaging.instance.getToken();
      if (token != null) {
        await _saveToken(token);
      }
    } catch (e) {
      debugPrint('[FCM] APNS token not available (expected on simulator): $e');
    }
  }

  static Future<void> _saveToken(String token) async {
    try {
      await ApiService.saveFcmToken(token);
      debugPrint('[FCM] Token registered: ${token.substring(0, 10)}…');
    } catch (e) {
      debugPrint('[FCM] Failed to save token: $e');
    }
  }
}
