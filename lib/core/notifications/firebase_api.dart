// import 'package:firebase_messaging/firebase_messaging.dart';

// import 'package:fruit_app/main.dart';
// // عشان نشوف الـ navigatorKey

// // دالة الخلفية زي ما هي
// @pragma('vm:entry-point')
// Future<void> handleBackgroundMessage(RemoteMessage message) async {
//   print('Title: ${message.notification?.title}');
//   print('Body: ${message.notification?.body}');
// }

// class FirebaseApi {
//   final _firebaseMessaging = FirebaseMessaging.instance;

//   Future<void> initNotifications() async {
//     await _firebaseMessaging.requestPermission();

//     final fCMToken = await _firebaseMessaging.getToken();
//     print('Token: $fCMToken');

//     // 1. تشغيل دالة التوجيه (Setup Interactivity)
//     initPushNotifications();

//     FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
//   }

//   // --- دالة جديدة للتعامل مع الضغط على النوتيفيكيشن ---
//   void handleMessage(RemoteMessage? message) {
//     // لو مفيش رسالة، ميعملش حاجة
//     if (message == null) return;

//     // استخدام navigatorKey للانتقال للصفحة
//     navigatorKey.currentState?.pushNamed(
//       '/notification_screen',
//       arguments: message, // بنبعت الرسالة كـ data للصفحة الجديدة
//     );
//   }

//   Future initPushNotifications() async {
//     // السيناريو 1: التطبيق كان مقفول تماماً (Terminated) واليوزر فتحه من النوتيفيكيشن
//     FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

//     // السيناريو 2: التطبيق كان في الخلفية (Background) واليوزر داس على النوتيفيكيشن
//     FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
//   }
// }
