import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/core/services/notification%20services/local_notification_service.dart';
import 'package:fruit_app/core/services/notification%20services/one_signal_service.dart';
import 'package:fruit_app/core/services/notification%20services/push_notification_service.dart';

import 'package:fruit_app/features/splash/presentation/views/splash_view.dart';
import 'package:fruit_app/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  OneSignalService.initOneSignal();
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
