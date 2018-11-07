//
//  JHRegistBVC.m
//  Xinxy
//
//  Created by bory on 2018/4/26.
//  Copyright © 2018年 hans. All rights reserved.
//

#import "JHRegistBVC.h"

@interface JHRegistBVC ()

@end

@implementation JHRegistBVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    [self configSubView];
    [self configSendBtn:[self dataCheck]];
    // Do any additional setup after loading the view from its nib.
}

-(void)configUI{
    @TODO("ConfigUI");
//    self.PswTF.superview.layer.cornerRadius = MinLayerCornerRadius;
//    self.PswTF.superview.layer.masksToBounds = YES;
//
//    self.confirmTF.superview.layer.cornerRadius = MinLayerCornerRadius;
//    self.confirmTF.superview.layer.masksToBounds = YES;
//
//    self.registBtn.layer.cornerRadius = MinLayerCornerRadius;
//    self.registBtn.layer.masksToBounds = YES;
//    self.registBtn.userInteractionEnabled = NO;
//
//    [self.PswTF setValue:AccountNullUIColor forKeyPath:@"_placeholderLabel.textColor"];
//    [self.PswTF setValue:AccountUIFont forKeyPath:@"_placeholderLabel.font"];
//
//    [self.confirmTF setValue:AccountNullUIColor forKeyPath:@"_placeholderLabel.textColor"];
//    [self.confirmTF setValue:AccountUIFont forKeyPath:@"_placeholderLabel.font"];
}
-(void)configSubView{
    @WeakObj(self);
    RAC(_PswTF,text) = RACObserve(self, psw);
    RAC(_confirmTF,text) = RACObserve(self, confirmPsw);
    [[RACSignal combineLatest:@[_PswTF.rac_textSignal,_confirmTF.rac_textSignal]] subscribeNext:^(RACTuple *x) {
        @StrongObj(self);
        self.psw = x.first;
        self.confirmPsw = x.second;
        [self lengthCheck];
        [self configSendBtn:[self dataCheck]];
    }];
    [[self.sendBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
        @StrongObj(self);
        [self sendRequest];
    }];
}
-(void)configSendBtn:(BOOL)checkOK{
    @TODO("SendBtnStyleChange");
    if (checkOK) {
        
    }else{
        
    }
}
-(void)lengthCheck{
    @TODO("lengthCheck");
}

-(BOOL)samePswCheck{
    if (![_psw isEqualToString:_confirmPsw]) {
        [JHHudManager sv_showInfoWithStatus:@"两次密码输入不一致"];
        [JHHudManager sv_dismissWithDelay:1.f];
        return NO;
    }
    return YES;
}
-(BOOL)dataCheck{
    if ([NSString isEmptyOrWhitespace:_psw]) {
        return NO;
    }
    if ([NSString isEmptyOrWhitespace:_confirmPsw]) {
        return NO;
    }
    return YES;
}
-(void)sendRequest{
    @TODO("sendRequest");
    if (![self samePswCheck]) {
        return;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
