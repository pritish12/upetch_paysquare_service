import 'package:flutter/services.dart';

class UpetchRazorPayPlugin {
  static const MethodChannel _channel =
      const MethodChannel('upetch_razor_pay_plugin');

  static Future<Map<dynamic, dynamic>> openRazorPaymentDialog(
      Map<dynamic, dynamic> map) async {
    Map<dynamic, dynamic> response = Map();
    response = await _channel.invokeMethod("startPayment", map);
    return response;
  }
}
