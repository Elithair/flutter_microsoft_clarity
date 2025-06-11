package com.dev.flutter_microsoft_clarity

import android.os.Build
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import com.microsoft.clarity.Clarity
import com.microsoft.clarity.ClarityConfig
import com.microsoft.clarity.models.LogLevel

class FlutterMicrosoftClarityPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {

    private lateinit var channel: MethodChannel
    private var currentActivity: android.app.Activity? = null


    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_microsoft_clarity")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "getPlatformVersion") {
            result.success("Android ${Build.VERSION.RELEASE}")
        } else if (call.method == "init") {

            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q && Build.VERSION.SDK_INT <= Build.VERSION_CODES.VANILLA_ICE_CREAM) {
                val projectId: String? = call.argument<String>("projectID")
                val userId: String? =
                    call.argument<String>("userID") // Adiciona o userId como argumento

                if (projectId != null) {
                    val config = if (userId != null) {
                        ClarityConfig(
                            projectId, userId, logLevel = LogLevel.Verbose
                        ) // Passa o userId se não for nulo
                    } else {
                        ClarityConfig(
                            projectId, logLevel = LogLevel.Verbose
                        ) // Não passa o userId se for nulo
                    }
                    Clarity.initialize(currentActivity, config)
                } else {
                    result.error(
                        "PRODUCT_ID_NULL", "Specify the project Id for microsoft clarity", null
                    )
                }
            } else {
                // If the current device sdk level isn't supported throw not implemented
                result.notImplemented()
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
