#import "DfProgressHudPlugin.h"
#import "SVProgressHUD.h"
#import "UIColor+hudHex.h"

@implementation DfProgressHudPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"df_progress_hud"
                                     binaryMessenger:[registrar messenger]];
    DfProgressHudPlugin* instance = [[DfProgressHudPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"showHudSettings" isEqualToString:call.method]) {
        id arguments = call.arguments;
        
        if (arguments && [arguments isKindOfClass:[NSDictionary class]]) {
            NSDictionary *aparams = (NSDictionary *)arguments;
            
            NSNumber *dismissTimeInterval = aparams[@"dismissTimeInterval"];
            NSString *foregroundColor = aparams[@"foregroundColor"];
            NSString *backgroundColor = aparams[@"backgroundColor"];
            NSNumber *cornerRadius = aparams[@"cornerRadius"];
            NSNumber *fontSize = aparams[@"fontSize"];
            NSString *borderColor = aparams[@"borderColor"];
            NSNumber *borderWidth = aparams[@"borderWidth"];
            
            //修改SV样式
            [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
            [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
            
            if (foregroundColor && [foregroundColor isKindOfClass:[NSString class]] && foregroundColor.length > 0) {
                UIColor *foreGColor = [UIColor colorWithHexString:foregroundColor];
                [SVProgressHUD setForegroundColor:foreGColor];
            }
            
            if (backgroundColor && [backgroundColor isKindOfClass:[NSString class]] && backgroundColor.length > 0) {
                UIColor *bgColor = [UIColor colorWithHexString:backgroundColor];
                [SVProgressHUD setBackgroundColor:bgColor];
            }
            
            if (borderWidth && [borderWidth isKindOfClass:[NSNumber class]]) {
                [SVProgressHUD setBorderWidth:borderWidth.floatValue];
            }
            
            if (borderColor && [borderColor isKindOfClass:[NSString class]] && borderColor.length > 0) {
                UIColor *bderColor = [UIColor colorWithHexString:borderColor];
                [SVProgressHUD setBorderColor:bderColor];
            }
            
            if (fontSize && [fontSize isKindOfClass:[NSNumber class]]) {
                [SVProgressHUD setFont:[UIFont systemFontOfSize:fontSize.floatValue]];
            }
            
            if (cornerRadius && [cornerRadius isKindOfClass:[NSNumber class]]) {
                [SVProgressHUD setCornerRadius:cornerRadius.floatValue];
            }
            
            if (dismissTimeInterval && [dismissTimeInterval isKindOfClass:[NSNumber class]]) {
                [SVProgressHUD setMinimumDismissTimeInterval:dismissTimeInterval.intValue];
            }
        }
        result(@YES);
    } else if ([@"showStatus" isEqualToString:call.method]) {
        id arguments = call.arguments;
        
        if (arguments && [arguments isKindOfClass:[NSDictionary class]]) {
            NSDictionary *aparams = (NSDictionary *)arguments;
            NSString *message = aparams[@"message"];
            if (message && [message isKindOfClass:[NSString class]] && message.length > 0) {
                [SVProgressHUD showWithStatus:message];
            }
        }
        result(@YES);
    } else if ([@"showSuccess" isEqualToString:call.method]) {
        id arguments = call.arguments;
        
        if (arguments && [arguments isKindOfClass:[NSDictionary class]]) {
            NSDictionary *aparams = (NSDictionary *)arguments;
            NSString *message = aparams[@"message"];
            if (message && [message isKindOfClass:[NSString class]] && message.length > 0) {
                [SVProgressHUD showSuccessWithStatus:message];
            }
        }
        result(@YES);
    } else if ([@"showToast" isEqualToString:call.method]) {
        id arguments = call.arguments;
        
        if (arguments && [arguments isKindOfClass:[NSDictionary class]]) {
            NSDictionary *aparams = (NSDictionary *)arguments;
            NSString *message = aparams[@"message"];
            if (message && [message isKindOfClass:[NSString class]] && message.length > 0) {
                [SVProgressHUD showImage:nil status:message];
            }
        }
        result(@YES);
    } else if ([@"showError" isEqualToString:call.method]) {
        id arguments = call.arguments;
        
        if (arguments && [arguments isKindOfClass:[NSDictionary class]]) {
            NSDictionary *aparams = (NSDictionary *)arguments;
            NSString *message = aparams[@"message"];
            if (message && [message isKindOfClass:[NSString class]] && message.length > 0) {
                [SVProgressHUD showErrorWithStatus:message];
            }
        }
        result(@YES);
    } else if ([@"showProgress" isEqualToString:call.method]) {
        id arguments = call.arguments;
        
        if (arguments && [arguments isKindOfClass:[NSDictionary class]]) {
            NSDictionary *aparams = (NSDictionary *)arguments;
            NSNumber *progress = aparams[@"progress"];
            if (progress && [progress isKindOfClass:[NSNumber class]]) {
                [SVProgressHUD showProgress:progress.floatValue];
            }
        }
        result(@YES);
    } else if ([@"dismiss" isEqualToString:call.method]) {
        [SVProgressHUD dismiss];
        result(@YES);
    } else {
        result(FlutterMethodNotImplemented);
    }
}

@end
