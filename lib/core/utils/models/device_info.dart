import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/enums/device_type.dart';

class DeviceInfo {
  final Orientation orientation;
  final double screenWidth;
  final double screenHeight;
  final DeviceType deviceType;
  final double localWidth;
  final double localHeight;

  DeviceInfo({
    required this.orientation,
    required this.screenWidth,
    required this.screenHeight,
    required this.deviceType,
    required this.localWidth,
    required this.localHeight,
  });
}
