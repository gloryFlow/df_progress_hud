import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'df_progress_hud_method_channel.dart';

abstract class DfProgressHudPlatform extends PlatformInterface {
  /// Constructs a DfProgressHudPlatform.
  DfProgressHudPlatform() : super(token: _token);

  static final Object _token = Object();

  static DfProgressHudPlatform _instance = MethodChannelDfProgressHud();

  /// The default instance of [DfProgressHudPlatform] to use.
  ///
  /// Defaults to [MethodChannelDfProgressHud].
  static DfProgressHudPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DfProgressHudPlatform] when
  /// they register themselves.
  static set instance(DfProgressHudPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> showProgressStatus({String? message}) {
    throw UnimplementedError('showProgressStatus() has not been implemented.');
  }

  Future<void> dismissHud() {
    throw UnimplementedError('dismissHud() has not been implemented.');
  }
}
