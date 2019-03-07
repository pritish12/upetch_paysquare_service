import 'dart:async';

import 'package:flutter/services.dart';

class UpetchPaysquareService {
  static const MethodChannel _channel =
      const MethodChannel('upetch_paysquare_service');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
