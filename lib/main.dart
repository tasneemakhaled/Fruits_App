import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/core/services/local_notification_service.dart';
import 'package:fruit_app/core/services/push_notification_service.dart';

import 'package:fruit_app/features/splash/presentation/views/splash_view.dart';
import 'package:fruit_app/firebase_options.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize('890fb436-fc2a-4074-9d20-64fafd83558b');
  OneSignal.Notifications.requestPermission(true);
  await LocalNotificationService.init();
  PushNotificationService.initalize();
  runApp(FruitApp());
}

class FruitApp extends StatelessWidget {
  const FruitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashView());
  }
}
