//
//  JHHudManager.h
//  Ubtms-boss
//
//  Created by hjh on 17/8/4.
//  Copyright © 2017年 com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SVProgressHUD/SVProgressHUD.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import "UIColor+Hex.h"
typedef void (^CompleteBlock)(void);
@interface JHHudManager : NSObject
+(void)sv_show;
+(void)sv_dismiss;
+(void)sv_showInfoWithStatus:(NSString*)status;
+(void)sv_dismissWithDelay:(NSTimeInterval)delay;
+(void)sv_dismissWithDelay:(NSTimeInterval)delay CompleteBlock:(CompleteBlock)completeBlock;
+(void)sv_setContainerView:(UIView*)view;

+(void)mb_showSuperview:(UIView*)view;
+(void)mb_showWithMessage:(NSString*)message Superview:(UIView*)view;

+(void)mb_dismissSuperview:(UIView*)view;
+(void)mb_dismissWithDelay:(NSTimeInterval)delay Superview:(UIView*)view;

+(void)showAlertWithTitle:(NSString*)title Message:(NSString*)message Controller:(UIViewController*)controller;
+(void)showAlertWithTitle:(NSString*)title Message:(NSString*)message BtnStr:(NSString*)btnStr Completeion:(void(^)(void) )completion Controller:(UIViewController*)controller;
+(void)showSheetWithTitle:(NSString*)title Message:(NSString*)message BtnStr:(NSString*)btnStr Completeion:(void(^)(void) )completion Controller:(UIViewController*)controller;
@end
