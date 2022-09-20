//
//  UIColor+hudHex.h
//  df_progress_hud
//
//  Created by Dface WD on 2022/9/20.
//

#import <UIKit/UIKit.h>

@interface UIColor (hudHex)

/**
 传入16进制的hex，返回颜色UIColor
 
 @param hexString 16进制
 @return UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;

/**
 传入16进制的hex，返回颜色UIColor
 
 @param hexString 16进制
 @param alpha 透明度
 @return UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

@end
