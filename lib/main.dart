import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/core/notifications/firebase_api.dart';
import 'package:fruit_app/features/splash/presentation/views/splash_view.dart';
import 'package:fruit_app/firebase_options.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FirebaseApi().initNotifications();
  runApp(FruitApp());
}

class FruitApp extends StatelessWidget {
  const FruitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // navigatorKey: navigatorKey,
      // builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
