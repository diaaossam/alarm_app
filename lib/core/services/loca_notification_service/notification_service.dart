/*
import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'local_notification_service.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage event) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.instance.getToken();
  LocalNotificationService().showNotification(
    id: Random().nextInt(200000),
    title: event.data['title'],
    body: event.data['body'],
    payload: event.data["payload"],
  );
}

class NotificationService {
  Future<void> initNotification() async {
    await LocalNotificationService().initializeNotification();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen((event) async {
      FirebaseMessaging.instance.getToken();
      LocalNotificationService().showNotification(
        id: Random().nextInt(200000),
        title: event.data['title'],
        body: event.data['body'],
        payload: event.data["payload"],
      );
    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      FirebaseMessaging.instance.getToken();
      LocalNotificationService().showNotification(
        id: Random().nextInt(200000),
        title: event.data['title'],
        body: event.data['body'],
        payload: event.data["payload"],
      );
    });
  }
}
*/
