import 'package:onesignal_flutter/onesignal_flutter.dart';

class OneSignalService {
  static void initOneSignal() {
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    OneSignal.initialize('e7193117-3bb2-4b08-88f5-79589f94a81d');
    OneSignal.Notifications.requestPermission(true);
    OneSignal.Notifications.addForegroundWillDisplayListener((event) {
      // الكود ده بيجبر النوتيفيكيشن تظهر كـ Alert حتى لو اليوزر فاتح التطبيق
      event.notification.display();
    });
  }
}
