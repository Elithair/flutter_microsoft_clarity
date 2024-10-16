package com.dev.flutter_microsoft_clarity

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import com.microsoft.clarity.Clarity
import com.microsoft.clarity.ClarityConfig

class FlutterMicrosoftClarityPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {

     private lateinit var channel: MethodChannel
    private var currentActivity: android.app.Activity? = null


    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_microsoft_clarity")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "getPlatformVersion") {
            result.success("Android ${android.os.Build.VERSION.RELEASE}")
        } else if (call.method == "init") {
            val projectId: String? = call.argument<String>("projectID")
            val userId: String? = call.argument<String>("userID") // Adiciona o userId como argumento

            if (projectId != null) {
                val config = if (userId != null) {
                ClarityConfig(projectId, userId) // Passa o userId se não for nulo
            } else {
                ClarityConfig(projectId) // Não passa o userId se for nulo
            }
            Clarity.initialize(currentActivity, config)
            } else {
                result.error(
                    "PRODUCT_ID_NULL",
                    "Specify the project Id for microsoft clarity",
                    null
                )
            }


        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }


    /******************************/
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        currentActivity = binding.activity
    }

    override fun onDetachedFromActivityForConfigChanges() {
        currentActivity = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        currentActivity = binding.activity
    }

    override fun onDetachedFromActivity() {
        currentActivity = null
    }
}
