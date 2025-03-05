import 'dart:ffi';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();


  static Future<void> initialize() async{
    const AndroidInitializationSettings androidInitializationSettings = AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings darwinInitializationSettings = DarwinInitializationSettings();

    const InitializationSettings settings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: darwinInitializationSettings
    );

    await _notificationsPlugin.initialize(settings,
      onDidReceiveNotificationResponse:
            (NotificationResponse response) {
      //handle notification tap
    },);

    tz.initializeTimeZones();
  }


  static Future showNotification({int id = 0, String title = "Title", String body = "Body text"}) async{
    const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
        "channel_id",
        "channel_name",
      importance: Importance.max,
      priority: Priority.high
    );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: DarwinNotificationDetails()
    );

    await _notificationsPlugin.show(id,  title, body, notificationDetails);
  }
}