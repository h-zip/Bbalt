//
//  JHDebugManager.m
//  Ubtms-boss
//
//  Created by hjh on 17/7/24.
//  Copyright © 2017年 com. All rights reserved.
//

#import "JHDebugManager.h"
#import "JHRequestConstant.h"
@interface JHDebugManager()
@property (nonatomic,strong)UIAlertController* alertVC;
@property (nonatomic,copy)DebugCallback debugCallback;
@end
NSString *requestHost;
@implementation JHDebugManager
-(void)configDebugCallback:(DebugCallback)debugCallback{
    self.debugCallback = debugCallback;
}
-(UIAlertController*)alertVC{
    if (!_alertVC) {
        @WeakObj(self);
        _alertVC = [UIAlertController alertControllerWithTitle:@"网络选择" message:nil preferredStyle:UIAlertControllerStyleAlert];
        
        //UIAlertControllerStyleAlert在中央屏幕。
        //UIAlertControllerStyleActionSheet在屏幕底部。
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"外网生产" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            @StrongObj(self);
            requestHost = ProductHost;
            self.debugCallback();
            
        }];
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"外网测试" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            @StrongObj(self);
            requestHost = DevelopHost;
            self.debugCallback();
        }];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            @StrongObj(self);
            requestHost = DevelopHost;
            self.debugCallback();
            
        }];
        
        UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            @StrongObj(self);
            requestHost = _alertVC.textFields[0].text;
            self.debugCallback();
        }];
        [_alertVC addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.text =@"http://10.67.25.180:8084";
        }];
        [_alertVC addAction:action1];
        [_alertVC addAction:action2];
        [_alertVC addAction:confirmAction];
        [_alertVC addAction:cancelAction];
    }
    return _alertVC;
}
+(instancetype)shareInstance{
    static JHDebugManager *_debugManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _debugManager = [[self alloc]init];
    });
    return _debugManager;
}
-(instancetype)init{
    if (self = [super init]) {
    }
    return self;
}
-(BOOL)debugMode{
    return [[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"] isEqualToString:@"111com.xinxy.temproary"];
}
-(UIAlertController*)chooseHostAlertViewController{
    return self.alertVC;
}

@end
