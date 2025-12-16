import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fruit_app/core/services/local_notification_service.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static Future initalize() async {
    await messaging.requestPermission();

    await messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // هنا فقط نحتاج إظهار الإشعار يدوياً لأن التطبيق مفتوح
      LocalNotificationService.showForeGroundNotification(
        message.notification?.title,
        message.notification?.body,
      );
    });
  }

  // هذه الدالة تعمل فقط لمعالجة البيانات في الخلفية، النظام سيعرض الإشعار بنفسه
  static Future<void> handleBackgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();
    log("Handling a background message: ${message.messageId}");
  }
}
