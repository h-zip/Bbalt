//
//  TestVC2.m
//  Bbalt
//
//  Created by bory on 2019/1/25.
//  Copyright © 2019年 hans. All rights reserved.
//

#import "TestVC2.h"
#import "Test2Cell.h"
#import "JHSearchBtnView.h"
#import "JHSearchVC.h"
#import "JHPickerVC.h"
#import "JHInputView.h"
@interface TestVC2 ()
@property(nonatomic,strong)NSArray *cellArr;
@property(nonatomic,strong)NSArray *headerArr;
@property(nonatomic,copy)NSString *str0;
@property(nonatomic,copy)NSString *str1;
@property(nonatomic,copy)NSString *str2;
@property(nonatomic,assign)BOOL b0;
@property(nonatomic,assign)BOOL b1;
@property(nonatomic,assign)BOOL b2;
@property(nonatomic,strong)JHPickerVC *picker;
@property(nonatomic,strong)JHInputView *tView;
@property(nonatomic,strong)NSLayoutConstraint *height;
@end

@implementation TestVC2

#pragma mark - ------------------Setter Getter Methods------------------
-(NSArray*)cellArr{
    if (!_cellArr) {
        @WeakObj(self);
        Test2Cell *cell0 = [[NSBundle mainBundle]loadNibNamed:@"Test2Cell" owner:nil options:nil][0];
        RAC(cell0.mTF,text) = RACObserve(self, str0);
//        self.b0 = YES;
        RAC(cell0,hidden) = RACObserve(self, b0);
        [cell0.mTF.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
            @StrongObj(self);
            self.str0 = x;
//            [self performSelector:NSSelectorFromString(@"setStr1:") withObject:x];
        }];
        [[cell0.mTF rac_signalForControlEvents:UIControlEventEditingDidBegin]subscribeNext:^(__kindof UIControl * _Nullable x) {
            @StrongObj(self);
            [self cancelEditBtnTo:YES];
        }];
        self.picker = [[JHPickerVC alloc]initWithNibName:@"JHPickerVC" bundle:nil];
        self.picker.type = JHPickerTypeYMDHMS;
        [self.picker initYMDHMS];
        self.picker.cancelSelectBlock = ^{
            @StrongObj(self);
            [cell0.mTF resignFirstResponder];
            [self cancelEditBtnTo:NO];
        };
        self.picker.completeSelectBlock = ^(UIButton *sender, NSMutableArray *arr, NSString *text) {
            @StrongObj(self);
            self.str0 = text;
            [cell0.mTF resignFirstResponder];
            [self cancelEditBtnTo:NO];
            NSLog(@"%@",text);
        };
//        [self addChildViewController:self.picker];
        cell0.mTF.inputView = self.picker.view;
        cell0.mTF.inputAccessoryView = [UIView new];
        
        Test2Cell *cell1 = [[NSBundle mainBundle]loadNibNamed:@"Test2Cell" owner:nil options:nil][0];
        RAC(cell1,hidden) = RACObserve(self, b1);
        RAC(cell1.mTF,text) = RACObserve(self, str1);
        [cell1.mTF.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
            @StrongObj(self);
            self.str1 = x;
            //            [self performSelector:NSSelectorFromString(@"setStr1:") withObject:x];
        }];
        Test2Cell *cell2 = [[NSBundle mainBundle]loadNibNamed:@"Test2Cell" owner:nil options:nil][0];
        RAC(cell2,hidden) = RACObserve(self, b2);
        RAC(cell2.mTF,text) = RACObserve(self, str2);
        [cell2.mTF.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
            @StrongObj(self);
            self.str2 = x;
            //            [self performSelector:NSSelectorFromString(@"setStr1:") withObject:x];
        }];
        Test2Cell *cell3 = [[NSBundle mainBundle]loadNibNamed:@"Test2Cell" owner:nil options:nil][0];
        Test2Cell *cell4 = [[NSBundle mainBundle]loadNibNamed:@"Test2Cell" owner:nil options:nil][0];
        Test2Cell *cell5 = [[NSBundle mainBundle]loadNibNamed:@"Test2Cell" owner:nil options:nil][0];
        _cellArr = @[cell0,cell1,cell2,cell3,cell4,cell5];
