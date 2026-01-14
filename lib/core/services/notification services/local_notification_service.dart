import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static StreamController<NotificationResponse> streamController =
      StreamController();

  static onTap(NotificationResponse notificationResponse) {
    log(notificationResponse.id!.toString());
    streamController.add(notificationResponse);
  }

  static Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsDarwin,
        );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );

    // 🔥🔥🔥 الإضافة المطلوبة هنا 🔥🔥🔥
    // هذا الكود يسجل القناة في نظام الأندرويد لكي تعمل في الخلفية
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'channel_id_1', // نفس الـ ID المستخدم في باقي الكود
      'Basic Notifications',
      description: 'This channel is for basic notifications',
      importance: Importance.max, // هذا ما يجعل الـ Pop-up يظهر
      playSound: true,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);
    // 🔥🔥🔥 نهاية الإضافة 🔥🔥🔥

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();
  }

  // ... باقي الدوال (showLocalNotification, showForeGroundNotification, showBasicNotification) اتركها كما هي تماماً
  static Future<void> showLocalNotification() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
          'channel_id_1',
          'Basic Notifications',
          channelDescription: 'This channel is for basic notifications',
          importance: Importance.max,
          priority: Priority.high,
          showWhen: true,
        );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      'Local Notification',
      'Welcome to our app',
      notificationDetails,
    );
  }

  static Future<void> showForeGroundNotification(
    String? title,
    String? body,
  ) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
          'channel_id_1',
          'Basic Notifications',
          channelDescription: 'This channel is for basic notifications',
          importance: Importance.max,
          priority: Priority.high,
          showWhen: true,
        );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      notificationDetails,
    );
  }

  static void showBasicNotification(RemoteMessage message) async {
    final http.Response image = await http.get(
      Uri.parse(message.notification?.android?.imageUrl ?? ''),
    );
    BigPictureStyleInformation bigPictureStyleInformation =
        BigPictureStyleInformation(
          ByteArrayAndroidBitmap.fromBase64String(
            base64Encode(image.bodyBytes),
          ),
          largeIcon: ByteArrayAndroidBitmap.fromBase64String(
            base64Encode(image.bodyBytes),
          ),
        );
    AndroidNotificationDetails android = AndroidNotificationDetails(
      'channel_id_1', // ⚠️ وحدت الاسم هنا ليكون مثل الباقي channel_id_1
      'Basic Notifications',
      importance: Importance.max,
      priority: Priority.high,
      styleInformation: bigPictureStyleInformation,
    );
    NotificationDetails details = NotificationDetails(android: android);
    await flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title,
      message.notification?.body,
      details,
    );
  }
}
