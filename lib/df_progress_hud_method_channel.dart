import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'df_progress_hud_platform_interface.dart';

/// An implementation of [DfProgressHudPlatform] that uses method channels.
class MethodChannelDfProgressHud extends DfProgressHudPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('df_progress_hud');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<void> showProgressStatus({String? message}) async {
    await methodChannel.invokeMethod<void>('showProgressStatus');
  }

  @override
  Future<void> dismissHud() async {
    await methodChannel.invokeMethod<void>('dismissHud');
  }
}
