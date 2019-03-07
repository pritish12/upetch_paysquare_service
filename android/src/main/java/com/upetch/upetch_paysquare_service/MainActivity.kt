package com.upetch.upetch_paysquare_service

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.util.Log
import com.razorpay.Checkout
import com.razorpay.PaymentResultListener
import org.json.JSONObject

class MainActivity : Activity(), PaymentResultListener {

    val TAG = MainActivity::class.java.simpleName


    companion object {
        val NAME = "name"
        val IMAGE = "image"
        val DESCRIPTION = "description"
        val AMOUNT = "amount"
        val PREFILL = "prefill"
        val PREFILL_EMAIL = "email"
        val PREFILL_CONTACT = "contact"
        val THEME = "theme"
        val PAYMENT_ID = "payment_id"
        val RAZORPAY_KEY = "api_key"
        val CURRENCY = "currency"
        val COLOR = "color"
        val NOTES = "notes"
    }


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val intent = intent
        Checkout.preload(applicationContext)
        startPayment(intent)
    }

    override fun onPaymentError(p0: Int, p1: String?) {
        try {
            val data = Intent()
            data.putExtra(PAYMENT_ID, p1)
            setResult(Activity.RESULT_CANCELED, data)
            finish()
        } catch (e: Exception) {
            e.printStackTrace()
        }

    }

    override fun onPaymentSuccess(p0: String?) {
        try {
            val data = Intent()
            data.putExtra(PAYMENT_ID, p0)
            setResult(Activity.RESULT_OK, data)
            finish()
        } catch (e: Exception) {
            Log.e(TAG, "Error in onPaymentSuccess", e)
        }

    }

    private fun startPayment(intent: Intent) {
        val activity = this
        val _checkout = Checkout()
        _checkout.setKeyID(intent.getStringExtra(RAZORPAY_KEY))

        try {
            val options = JSONObject()
            options.put(NAME, intent.getStringExtra(NAME))
            options.put(DESCRIPTION, intent.getStringExtra(DESCRIPTION))
            options.put(CURRENCY, intent.getStringExtra(CURRENCY))
            options.put(AMOUNT, intent.getStringExtra(AMOUNT))
            options.put(IMAGE, intent.getStringExtra(IMAGE))

            val prefill = JSONObject()
            prefill.put(PREFILL_EMAIL, intent.getStringExtra(PREFILL_EMAIL))
            prefill.put(PREFILL_CONTACT, intent.getStringExtra(PREFILL_CONTACT))
            options.put(PREFILL, prefill)

            _checkout.open(activity, options)

        } catch (e: Exception) {
            e.printStackTrace()
        }

    }
}

