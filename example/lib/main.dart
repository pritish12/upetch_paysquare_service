import 'package:flutter/material.dart';
import 'package:upetch_paysquare_service/upetch_paysquare_service.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: RaisedButton(
          onPressed: () {
            _showRazorPayView();
          },
          child: Text("Show RazorPay", textDirection: TextDirection.ltr),
        )),
      ),
    );
  }

  Future<Null> _showRazorPayView() async {
    String apikey = "rzp_test_cupPGaFT8IHVLm";

    Map<String, dynamic> options = Map();
    options.putIfAbsent("name", () => "Testing");
    options.putIfAbsent("image", () => "");
    options.putIfAbsent("description", () => "Testing");
    options.putIfAbsent("amount", () => "100");
    options.putIfAbsent("email", () => "test@test.com");
    options.putIfAbsent("contact", () => "100");
    options.putIfAbsent("currency", () => "INR");
    options.putIfAbsent("api_key", () => apikey);

    Map<dynamic, dynamic> paymentResponse = Map();
    paymentResponse =
        await UpetchPaysquareService.openRazorPaymentDialog(options);
    print("response $paymentResponse");
  }
}
