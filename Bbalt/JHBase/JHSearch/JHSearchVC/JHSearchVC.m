//
//  JHSearchVC.m
//  Bbalt
//
//  Created by bory on 2019/1/29.
//  Copyright © 2019年 hans. All rights reserved.
//

#import "JHSearchVC.h"
#import "JHSearchTFView.h"
@interface JHSearchVC ()

@end

@implementation JHSearchVC

#pragma mark - ------------------Setter Getter Methods------------------

#pragma mark - ------------------LifeCycle------------------
-(void)viewDidLoad {
    [super viewDidLoad];
    [self configNavi];
}
-(void)dealloc{
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}

#pragma mark - ------------------Public Methods------------------
-(void)toggleTF{
    JHSearchTFView *view = self.customNavi.subviews[0];
    [view.searchTF becomeFirstResponder];
}
#pragma mark - ------------------Private Methods------------------
-(void)configNavi{
    @WeakObj(self);
    JHSearchTFView *view = [[NSBundle mainBundle]loadNibNamed:@"JHSearchTFView" owner:nil options:nil][0];
    view.translatesAutoresizingMaskIntoConstraints = NO;
//    view.frame = (CGRect){20,kTopHeight - 44,kSCREEN_W-70,44};
    [self.customNavi addSubview:view];
    UIButton *cancel = [UIButton buttonWithType:UIButtonTypeCustom];
    cancel.translatesAutoresizingMaskIntoConstraints = NO;
//    cancel.frame = (CGRect){kSCREEN_W-50,kTopHeight - 44,50,44};
    [cancel setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cancel setTitle:@"取消" forState:UIControlStateNormal];
    [[cancel rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
        @StrongObj(self);
        [view.searchTF resignFirstResponder];
        if (self.cancelBlock) {
            self.cancelBlock(x);
        }
    }];
    [self.customNavi addSubview:cancel];
    NSLayoutConstraint *bottom0 = JH_Layout(view, JH_Bottom, self.customNavi, JH_Bottom, 0);
    NSLayoutConstraint *left0 = JH_Layout(view, JH_Leading, self.customNavi, JH_Leading, 20);
    NSLayoutConstraint *right0 = JH_Layout(view, JH_Trailing, cancel, JH_Leading, -10);
    NSLayoutConstraint *height0 = JH_Layout(view, JH_Height, nil, JH_NotAnAttribute, kNavBarHeight);
    NSArray *arr0 = @[bottom0,left0,right0,height0];
    JH_AddLayouts(self.customNavi, arr0);
    NSLayoutConstraint *bottom1 = JH_Layout(cancel, JH_Bottom, view, JH_Bottom, 0);
    NSLayoutConstraint *right1 = JH_Layout(cancel, JH_Trailing,self.customNavi, JH_Trailing, -20);
    NSLayoutConstraint *height1 = JH_Layout(cancel, JH_Height, view, JH_Height, 0);
    NSLayoutConstraint *width1 = JH_Layout(cancel, JH_Width, nil, JH_NotAnAttribute, 50);
    NSArray *arr1 = @[bottom1,right1,height1,width1];
    JH_AddLayouts(self.customNavi, arr1);
}
#pragma mark - ------------------Key-Value Observer------------------

#pragma mark - ------------------UITableViewDelegate,UITableViewDataSource------------------

#pragma mark - ------------------UICollectionViewDelegate,UICollectionViewDataSource------------------

#pragma mark - ------------------UIScrollViewDelegate------------------

@end
