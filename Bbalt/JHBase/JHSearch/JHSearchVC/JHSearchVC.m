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
    view.frame = (CGRect){20,kTopHeight - 44,kSCREEN_W-70,44};
    [self.customNavi addSubview:view];
    UIButton *cancel = [UIButton buttonWithType:UIButtonTypeCustom];
    cancel.frame = (CGRect){kSCREEN_W-50,kTopHeight - 44,50,44};
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
}
#pragma mark - ------------------Key-Value Observer------------------

#pragma mark - ------------------UITableViewDelegate,UITableViewDataSource------------------

#pragma mark - ------------------UICollectionViewDelegate,UICollectionViewDataSource------------------

#pragma mark - ------------------UIScrollViewDelegate------------------

@end
