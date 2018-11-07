//
//  JHLoginVC.m
//  Xinxy
//
//  Created by bory on 2018/4/25.
//  Copyright © 2018年 hans. All rights reserved.
//

#import "JHLoginVC.h"
@interface JHLoginVC ()

@end

@implementation JHLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    [self configSubView];
    [self configLoginBtn:[self dataCheck]];
    // Do any additional setup after loading the view from its nib.
}
-(void)configUI{
     @TODO("ConfigUI");
//    _accountTF.superview.layer.cornerRadius = MinLayerCornerRadius;
//    _accountTF.accountTF.superview.layer.masksToBounds = YES;
//
//    _accountTF.pswTF.superview.layer.cornerRadius = MinLayerCornerRadius;
//    _accountTF.pswTF.superview.layer.masksToBounds = YES;
//
//    _accountTF.loginBtn.layer.cornerRadius = MinLayerCornerRadius;
//    _accountTF.loginBtn.layer.masksToBounds = YES;
//    _accountTF.loginBtn.userInteractionEnabled = NO;
//
//    [_accountTF setValue:[[UIColor whiteColor]colorWithAlphaComponent:0.73] forKeyPath:@"_placeholderLabel.textColor"];
//    [_accountTF setValue:[UIFont systemFontOfSize:16] forKeyPath:@"_placeholderLabel.font"];
//
//    [_pswTF setValue:[[UIColor whiteColor]colorWithAlphaComponent:0.73] forKeyPath:@"_placeholderLabel.textColor"];
//    [_pswTF setValue:[UIFont systemFontOfSize:16] forKeyPath:@"_placeholderLabel.font"];
}
-(void)configSubView{
    @WeakObj(self);
    RAC(_accountTF,text) = RACObserve(self, account);
    RAC(_pswTF,text) = RACObserve(self, psw);
    [[RACSignal combineLatest:@[_accountTF.rac_textSignal,_pswTF.rac_textSignal]] subscribeNext:^(RACTuple *x) {
        @StrongObj(self);
        self.account = x.first;
        self.psw = x.second;
        [self lengthCheck];
        [self configLoginBtn:[self dataCheck]];
    }];
    _loginBtn.userInteractionEnabled = NO;
    
    [[_loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
        @StrongObj(self);
        @TODO("LoginCallBack");
    }];
    
    [[_registBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
        @StrongObj(self);
        @TODO("RegistCallBack");
    }];
    
    [[_forgotBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
        @StrongObj(self);
        @TODO("RegistCallBack");
    }];
}
-(void)lengthCheck{
    @TODO("AccountLengthFix");
    if (_account.length>11) {
        self.accountTF.text= [self.accountTF.text substringToIndex:11];
    }
}
-(BOOL)dataCheck{
    if ([NSString isEmptyOrWhitespace:_account]) {
        return NO;
    }
    if ([NSString isEmptyOrWhitespace:_psw]) {
        return NO;
    }
    return YES;
}
-(void)configLoginBtn:(BOOL)checkOK{
    @TODO("LoginBtnStyleChange");
    if (checkOK) {
        
    }else{
        
    }
}
-(void)login{
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
