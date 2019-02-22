//
//  JHHudManager.m
//  Ubtms-boss
//
//  Created by hjh on 17/8/4.
//  Copyright © 2017年 com. All rights reserved.
//

#import "JHHudManager.h"
#import <UIKit/UIKit.h>

@implementation JHHudManager
//static int _HudType = 0;
+(void)initialize{
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
    [SVProgressHUD setBackgroundColor:[[UIColor blackColor]colorWithAlphaComponent:0.7]];
    [SVProgressHUD setFont:[UIFont systemFontOfSize:14.f]];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD setInfoImage:[UIImage reSizeImage:[UIImage new] toSize:CGSizeZero]];
    [SVProgressHUD setCornerRadius:5.f];
}
+(void)sv_show{
    [SVProgressHUD setMinimumSize:(CGSize){0,0}];
    [SVProgressHUD show];
}
+(void)sv_dismiss{
    [SVProgressHUD dismiss];
}
+(void)sv_showInfoWithStatus:(NSString*)status{
    [SVProgressHUD setMinimumSize:(CGSize){280,30}];
    [SVProgressHUD showInfoWithStatus:status];
}
+(void)sv_dismissWithDelay:(NSTimeInterval)delay{
    [SVProgressHUD dismissWithDelay:delay];
}
+(void)sv_dismissWithDelay:(NSTimeInterval)delay CompleteBlock:(CompleteBlock)completeBlock{
    [SVProgressHUD dismissWithDelay:delay completion:completeBlock];
}
+(void)sv_setContainerView:(UIView*)view{
    [SVProgressHUD setContainerView:view];
}

+(void)mb_showSuperview:(UIView*)view{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD* hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.7];
    hud.activityIndicatorColor = [UIColor whiteColor];
    
}
+(void)mb_showWithMessage:(NSString*)message Superview:(UIView*)view{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD* hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = message;
    hud.label.textColor = [UIColor whiteColor];
    hud.label.numberOfLines = 0;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.7];
}

+(void)mb_dismissSuperview:(UIView*)view{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:view animated:YES];
    });
    
}
+(void)mb_dismissWithDelay:(NSTimeInterval)delay Superview:(UIView*)view{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    dispatch_async(dispatch_get_main_queue(), ^{
        [[MBProgressHUD HUDForView:view]hideAnimated:YES afterDelay:delay];
    });
}

+(void)showAlertWithTitle:(NSString*)title Message:(NSString*)message Controller:(UIViewController*)controller{
    @WeakObj(controller);
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        @StrongObj(controller);
        [controller dismissViewControllerAnimated:YES completion:nil];
        
    }];
    //修改title
//    NSMutableAttributedString *alertControllerStr = [[NSMutableAttributedString alloc] initWithString:title];
//    [alertControllerStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#323232"] range:NSMakeRange(0, title.length)];
//    [alertControllerStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, title.length)];
//    [alertController setValue:alertControllerStr forKey:@"attributedTitle"];
//    if ([alertController valueForKey:@"attributedTitle"]) {
    
//    }
    [alertController addAction:okAction];           // A
    [controller presentViewController:alertController animated:YES completion:nil];
}
+(void)showAlertWithTitle:(NSString*)title Message:(NSString*)message BtnStr:(NSString*)btnStr Completeion:(void(^)(void) )completion Controller:(UIViewController*)controller{
    @WeakObj(controller);
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:btnStr style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (completion) {
            completion();
        }
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        @StrongObj(controller);
        [controller dismissViewControllerAnimated:YES completion:nil];
        
    }];
    //修改title
    //    NSMutableAttributedString *alertControllerStr = [[NSMutableAttributedString alloc] initWithString:title];
    //    [alertControllerStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#323232"] range:NSMakeRange(0, title.length)];
    //    [alertControllerStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, title.length)];
    //    [alertController setValue:alertControllerStr forKey:@"attributedTitle"];
    //    if ([alertController valueForKey:@"attributedTitle"]) {
    
    //    }
    [alertController addAction:okAction];
    [alertController addAction:cancelAction];  // A
    [controller presentViewController:alertController animated:YES completion:nil];
}
+(void)showSheetWithTitle:(NSString*)title Message:(NSString*)message BtnStr:(NSString*)btnStr Completeion:(void(^)(void) )completion Controller:(UIViewController*)controller{
    @WeakObj(controller);
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:btnStr style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (completion) {
            completion();
        }
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        @StrongObj(controller);
        [controller dismissViewControllerAnimated:YES completion:nil];
        
    }];
    //修改title
    //    NSMutableAttributedString *alertControllerStr = [[NSMutableAttributedString alloc] initWithString:title];
    //    [alertControllerStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#323232"] range:NSMakeRange(0, title.length)];
    //    [alertControllerStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, title.length)];
    //    [alertController setValue:alertControllerStr forKey:@"attributedTitle"];
    //    if ([alertController valueForKey:@"attributedTitle"]) {
    
    //    }
    [alertController addAction:okAction];
    [alertController addAction:cancelAction];  // A
    [controller presentViewController:alertController animated:YES completion:nil];
}
@end
