import 'package:flutter_test/flutter_test.dart';
import 'package:df_progress_hud/df_progress_hud.dart';
import 'package:df_progress_hud/df_progress_hud_platform_interface.dart';
import 'package:df_progress_hud/df_progress_hud_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDfProgressHudPlatform 
    with MockPlatformInterfaceMixin
    implements DfProgressHudPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<void> showProgressStatus({String? message}) {
    // TODO: implement showProgressStatue
    throw UnimplementedError();
  }

  @override
  Future<void> dismissHud() {
    // TODO: implement dismissHud
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
  
    expect(await dfProgressHudPlugin.getPlatformVersion(), '42');
  });
}
