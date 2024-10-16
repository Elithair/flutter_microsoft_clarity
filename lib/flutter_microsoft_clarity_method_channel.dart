import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_microsoft_clarity_platform_interface.dart';

/// An implementation of [FlutterMicrosoftClarityPlatform] that uses method channels.
class MethodChannelFlutterMicrosoftClarity
    extends FlutterMicrosoftClarityPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_microsoft_clarity');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future init({required String projectID}) async {
    return await methodChannel
        .invokeMethod('init', <String, dynamic>{'projectID': projectID});
  }
}
