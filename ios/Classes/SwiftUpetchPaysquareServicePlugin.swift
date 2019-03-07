import Flutter
import UIKit

public class SwiftUpetchPaysquareServicePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "upetch_paysquare_service", binaryMessenger: registrar.messenger())
    let instance = SwiftUpetchPaysquareServicePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
