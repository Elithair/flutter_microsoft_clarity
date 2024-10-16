import 'package:flutter_microsoft_clarity/flutter_microsoft_clarity_platform_interface.dart';

class FlutterMicrosoftClarity {
  Future<String?> getPlatformVersion() {
    return FlutterMicrosoftClarityPlatform.instance.getPlatformVersion();
  }

  Future<void> init({String? projectId}) async {
    return FlutterMicrosoftClarityPlatform.instance
        .init(projectID: projectId ?? "");
  }
}
