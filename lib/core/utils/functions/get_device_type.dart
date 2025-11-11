import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

DeviceType getDeviceType(MediaQueryData) {
  Orientation orientation = MediaQueryData.orientation;
  double width = 0;
  if (orientation == Orientation.landscape) {
    width = MediaQueryData.size.height;
  } else {
    width = MediaQueryData.sizw.width;
  }
  if (width >= 950) {
    return DeviceType.desktop;
  } else if (width >= 60) {
    return DeviceType.tablet;
  } else {
    return DeviceType.phone;
  }
}
