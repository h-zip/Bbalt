//
//  JHBaseVC.m
//  Ubtms-boss
//
//  Created by hjh on 17/6/22.
//  Copyright © 2017年 com. All rights reserved.
//

#import "JHBaseVC.h"

@interface JHBaseVC ()<UIGestureRecognizerDelegate>

@end

@implementation JHBaseVC

-(UIButton*)cancelEditBtn{
    if (!_cancelEditBtn) {
        _cancelEditBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancelEditBtn.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.1];
        _cancelEditBtn.hidden = YES;
        _cancelEditBtn.translatesAutoresizingMaskIntoConstraints = NO;
        @WeakObj(self);
        [[_cancelEditBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
            @StrongObj(self);
            [self cancelEditBtnTo:NO];
            [self handleFirstResponder];
        }];
        [self.view addSubview:_cancelEditBtn];
        NSLayoutConstraint *top = JH_Layout(_cancelEditBtn, JH_Top, self.view, JH_Top, 0);
        NSLayoutConstraint *left = JH_Layout(_cancelEditBtn, JH_Leading, JH_SafeArea(self.view), JH_Leading, 0);
        NSLayoutConstraint *right = JH_Layout(_cancelEditBtn, JH_Trailing, JH_SafeArea(self.view), JH_Trailing, 0);
        NSLayoutConstraint *bottom = JH_Layout(_cancelEditBtn, JH_Bottom, JH_SafeArea(self.view), JH_Bottom, 0);
        NSArray *arr = @[top,left,right,bottom];
        JH_AddLayouts(self.view, arr);
    }
    return _cancelEditBtn;
}
-(void)cancelEditBtnTo:(BOOL)show{
    self.cancelEditBtn.hidden = !show;
}
-(void)initCustomNavi{
//    CGRect frame = (CGRect){0,0,kSCREEN_W,kTopHeight};
    self.customNavi = [UIView new];
    self.customNavi.backgroundColor = [UIColor whiteColor];
    self.customNavi.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.customNavi];
    NSLayoutConstraint *top = JH_Layout(self.customNavi, JH_Top, self.view, JH_Top, 0);
    NSLayoutConstraint *left = JH_Layout(self.customNavi, JH_Leading, JH_SafeArea(self.view), JH_Leading, 0);
    NSLayoutConstraint *right = JH_Layout(self.customNavi, JH_Trailing, JH_SafeArea(self.view), JH_Trailing, 0);
    NSLayoutConstraint *height = JH_Layout(self.customNavi, JH_Height, nil, JH_NotAnAttribute, kTopHeight);
    NSArray *arr = @[top,left,right,height];
    JH_AddLayouts(self.view, arr);
}

-(void)hideCustomNavi{
    self.customNavi.hidden = YES;
}

-(void)showCustomNavi{
    self.customNavi.hidden = NO;
}

-(void)setCustomNaviAlpha:(CGFloat)alpha{
    self.customNavi.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:alpha];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.navigationController setNavigationBarHidden:YES];
    [self initCustomNavi];
}
-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    [self.view bringSubviewToFront:self.customNavi];
}
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self handleFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)handleFirstResponder{
    [self.view endEditing:YES];
}
+(instancetype)initFromXIB{
    return [[self alloc]initWithNibName:NSStringFromClass([self class]) bundle:nil];
}
@end
