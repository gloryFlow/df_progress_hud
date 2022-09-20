import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'df_progress_hud_platform_interface.dart';

/// An implementation of [DfProgressHudPlatform] that uses method channels.
class MethodChannelDfProgressHud extends DfProgressHudPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('df_progress_hud');


  @override
  Future<void> showToast({String? message}) async {
    // TODO: implement showInfo
    Map<String, dynamic> arguments = Map();
    arguments["message"] = message;

    await methodChannel.invokeMethod<void>('showToast', arguments);
  }

  @override
  Future<void> showError({String? message}) async {
    // TODO: implement showError
    Map<String, dynamic> arguments = Map();
    arguments["message"] = message;

    await methodChannel.invokeMethod<void>('showError', arguments);
  }

  @override
  Future<void> showProgress({double? progress}) async {
    // TODO: implement showProgress
    Map<String, dynamic> arguments = Map();
    arguments["progress"] = progress;

    await methodChannel.invokeMethod<void>('showProgress', arguments);
  }

  @override
  Future<void> showSuccess({String? message}) async {
    // TODO: implement showSuccess
    Map<String, dynamic> arguments = Map();
    arguments["message"] = message;

    await methodChannel.invokeMethod<void>('showSuccess', arguments);
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
  }) async {
    // TODO: implement showHudSettings
    Map<String, dynamic> arguments = Map();
    arguments["dismissTimeInterval"] = dismissTimeInterval;
    arguments["foregroundColor"] = foregroundColor;
    arguments["backgroundColor"] = backgroundColor;
    arguments["cornerRadius"] = cornerRadius;
    arguments["fontSize"] = fontSize;
    arguments["borderColor"] = borderColor;
    arguments["borderWidth"] = borderWidth;

    await methodChannel.invokeMethod<void>('showHudSettings', arguments);
  }

  @override
  Future<void> showStatus({String? message}) async {
    // TODO: implement showStatus
    Map<String, dynamic> arguments = Map();
    arguments["message"] = message;

    await methodChannel.invokeMethod<void>('showStatus', arguments);
  }

  @override
  Future<void> dismiss() async {
    await methodChannel.invokeMethod<void>('dismiss');
  }
}
