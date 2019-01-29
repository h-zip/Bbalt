//
//  TestVC2.m
//  Bbalt
//
//  Created by bory on 2019/1/25.
//  Copyright © 2019年 hans. All rights reserved.
//

#import "TestVC2.h"
#import "Test2Cell.h"
#import <SDWebImage/UIImageView+WebCache.h>
@interface TestVC2 ()
@property(nonatomic,strong)NSArray *cellArr;
@property(nonatomic,strong)NSArray *headerArr;
@property(nonatomic,copy)NSString *str0;
@property(nonatomic,copy)NSString *str1;
@property(nonatomic,copy)NSString *str2;
@property(nonatomic,assign)BOOL b0;
@property(nonatomic,assign)BOOL b1;
@property(nonatomic,assign)BOOL b2;
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
        _cellArr = @[cell0,cell1,cell2];
        RAC(self.mTableView,backgroundColor) = [[RACSignal combineLatest:@[RACObserve(self, str0),RACObserve(self, str1),RACObserve(self, str2)] reduce:^id (NSString *str1,NSString *str2,NSString *str3){
            return @(str1.length && str2.length && str3.length);
        }]map:^id _Nullable(id  _Nullable value) {
            BOOL b = [value boolValue];
            return b ? [UIColor greenColor] : [UIColor whiteColor];
        }];
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
        _headerArr = @[v0,v1,v2];
    }
    return _headerArr;
}
#pragma mark - ------------------LifeCycle------------------
-(void)viewDidLoad {
    [super viewDidLoad];
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

#pragma mark - ------------------Private Methods------------------
-(void)initTableView{
    @WeakObj(self);
    self.tableViewStyle = UITableViewStyleGrouped;
    self.sectionNumBlock = ^NSInteger(UITableView *tableView) {
        return 3;
    };
    self.rowNumBlock = ^NSInteger(UITableView *tableView, NSInteger section) {
        return 1;
    };
    self.rowHeightBlock = ^CGFloat(UITableView *tableView, NSIndexPath *indexPath) {
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
        return b ? 0 : 40.f;
    };
    self.cellBlock = ^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath) {
        @StrongObj(self);
        UITableViewCell *cell = self.cellArr[indexPath.section];
        return cell;
    };
    self.rowSelectBlock = ^(UITableView *tableView, NSIndexPath *indexPath) {
        @StrongObj(self);
//        self.str1 = @"12333";
//        self.b0 = !self.b0;
//        [self.mTableView reloadData];
//        NSLog(@"%@",self.str1);
        [JHHudManager mb_showWithMessage:@"123232323232123232323232123232323232123232323232123232323232123232323232123232323232" Superview:self.view];
        [JHHudManager mb_dismissWithDelay:2.f Superview:self.view];
    };
    self.sectionHeaderHeightBlock = ^CGFloat(UITableView *tableView, NSInteger section) {
        return 20.f;
    };
    self.sectionHeaderBlock = ^UIView *(UITableView *tableView, NSInteger section) {
        @StrongObj(self);
        UIView *view = self.headerArr[section];
        return view;
    };
    self.sectionFooterHeightBlock = ^CGFloat(UITableView *tableView, NSInteger section) {
        return section ? CGFLOAT_MIN : 20.f;
    };
    self.sectionFooterBlock = ^UIView *(UITableView *tableView, NSInteger section) {
//        @StrongObj(self);
        UIView *view = [UIView new];
        return view;
    };
}
-(void)bind{
    
}
#pragma mark - ------------------Key-Value Observer------------------

#pragma mark - ------------------UITableViewDelegate,UITableViewDataSource------------------

#pragma mark - ------------------UICollectionViewDelegate,UICollectionViewDataSource------------------

#pragma mark - ------------------UIScrollViewDelegate------------------

@end
