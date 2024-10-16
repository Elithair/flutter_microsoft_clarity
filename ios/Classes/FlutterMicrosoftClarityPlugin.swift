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
                // Inicialize o Microsoft Clarity aqui
                let clarityConfig = ClarityConfig(projectId: projectId)
                ClaritySDK.initialize(config: clarityConfig)
              
                result(true)
            } else {
                result(FlutterError(code: "INVALID_ARGUMENT", message: "Project ID is required", details: nil))
            }
        } else {
            result(FlutterMethodNotImplemented)
        }
    }
}
