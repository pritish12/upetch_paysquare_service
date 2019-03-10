import 'package:flutter/services.dart';

class UpetchPaysquareService {
  static const MethodChannel _channel =
  const MethodChannel('upetch_paysquare_service');

  static Future<Map<dynamic, dynamic>> openRazorPaymentDialog(
      Map<dynamic, dynamic> map) async {
    Map<dynamic, dynamic> response = Map();
    response = await _channel.invokeMethod("startPayment", map);
    return response;
  }
}
