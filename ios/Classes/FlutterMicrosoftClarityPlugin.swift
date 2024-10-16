import Flutter
import UIKit
import Clarity

public class FlutterMicrosoftClarityPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "flutter_microsoft_clarity", binaryMessenger: registrar.messenger())
        let instance = FlutterMicrosoftClarityPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "init" {
            if let args = call.arguments as? [String: Any],
                let projectId = args["projectID"] as? String {
                 // Obtenha o userId se estiver presente
                let userId = args["userId"] as? String
                // Inicialize o Microsoft Clarity aqui
                 let clarityConfig: ClarityConfig
            if let userId = userId {
                clarityConfig = ClarityConfig(projectId: projectId, userId: userId, enableSwiftUI_Experimental: true)
            } else {
                clarityConfig = ClarityConfig(projectId: projectId, enableSwiftUI_Experimental: true)
            }
            ClaritySDK.initialize(config: clarityConfig)
                ClaritySDK.initialize(config: clarityConfig)

                result(true)
            } else {
                result(FlutterError(code: "INVALID_ARGUMENT", message: "Project ID is required", details: nil))
            }
       } else if call.method == "getPlatformVersion" {
            result("iOS " + UIDevice.current.systemVersion)
        } else {
            result(FlutterMethodNotImplemented)
        }
    }
}