//        RAC(self.mTableView,backgroundColor) = [[RACSignal combineLatest:@[RACObserve(self, str0),RACObserve(self, str1),RACObserve(self, str2)] reduce:^id (NSString *str1,NSString *str2,NSString *str3){
//            return @(str1.length && str2.length && str3.length);
//        }]map:^id _Nullable(id  _Nullable value) {
//            BOOL b = [value boolValue];
//            return b ? [UIColor greenColor] : [UIColor whiteColor];
//        }];
    }
    return _cellArr;
}
-(NSArray*)headerArr{
    if (!_headerArr) {
        @WeakObj(self);
        UIView *v0 = [[UIView alloc]initWithFrame:(CGRect){0,0,kSCREEN_W,20}];
        v0.backgroundColor = [UIColor brownColor];
        UIGestureRecognizer *gr0 = [[UITapGestureRecognizer alloc]init];
        [[gr0 rac_gestureSignal]subscribeNext:^(__kindof UIGestureRecognizer * _Nullable x) {
            @StrongObj(self);
            self.b0 = !self.b0;
            [self.mTableView reloadData];
        }];
        v0.userInteractionEnabled = YES;
        [v0 addGestureRecognizer:gr0];
        UIView *v1 = [[UIView alloc]initWithFrame:(CGRect){0,0,kSCREEN_W,20}];
        v1.backgroundColor = [UIColor redColor];
        UIGestureRecognizer *gr1 = [[UITapGestureRecognizer alloc]init];
        [[gr1 rac_gestureSignal]subscribeNext:^(__kindof UIGestureRecognizer * _Nullable x) {
            @StrongObj(self);
            self.b1 = !self.b1;
            [self.mTableView reloadData];
        }];
        v1.userInteractionEnabled = YES;
        [v1 addGestureRecognizer:gr1];
        UIView *v2 = [[UIView alloc]initWithFrame:(CGRect){0,0,kSCREEN_W,20}];
        v2.backgroundColor = [UIColor blueColor];
        UIGestureRecognizer *gr2 = [[UITapGestureRecognizer alloc]init];
        [[gr2 rac_gestureSignal]subscribeNext:^(__kindof UIGestureRecognizer * _Nullable x) {
            @StrongObj(self);
            self.b2 = !self.b2;
            [self.mTableView reloadData];
        }];
        v2.userInteractionEnabled = YES;
        [v2 addGestureRecognizer:gr2];
        UIView *v3 = [[UIView alloc]initWithFrame:(CGRect){0,0,kSCREEN_W,20}];
        v0.backgroundColor = [UIColor brownColor];
        UIView *v4 = [[UIView alloc]initWithFrame:(CGRect){0,0,kSCREEN_W,20}];
        v0.backgroundColor = [UIColor brownColor];
        UIView *v5 = [[UIView alloc]initWithFrame:(CGRect){0,0,kSCREEN_W,20}];
        v0.backgroundColor = [UIColor brownColor];
        _headerArr = @[v0,v1,v2,v3,v4,v5];
    }
    return _headerArr;
}
-(UIView*)tView{
    if (!_tView) {
        _tView = [[NSBundle mainBundle]loadNibNamed:@"JHInputView" owner:nil options:nil][0];
        _tView.hidden = NO;
        _tView.frame = (CGRect){0,kTopHeight,kSCREEN_W,kSCREEN_H - 379 - kTopHeight -34};
//        _tView.translatesAutoresizingMaskIntoConstraints = NO;
//        [self.view addSubview:_tView];
//        NSLayoutConstraint *top = JH_Layout(_tView, JH_Top, self.view, JH_Top, 0);
//        NSLayoutConstraint *leading = JH_Layout(_tView, JH_Leading, JH_SafeArea(self.view), JH_Leading, 0);
//        NSLayoutConstraint *trailing = JH_Layout(_tView, JH_Trailing, JH_SafeArea(self.view), JH_Trailing, 0);
////        NSLayoutConstraint *bottom = JH_Layout(_tView, JH_Bottom, self.view, JH_Bottom, 0);
//        NSLayoutConstraint *height = JH_Layout(_tView, JH_Height, nil, JH_NotAnAttribute, kSCREEN_H - 379);
//        NSArray *arr = @[top,leading,trailing,height];
//        self.height = height;
//        JH_AddLayouts(self.view, arr);
    }
    return _tView;
}
#pragma mark - ------------------LifeCycle------------------
-(void)viewDidLoad {
    [super viewDidLoad];
    [self configNavi];
    self.tView.backgroundColor = [UIColor redColor];
//    self.getdataStatus = JHGetDataLoading;
//    self.getdataStatus = JHGetDataError;
    [JHBrowserInstance showWithPicSrcs:@[@"http://bbaltcdn.hanspro.cn/demand262.jpg",
                                         @"http://bbaltcdn.hanspro.cn/demand290.jpg"] InVC:self];
}
-(void)dealloc{
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onKeyboardShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onKeyboardHide:) name:UIKeyboardWillHideNotification object:nil];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.mTableView.backgroundColor = [UIColor yellowColor];
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
-(void)viewWillLayoutSubviews{
//    [super viewWillLayoutSubviews];
}
-(void)viewDidLayoutSubviews{
//    [super viewDidLayoutSubviews];
}

