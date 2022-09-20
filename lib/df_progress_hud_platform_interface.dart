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

  /// backgroundColor、backgroundColor为ffbbcc这样颜色字符串
  Future<void> showHudSettings({
    int? dismissTimeInterval,
    String? foregroundColor,
    String? backgroundColor,
    double? cornerRadius,
    double? fontSize,
    String? borderColor,
    double? borderWidth,
  }) {
    throw UnimplementedError('showProgressStatus() has not been implemented.');
  }

  Future<void> showStatus({String? message}) {
    throw UnimplementedError('showProgressStatus() has not been implemented.');
  }

  Future<void> showToast({String? message}) {
    throw UnimplementedError('showToast() has not been implemented.');
  }

  Future<void> showSuccess({String? message}) {
    throw UnimplementedError('showSuccess() has not been implemented.');
  }

  Future<void> showError({String? message}) {
    throw UnimplementedError('showError() has not been implemented.');
  }

  Future<void> showProgress({double? progress}) {
    throw UnimplementedError('showProgress() has not been implemented.');
  }

  Future<void> dismiss() {
    throw UnimplementedError('dismissHud() has not been implemented.');
  }
}
