//
//  JHRegistAVC.m
//  Xinxy
//
//  Created by bory on 2018/4/26.
//  Copyright © 2018年 hans. All rights reserved.
//

#import "JHRegistAVC.h"

@interface JHRegistAVC ()

@end

@implementation JHRegistAVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    [self configSubView];
    [self configNextBtn:[self dataCheck]];
    // Do any additional setup after loading the view from its nib.
}
-(void)configUI{
    @TODO("ConfigUI");
//    self.verificateBtn.layer.borderColor = [UIColor whiteColor].CGColor;
//    self.verificateBtn.layer.borderWidth = 1.f;
//    self.verificateBtn.layer.cornerRadius = MinLayerCornerRadius;
//    self.verificateBtn.layer.masksToBounds = YES;
//
//    self.verificateBtn.superview.layer.cornerRadius = MinLayerCornerRadius;
//    self.verificateBtn.superview.layer.masksToBounds = YES;
//
//    self.verificateTF.superview.layer.cornerRadius = MinLayerCornerRadius;
//    self.verificateTF.superview.layer.masksToBounds = YES;
//
//    self.nextBtn.layer.cornerRadius = MinLayerCornerRadius;
//    self.nextBtn.layer.masksToBounds = YES;
//    self.nextBtn.userInteractionEnabled = NO;
//
//    [self.verificateTF setValue:AccountNullUIColor forKeyPath:@"_placeholderLabel.textColor"];
//    [self.verificateTF setValue:AccountUIFont forKeyPath:@"_placeholderLabel.font"];
//
//    [self.phoneTF setValue:AccountNullUIColor forKeyPath:@"_placeholderLabel.textColor"];
//    [self.phoneTF setValue:AccountUIFont forKeyPath:@"_placeholderLabel.font"];
}
-(void)configSubView{
    @WeakObj(self);
    RAC(_phoneTF,text) = RACObserve(self, phone);
    RAC(_verificateTF,text) = RACObserve(self, verificate);
    [[RACSignal combineLatest:@[_phoneTF.rac_textSignal,_verificateTF.rac_textSignal]] subscribeNext:^(RACTuple *x) {
        @StrongObj(self);
        self.phone = x.first;
        self.verificate = x.second;
        [self lengthCheck];
        [self configNextBtn:[self dataCheck]];
    }];
    [[self.verificateBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
        @StrongObj(self);
        [self getVerificate];
    }];
    [[self.nextBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
        @StrongObj(self);
        [self checkVerificate];
    }];
}
-(void)lengthCheck{
    @TODO("AccountLengthFix");
    if (_phone.length>11) {
        self.phoneTF.text= [self.phoneTF.text substringToIndex:11];
    }
}
-(BOOL)dataCheck{
    if ([NSString isEmptyOrWhitespace:_phone]) {
        return NO;
    }
    if ([NSString isEmptyOrWhitespace:_verificate]) {
        return NO;
    }
    return YES;
}
-(BOOL)phoneCheck{
    @TODO("phoneCheck");
    if (_phone.length!=11) {
        [JHHudManager sv_showInfoWithStatus:@"请输入11位手机号"];
        [JHHudManager sv_dismissWithDelay:1.f];
        return NO;
    }
    return YES;
}
-(void)configNextBtn:(BOOL)checkOK{
    @TODO("NextBtnStyleChange");
    if (checkOK) {
        
    }else{
        
    }
}
-(void)checkVerificate{
    @TODO("checkVerificateCallback");
    if (![self phoneCheck]) {
        return;
    }
    
}
-(void)getVerificate{
    @TODO("getVerificateCallback");
    if (![self phoneCheck]) {
        return;
    }
}
- (void)VerifiedCodeCountDown{
    @WeakObj(self);
    __block int timeout = 60; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        @StrongObj(self);
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self.verificateBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
                self.verificateBtn.userInteractionEnabled = YES;
            });
        }else{
            int seconds = timeout % 60;
            if (seconds == 0) {
                seconds = 60;
            }
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                @StrongObj(self);
                //设置界面的按钮显示 根据自己需求设置
                //NSLog(@"____%@",strTime);
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:0];
                [self.verificateBtn setTitle:[NSString stringWithFormat:@"%@秒后重新发送",strTime] forState:UIControlStateNormal];
                self.verificateBtn.titleLabel.font = [UIFont systemFontOfSize:11];
                [UIView commitAnimations];
                self.verificateBtn.userInteractionEnabled = NO;
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
