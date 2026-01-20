import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
const pColor = Color(0xff204F38);
final String baseUrl = 'https://fruits.sys-web.net/api';
// في ملف core/utils/constants.dart


AndroidOptions _getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );

// هذا المتغير سيتم استدعاؤه في كل الـ Cubits
final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());