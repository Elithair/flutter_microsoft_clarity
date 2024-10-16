import 'package:flutter_microsoft_clarity/flutter_microsoft_clarity_method_channel.dart';
import 'package:flutter_microsoft_clarity/flutter_microsoft_clarity_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterMicrosoftClarityPlatform
    with MockPlatformInterfaceMixin
    implements FlutterMicrosoftClarityPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future init({required String projectID, required String userID}) {
    throw UnimplementedError();
  }
}

void main() {
  final FlutterMicrosoftClarityPlatform initialPlatform =
      FlutterMicrosoftClarityPlatform.instance;

  test('$MethodChannelFlutterMicrosoftClarity is the default instance', () {
    expect(
        initialPlatform, isInstanceOf<MethodChannelFlutterMicrosoftClarity>());
  });
}
