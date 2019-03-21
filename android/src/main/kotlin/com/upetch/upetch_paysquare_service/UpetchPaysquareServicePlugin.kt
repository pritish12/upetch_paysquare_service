package com.upetch.upetch_paysquare_service

import android.app.Activity
import android.content.Intent
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugin.common.PluginRegistry.Registrar

class UpetchPaysquareServicePlugin constructor(activity: Activity, channel: MethodChannel) : MethodCallHandler, PluginRegistry.ActivityResultListener {

    var activity: Activity? = null
    var channel: MethodChannel? = null
    var paymentResult: Result? = null
    var arguments: Map<String, Any>? = null
    val PAY_WITH_RAZORPAY = 100

    init {
        this.activity = activity
        this.channel = channel
        this.channel?.setMethodCallHandler(this)
    }

    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "upetch_paysquare_service")
            val _pluginInstance = UpetchPaysquareServicePlugin(registrar.activity(), channel)
            channel.setMethodCallHandler(_pluginInstance)
            registrar.addActivityResultListener(_pluginInstance)
        }
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        paymentResult = result

        if (call.method == "startPayment") {
            arguments = call.arguments as Map<String, Any>?
            val razorPayIntent = Intent(activity, MainActivity::class.java)
            razorPayIntent.putExtra(MainActivity.NAME, arguments?.get("name") as String)
            razorPayIntent.putExtra(MainActivity.IMAGE, arguments?.get("image") as String)
            razorPayIntent.putExtra(MainActivity.DESCRIPTION, arguments?.get("description") as String)
            razorPayIntent.putExtra(MainActivity.AMOUNT, arguments?.get("amount") as String)
            razorPayIntent.putExtra(MainActivity.CURRENCY, arguments?.get("currency") as String)
            razorPayIntent.putExtra(MainActivity.PREFILL_EMAIL, arguments?.get("email") as String)
            razorPayIntent.putExtra(MainActivity.PREFILL_CONTACT, arguments?.get("contact") as String)
            razorPayIntent.putExtra(MainActivity.RAZORPAY_KEY, arguments?.get("api_key") as String)
            activity?.startActivityForResult(razorPayIntent, PAY_WITH_RAZORPAY)
        } else {
            result.notImplemented()
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, intent: Intent?): Boolean {
        if (requestCode == PAY_WITH_RAZORPAY) {
            val data = HashMap<String, String>()
            val response = intent?.getStringExtra(MainActivity.PAYMENT_ID)
            val code = "Code"
            val message = "Message"
            if (resultCode == Activity.RESULT_OK) {
                data[code] = "1"
                response?.let { data.put(message, it) }
                paymentResult?.success(data)
            } else if (resultCode == Activity.RESULT_CANCELED) {
                data[code] = "0"
                response?.let { data.put(message, it) }
                paymentResult?.success(data)
            }

            paymentResult = null
            arguments = null
            return true
        }
        return false
    }
}