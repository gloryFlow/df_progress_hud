
import 'df_progress_hud_platform_interface.dart';

class DfProgressHud {
  Future<String?> getPlatformVersion() {
    return DfProgressHudPlatform.instance.getPlatformVersion();
  }

  Future<void> showToastStatus({String? message}) {
    return DfProgressHudPlatform.instance.showProgressStatus(message: message);
  }

  Future<void> dismiss() {
    return DfProgressHudPlatform.instance.dismissHud();
  }
}
