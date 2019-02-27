//
//  JHRequestLogVC.m
//  Bbalt
//
//  Created by bory on 2019/2/27.
//  Copyright © 2019年 hans. All rights reserved.
//

#import "JHRequestLogVC.h"
#import "JHRequestLogCell.h"
@interface JHRequestLogVC ()

@end

@implementation JHRequestLogVC

#pragma mark - ------------------Setter Getter Methods------------------

#pragma mark - ------------------LifeCycle------------------
-(void)viewDidLoad {
    [super viewDidLoad];
    [self initPackage];
    [self layoutMainView];
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
-(void)initPackage{
    @WeakObj(self);
    self.package = [[JHTableViewPackage alloc]initWithStyle:JHPackageTypeTablePlain];
    self.package.tableView.estimatedRowHeight = 50.f;
    [self.package.tableView registerNib:[UINib nibWithNibName:@"JHRequestLogCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"JHRequestLogCell"];
    self.package.sectionNumBlock = ^NSInteger(UITableView *tableView) {
        return 1;
    };
    self.package.rowNumBlock = ^NSInteger(UITableView *tableView, NSInteger section) {
        return JHDebugInstance.logArr.count;
    };
    self.package.cellBlock = ^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath) {
//        @StrongObj(self);
        static NSString* identifer = @"JHRequestLogCell";
        JHRequestLogCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer forIndexPath:indexPath];
        if (!cell) {
            cell = [[NSBundle mainBundle]loadNibNamed:identifer owner:nil options:nil][0];
        }
        [cell configCell:JHDebugInstance.logArr[indexPath.row]];
        return cell;
    };
    self.package.rowSelectBlock = ^(UITableView *tableView, NSIndexPath *indexPath) {
        @StrongObj(self);
        [self pasteData:indexPath.row];
    };
    self.package.rowHeightBlock = ^CGFloat(UITableView *tableView, NSIndexPath *indexPath) {
        return UITableViewAutomaticDimension;
    };
    self.mainView = self.package.tableView;
}
-(void)layoutMainView{
    self.view.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.2];
    [self.view addSubview:self.mainView];
    self.mainView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *top = JH_Layout(self.mainView, JH_Top, self.view, JH_Top, kTopHeight+50);
    NSLayoutConstraint *left = JH_Layout(self.mainView, JH_Leading, JH_SafeArea(self.view), JH_Leading, 0);
    NSLayoutConstraint *right = JH_Layout(self.mainView, JH_Trailing, JH_SafeArea(self.view), JH_Trailing, 0);
    NSLayoutConstraint *bottom = JH_Layout(self.mainView, JH_Bottom, JH_SafeArea(self.view), JH_Bottom, 0);
    NSArray *arr = @[top,left,right,bottom];
    JH_AddLayouts(self.view, arr);
}
-(void)pasteData:(NSInteger)row{
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = [JHDebugInstance.logArr[row]c_pasteStr];
    [JHHudManager sv_showInfoWithStatus:@"成功复制内容到粘贴板"];
    [JHHudManager sv_dismissWithDelay:2.f];
    
}
#pragma mark - ------------------Key-Value Observer------------------

#pragma mark - ------------------UITableViewDelegate,UITableViewDataSource------------------

#pragma mark - ------------------UICollectionViewDelegate,UICollectionViewDataSource------------------

#pragma mark - ------------------UIScrollViewDelegate------------------

@end
