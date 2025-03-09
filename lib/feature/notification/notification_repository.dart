
import 'package:first_flutter/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationRepository {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'Channel_id',
    'Channel_title',
    description: 'This channel is used for important notifications.',
    importance: Importance.high,
    playSound: true,
  );

  static Future<void> initialization() async {
    tz.initializeTimeZones();
    final location = tz.getLocation('Asia/Dhaka'); // Correct timezone name
    tz.setLocalLocation(location);


    await _notificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await _notificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    await _notificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true
    );

    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');

    DarwinInitializationSettings iosInitializationSettings =
        DarwinInitializationSettings(
          requestSoundPermission: false,
          requestBadgePermission: false,
          requestAlertPermission: false,
        );

    InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: iosInitializationSettings,
    );

    _notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (details) async {});
  }

  void showNotification({String title = "This is title", String body = "this is body"}) {
    _notificationsPlugin.show(
        0,
        title,
        body,
        NotificationDetails(
            android: AndroidNotificationDetails(
                channel.id, channel.name,
                channelDescription: channel.description,
                importance: Importance.high,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher'
            ),
            iOS: const DarwinNotificationDetails(
                presentSound: true,
                presentAlert: true,
                presentBadge: true
            )
        ),
        payload: 'Open from Local Notification');
  }

  Future<void> scheduledNotification(DateTime time, {String title = "This is title", String body = "this is body"}) async{
    if(time.isBefore(DateTime.now())){
      time = time.add(const Duration(days: 1));
    }

    final tz.TZDateTime scheduleTime = tz.TZDateTime.from(time, tz.local);

    try{
      await _notificationsPlugin.zonedSchedule(
          0,
          title,
          body,
          scheduleTime,
          _notificationDetails(),
          uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
          matchDateTimeComponents: DateTimeComponents.time,
        androidScheduleMode: AndroidScheduleMode.inexact
      );
    }catch(e){
      Logger.log("Exception: $e}");
    }
  }

  NotificationDetails _notificationDetails(){
    return NotificationDetails(
        android: AndroidNotificationDetails(
            DateTime.now().millisecondsSinceEpoch.toString(), channel.name,
            channelDescription: channel.description,
            importance: Importance.high,
            color: Colors.blue,
            playSound: true,
            icon: '@mipmap/ic_launcher',
            showWhen: false
        ),
        iOS: const DarwinNotificationDetails(
            presentSound: true,
            presentAlert: true,
            presentBadge: true
        )
    );
  }

  Future<void> intervalNotification({String title = "This is title", String body = "this is body"}) async{
    try{
      await _notificationsPlugin.periodicallyShow(
          0,
          title,
          body,
          RepeatInterval.everyMinute,
          _notificationDetails(),
          androidScheduleMode: AndroidScheduleMode.inexact
      );
    }catch(e){
      Logger.log("Exception: $e}");
    }
  }

  Future<void> dailyNotification({String title = "this is title", String body = "this is body", int hour = 11, int minute = 42}) async{
    await _notificationsPlugin.zonedSchedule(
      0,
      title,
      body,
      _nextInstanceOfTime(hour, minute),
        _notificationDetails(),
      matchDateTimeComponents: DateTimeComponents.time,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.inexact
    );
  }

  static tz.TZDateTime _nextInstanceOfTime(int hour, int minute, { int day = 1}) {
    final now = tz.TZDateTime.now(tz.local);
    var scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(Duration(days: day));
    }

    return scheduledDate;
  }

  Future<void> weeklyNotification({String title = "this is title", String body = "this is body", int hour = 11, int minute = 34}) async{
    await _notificationsPlugin.zonedSchedule(
        0,
        title,
        body,
        _nextInstanceOfTime(hour, minute, day: 7),
        _notificationDetails(),
        matchDateTimeComponents: DateTimeComponents.time,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.alarmClock
    );
  }

  Future<void> notificationWithImage({String title = "this is title", String body = "this is body", String imageUrl = ""}) async{
    BigPictureStyleInformation? bigPictureStyleInformation;
    try {
      final response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        final byteArray = response.bodyBytes;
        bigPictureStyleInformation = BigPictureStyleInformation(
          ByteArrayAndroidBitmap(byteArray),
          largeIcon: ByteArrayAndroidBitmap(byteArray),
          contentTitle: title,
          summaryText: body,
        );
      }
    } catch (e) {

    }
    var notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
            DateTime.now().millisecondsSinceEpoch.toString(), channel.name,
            channelDescription: channel.description,
            styleInformation: bigPictureStyleInformation,
            importance: Importance.high,
            color: Colors.blue,
            playSound: true,
            icon: '@mipmap/ic_launcher',
            showWhen: false
        ),
        iOS: const DarwinNotificationDetails(
            presentSound: true,
            presentAlert: true,
            presentBadge: true
        )
    );

    await _notificationsPlugin.show(0, title, body, notificationDetails);
  }
}
