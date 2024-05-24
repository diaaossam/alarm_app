import 'dart:convert';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalNotificationService {
  LocalNotificationService();

  final _localNotificationService = FlutterLocalNotificationsPlugin();

  Future<void> initializeNotification() async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('ic_stat_logo');

    DarwinInitializationSettings iosInitialization =
        const DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    final InitializationSettings settings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitialization,
    );

    await _localNotificationService.initialize(
      settings,
      onDidReceiveNotificationResponse: _onDidReceiveNotificationResponse,
    );
  }

  void _onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (payload != null) {
      Map<String, dynamic> map = json.decode(payload);
    }
  }

  Future<NotificationDetails> _notificationDetails() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool isNotificationWork =sharedPreferences.getBool("notification")??true;

    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails("fcm_default_channel", "channelName",
      channelDescription: "channelDescription",
      playSound: true,
      priority: Priority.max,
      channelShowBadge: true,
      importance: Importance.max,
      enableVibration: true,
    );

    const AndroidNotificationDetails androidNotificationDetailsWithOutSound =
    AndroidNotificationDetails("no_sounds", "high_importance_channel",
        channelDescription: "channelDescription",
        priority: Priority.max,
        channelShowBadge: true,
        enableLights: true,
        enableVibration: true,
        playSound: false,
        importance: Importance.max,
        sound: null);

    DarwinNotificationDetails darwinNotificationDetails =
    const DarwinNotificationDetails();

    return NotificationDetails(
        android: isNotificationWork ? androidNotificationDetails : androidNotificationDetailsWithOutSound,
        iOS: darwinNotificationDetails);
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    required String payload,
  }) async {
    final details = await _notificationDetails();
    await _localNotificationService.show(id, title, body, details, payload: payload);
  }
}