#pragma mark - ------------------Public Methods------------------
-(void)onKeyboardShow:(NSNotification*)notification{
//    NSDictionary *userInfo = [notification userInfo];
//    //DLog(@"%@",userInfo);
//    NSValue *value = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
//    CGFloat keyBoardHeight = value.CGRectValue.size.height;
//    NSNumber *duration = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
//    NSNumber *curve = [userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
////    [self.tView setHeight:(kSCREEN_H - kTopHeight - keyBoardHeight)];
//    [UIView animateWithDuration:[duration doubleValue] delay:0 options:[curve integerValue] animations:^{
////        self.view.frame = (CGRect){0,0-keyBoardHeight,self.view.frame.size.width,self.view.frame.size.height};
//    } completion:^(BOOL finished) {
//         self.height.constant = -keyBoardHeight;
////        keyboardIsShow = YES;
//    }];
}
-(void)onKeyboardHide:(NSNotification*)notification{
//    NSDictionary *userInfo = [notification userInfo];
//    //DLog(@"%@",userInfo);
//    NSNumber *duration = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
//    NSNumber *curve = [userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
//    [UIView animateWithDuration:[duration doubleValue] delay:0 options:[curve integerValue] animations:^{
////        self.view.frame = (CGRect){0,0,self.view.frame.size.width,self.view.frame.size.height};
//    } completion:^(BOOL finished) {
////        keyboardIsShow = NO;
//    }];
}
#pragma mark - ------------------Private Methods------------------
-(void)configNavi{
    @WeakObj(self);
    JHSearchBtnView *view = [[NSBundle mainBundle]loadNibNamed:@"JHSearchBtnView" owner:nil options:nil][0];
//    view.frame = (CGRect){50,kTopHeight - 44,kSCREEN_W-100,44};
    view.translatesAutoresizingMaskIntoConstraints = NO;
    view.btnTapBlock = ^(UIButton *sender) {
//        NSLog(@"1111");
        @StrongObj(self);
        JHSearchVC *vc = [[JHSearchVC alloc]init];
        vc.cancelBlock = ^(UIButton *sender) {
            [self dismissViewControllerAnimated:YES completion:nil];
        };
        [self presentViewController:vc animated:YES completion:^{
            [vc toggleTF];
        }];
    };
    [self.customNavi addSubview:view];
    NSLayoutConstraint *bottom = JH_Layout(view, JH_Bottom, self.customNavi, JH_Bottom, 0);
    NSLayoutConstraint *left = JH_Layout(view, JH_Leading, self.customNavi, JH_Leading, 50);
    NSLayoutConstraint *right = JH_Layout(view, JH_Trailing, self.customNavi, JH_Trailing, -50);
    NSLayoutConstraint *height = JH_Layout(view, JH_Height, nil, JH_NotAnAttribute, kNavBarHeight);
    NSArray *arr = @[bottom,left,right,height];
    JH_AddLayouts(self.customNavi, arr);
}
-(void)initPackage{
    JHTableViewPackage *package = [[JHTableViewPackage alloc]initWithStyle:JHPackageTypeTableGrouped];
    @WeakObj(self);
    package.sectionNumBlock = ^NSInteger(UITableView *tableView) {
        return 5;
    };
    package.rowNumBlock = ^NSInteger(UITableView *tableView, NSInteger section) {
        return 1;
    };
    package.rowHeightBlock = ^CGFloat(UITableView *tableView, NSIndexPath *indexPath) {
        @StrongObj(self);
        BOOL b = false;
        switch (indexPath.section) {
            case 0:
                b = self.b0;
                break;
            case 1:
                b = self.b1;
                break;
            case 2:
                b = self.b2;
                break;
            default:
                break;
        }
        return b ? 0 : 100.f;
    };
    package.cellBlock = ^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath) {
        @StrongObj(self);
        UITableViewCell *cell = self.cellArr[indexPath.section];
        return cell;
    };
    package.rowSelectBlock = ^(UITableView *tableView, NSIndexPath *indexPath) {
        @StrongObj(self);
        [self.tView.mTV becomeFirstResponder];
//        self.tView.hidden = NO;
//        self.str1 = @"12333";
//        self.b0 = !self.b0;
//        [self.mTableView reloadData];
//        NSLog(@"%@",self.str1);
//        [JHHudManager mb_showWithMessage:@"123232323232123232323232123232323232123232323232123232323232123232323232123232323232" Superview:self.view];
//        [JHHudManager mb_dismissWithDelay:2.f Superview:self.view];
    };
    package.sectionHeaderHeightBlock = ^CGFloat(UITableView *tableView, NSInteger section) {
        return 200.f;
    };
    package.sectionHeaderBlock = ^UIView *(UITableView *tableView, NSInteger section) {
        @StrongObj(self);
        UIView *view = self.headerArr[section];
        return view;
    };
    package.sectionFooterHeightBlock = ^CGFloat(UITableView *tableView, NSInteger section) {
        return section ? CGFLOAT_MIN : 200.f;
    };
    package.sectionFooterBlock = ^UIView *(UITableView *tableView, NSInteger section) {
//        @StrongObj(self);
        UIView *view = [UIView new];
        return view;
    };
    self.package = package;
}
-(void)bind{
    
}
#pragma mark - ------------------Key-Value Observer------------------

#pragma mark - ------------------UITableViewDelegate,UITableViewDataSource------------------

#pragma mark - ------------------UICollectionViewDelegate,UICollectionViewDataSource------------------

#pragma mark - ------------------UIScrollViewDelegate------------------

@end
