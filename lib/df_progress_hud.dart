import 'df_progress_hud_platform_interface.dart';

class DfProgressHud {
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
    return DfProgressHudPlatform.instance.showHudSettings(
      dismissTimeInterval: dismissTimeInterval,
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor,
      cornerRadius: cornerRadius,
      fontSize: fontSize,
      borderColor: borderColor,
      borderWidth: borderWidth,
    );
  }

  // loading
  Future<void> showStatus({String? message}) {
    return DfProgressHudPlatform.instance.showStatus(message: message);
  }

  Future<void> showToast({String? message}) {
    return DfProgressHudPlatform.instance.showToast(message: message);
  }

  Future<void> showSuccess({String? message}) {
    return DfProgressHudPlatform.instance.showSuccess(message: message);
  }

  Future<void> showError({String? message}) {
    return DfProgressHudPlatform.instance.showError(message: message);
  }

  Future<void> showProgress({double? progress}) {
    return DfProgressHudPlatform.instance.showProgress(progress: progress);
  }

  // diamiss
  Future<void> dismiss() {
    return DfProgressHudPlatform.instance.dismiss();
  }
}
