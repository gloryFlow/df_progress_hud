import 'package:flutter_test/flutter_test.dart';
import 'package:df_progress_hud/df_progress_hud.dart';
import 'package:df_progress_hud/df_progress_hud_platform_interface.dart';
import 'package:df_progress_hud/df_progress_hud_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDfProgressHudPlatform
    with MockPlatformInterfaceMixin
    implements DfProgressHudPlatform {

  @override
  Future<void> dismiss() {
    // TODO: implement dismissHud
    throw UnimplementedError();
  }

  @override
  Future<void> showToast({String? message}) {
    // TODO: implement showInfo
    throw UnimplementedError();
  }

  @override
  Future<void> showError({String? message}) {
    // TODO: implement showError
    throw UnimplementedError();
  }

  @override
  Future<void> showProgress({double? progress}) {
    // TODO: implement showProgress
    throw UnimplementedError();
  }

  @override
  Future<void> showSuccess({String? message}) {
    // TODO: implement showSuccess
    throw UnimplementedError();
  }

  @override
  Future<void> showHudSettings({
    int? dismissTimeInterval,
    String? foregroundColor,
    String? backgroundColor,
    double? cornerRadius,
    double? fontSize,
    String? borderColor,
    double? borderWidth,
  }) {
    // TODO: implement showHudSettings
    throw UnimplementedError();
  }

  @override
  Future<void> showStatus({String? message}) {
    // TODO: implement showStatus
    throw UnimplementedError();
  }
}

void main() {
  final DfProgressHudPlatform initialPlatform = DfProgressHudPlatform.instance;

  test('$MethodChannelDfProgressHud is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDfProgressHud>());
  });

  test('getPlatformVersion', () async {
    DfProgressHud dfProgressHudPlugin = DfProgressHud();
    MockDfProgressHudPlatform fakePlatform = MockDfProgressHudPlatform();
    DfProgressHudPlatform.instance = fakePlatform;

    // expect(await dfProgressHudPlugin.getPlatformVersion(), '42');
  });
}
