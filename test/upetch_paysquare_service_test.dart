//import 'package:flutter/services.dart';
//import 'package:flutter_test/flutter_test.dart';
//import 'package:upetch_paysquare_service/upetch_paysquare_service.dart';
//
//void main() {
//  const MethodChannel channel = MethodChannel('upetch_paysquare_service');
//
//  setUp(() {
//    channel.setMockMethodCallHandler((MethodCall methodCall) async {
//      return '42';
//    });
//  });
//
//  tearDown(() {
//    channel.setMockMethodCallHandler(null);
//  });
//
//  test('getPlatformVersion', () async {
//    expect(await UpetchPaysquareService.platformVersion, '42');
//  });
//}
