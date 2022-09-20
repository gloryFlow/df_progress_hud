import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:df_progress_hud/df_progress_hud_method_channel.dart';

void main() {
  MethodChannelDfProgressHud platform = MethodChannelDfProgressHud();
  const MethodChannel channel = MethodChannel('df_progress_hud');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
