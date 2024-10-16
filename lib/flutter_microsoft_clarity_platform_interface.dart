import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_microsoft_clarity_method_channel.dart';

abstract class FlutterMicrosoftClarityPlatform extends PlatformInterface {
  /// Constructs a FlutterMicrosoftClarityPlatform.
  FlutterMicrosoftClarityPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterMicrosoftClarityPlatform _instance =
      MethodChannelFlutterMicrosoftClarity();

  /// The default instance of [FlutterMicrosoftClarityPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterMicrosoftClarity].
  static FlutterMicrosoftClarityPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterMicrosoftClarityPlatform] when
  /// they register themselves.
  static set instance(FlutterMicrosoftClarityPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future init({required String projectID}) {
    throw UnimplementedError(
        'clarity initialisation has not been implemented.');
  }
}
