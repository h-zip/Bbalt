//
//  JHTableBaseVC.m
//  Test
//
//  Created by bory on 2018/7/11.
//  Copyright © 2018年 hans. All rights reserved.
//

#import "JHTableBaseVC.h"

@interface JHTableBaseVC ()

@end

@implementation JHTableBaseVC

#pragma mark - Setter Getter Methods
@synthesize getdataStatus = _getdataStatus;

-(void)setGetdataStatus:(GetDataStatus)getdataStatus{
    if (_getdataStatus == getdataStatus) {
        return;
    }
    _getdataStatus = getdataStatus;
    switch (_getdataStatus) {
        case GetDataLoading:
        {
            [self.mTableView setHidden:YES];
            [self.nodataView setHidden:YES];
            [self.errorView setHidden:YES];
            
            [self.loadingView startAnimating];
            [self.loadingView setHidden:NO];
        }
            break;
        case GetDataNoData:
        {
            [self.mTableView setHidden:YES];
            [self.errorView setHidden:YES];
            
            [self.loadingView stopAnimating];
            [self.loadingView setHidden:YES];
            
            [self.nodataView setHidden:NO];
        }
            break;
        case GetDataSuccess:
        {
            [self.nodataView setHidden:YES];
            [self.errorView setHidden:YES];
            
            [self.loadingView stopAnimating];
            [self.loadingView setHidden:YES];
            
            [self.mTableView setHidden:NO];
        }
            break;
        case GetDataError:
        {
            [self.mTableView setHidden:YES];
            [self.nodataView setHidden:YES];
            
            [self.loadingView stopAnimating];
            [self.loadingView setHidden:YES];
            
            [self.errorView setHidden:NO];
        }
            break;
            
        default:
            break;
    }
}
-(JHLoadingView*)loadingView{
    if (!_loadingView) {
        _loadingView = [[NSBundle mainBundle]loadNibNamed:@"JHLoadingView" owner:nil options:nil][0];
        _loadingView.hidden = YES;
        [self.view addSubview:_loadingView];
        NSArray* arr = JH_EqualLayouts(_loadingView, _mTableView);
        JH_AddLayouts(self.view, arr);
    }
    return _loadingView;
}
-(JHNoDataView*)nodataView{
    if (!_nodataView) {
        _nodataView = [[NSBundle mainBundle]loadNibNamed:@"JHNoDataView" owner:nil options:nil][0];
        _nodataView.hidden = YES;
        [self.view addSubview:_nodataView];
        NSArray* arr = JH_EqualLayouts(_nodataView, _mTableView);
        JH_AddLayouts(self.view, arr);
    }
    return _nodataView;
}
-(JHNoWifiView*)errorView{
    if (!_errorView) {
        _errorView = [[NSBundle mainBundle]loadNibNamed:@"JHNoWifiView" owner:nil options:nil][0];
        _errorView.hidden = YES;
        [self.view addSubview:_errorView];
        NSArray* arr = JH_EqualLayouts(_errorView, _mTableView);
        JH_AddLayouts(self.view, arr);
    }
    return _errorView;
}
-(JHTableView*)mTableView{
    if (!_mTableView) {
        _mTableView = self.package.tableView;
    }
    return _mTableView;
}
#pragma mark - LifeCycle
-(void)viewDidLoad {
    [super viewDidLoad];
    [self initTableViewPackage];
    [self layoutTableView];
    
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

#pragma mark - Public Methods
-(void)getData:(GetDataType)type{
}
-(void)initTableViewPackage{
    self.package = [[JHTableViewPackage alloc]initWithStyle:UITableViewStyleGrouped];
}
-(void)layoutTableView{
    [self.view addSubview:self.mTableView];
    self.mTableView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *top = JH_Layout(self.mTableView, JH_Top, self.view, JH_Top, kTopHeight);
    NSLayoutConstraint *left = JH_Layout(self.mTableView, JH_Leading, JH_SafeArea(self.view), JH_Leading, 0);
    NSLayoutConstraint *right = JH_Layout(self.mTableView, JH_Trailing, JH_SafeArea(self.view), JH_Trailing, 0);
    NSLayoutConstraint *bottom = JH_Layout(self.mTableView, JH_Bottom, JH_SafeArea(self.view), JH_Bottom, 0);
    NSArray *arr = @[top,left,right,bottom];
    JH_AddLayouts(self.view, arr);
}
-(void)reloadUI{
    [self.package reloadTableView];
}
#pragma mark - Private Methods

#pragma mark - Key-Value Observer

#pragma mark - UITableViewDelegate,UITableViewDataSource

#pragma mark - UICollectionViewDelegate,UICollectionViewDataSource

#pragma mark - UIScrollViewDelegate

@end
