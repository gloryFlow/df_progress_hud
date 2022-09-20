#import "DfProgressHudPlugin.h"
#import "SVProgressHUD.h"

@implementation DfProgressHudPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"df_progress_hud"
            binaryMessenger:[registrar messenger]];
  DfProgressHudPlugin* instance = [[DfProgressHudPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else if ([@"showProgressStatus" isEqualToString:call.method]) {
    id arguments = call.arguments;
    [SVProgressHUD showWithStatus:arguments];
    result(@"show");
  }  else if ([@"dismissHud" isEqualToString:call.method]) {
     [SVProgressHUD dismiss];
     result(@"show");
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
