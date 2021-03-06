import Flutter
import UIKit
import Razorpay

@objc public class SwiftUpetchPaysquareServicePlugin: NSObject, FlutterPlugin, RazorpayPaymentCompletionProtocol {
    
    var razorpay: Razorpay!
    var _result: FlutterResult!
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "upetch_paysquare_service", binaryMessenger: registrar.messenger())
        let instance = SwiftUpetchPaysquareServicePlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        _result = result
        if(call.method.elementsEqual("startPayment")){
            let argue = call.arguments as? NSDictionary
            let product_name = argue!["name"] as? String
            let product_description = argue!["description"] as? String
            let product_image = argue!["image"] as? String
            
            let product_amount = argue!["amount"] as? String
            let prefill_email = argue!["email"] as? String
            let prefill_contact = argue!["contact"] as? String
            
            let API_KEY = argue!["api_key"] as? String
            razorpay = Razorpay.initWithKey(API_KEY!,andDelegate: self)
            startPayment(name: product_name ?? "", des: product_description ?? "",
                         image: product_image,
                         amount: product_amount ?? "", email: prefill_email ?? "", contact: prefill_contact ?? "")
        }
    }
    
    func startPayment(name: String,des: String,image: String?=nil,amount: String,email: String,
                      contact:String) {
        var params: [String: Any] = [
            "name":name,
            "description": description,
            "amount": amount,
            "prefill":[
                "contact": contact,
                "email": email,
            ],]
        if(image != nil){
            params["image"] = image
        }
        
        razorpay.open(params)
    }
    
    public func onPaymentError(_ code: Int32, description str: String) {
        var response = [String: String]()
        response["message"] = str
        response["code"] = "0"
        _result(response)
    }
    
    public func onPaymentSuccess(_ payment_id: String) {
        var response = [String: String]()
        response["message"] = payment_id
        response["code"] = "1"
        _result(response)
    }
    
}
