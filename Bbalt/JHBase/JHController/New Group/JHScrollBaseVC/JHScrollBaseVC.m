//
//  JHTableBaseVC.m
//  Test
//
//  Created by bory on 2018/7/11.
//  Copyright © 2018年 hans. All rights reserved.
//

#import "JHScrollBaseVC.h"

@interface JHScrollBaseVC ()

@end

@implementation JHScrollBaseVC

#pragma mark - Setter Getter Methods

-(void)setGetdataStatus:(JHGetDataStatus)getdataStatus{
    if (_getdataStatus == getdataStatus) {
        return;
    }
    _getdataStatus = getdataStatus;
    switch (_getdataStatus) {
        case JHGetDataLoading:
        {
            [self.mainView setHidden:YES];
            [self.nodataView setHidden:YES];
            [self.errorView setHidden:YES];
            
            [self.loadingView startAnimating];
            [self.loadingView setHidden:NO];
        }
            break;
        case JHGetDataNoData:
        {
            [self.mainView setHidden:YES];
            [self.errorView setHidden:YES];
            
            [self.loadingView stopAnimating];
            [self.loadingView setHidden:YES];
            
            [self.nodataView setHidden:NO];
        }
            break;
        case JHGetDataSuccess:
        {
            [self.nodataView setHidden:YES];
            [self.errorView setHidden:YES];
            
            [self.loadingView stopAnimating];
            [self.loadingView setHidden:YES];
            
            [self.mainView setHidden:NO];
        }
            break;
        case JHGetDataError:
        {
            [self.mainView setHidden:YES];
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
-(UIScrollView*)mainView{
    return self.package.mainView;
}
-(JHTableView*)mTableView{
    return (JHTableView*)self.mainView;
}
-(JHCollectionView*)mCollectionView{
    return (JHCollectionView*)self.mainView;
}
-(JHLoadingView*)loadingView{
    if (!_loadingView) {
        _loadingView = [[NSBundle mainBundle]loadNibNamed:@"JHLoadingView" owner:nil options:nil][0];
        _loadingView.hidden = YES;
        [self.view addSubview:_loadingView];
    }
    return _loadingView;
}
-(JHNoDataView*)nodataView{
    if (!_nodataView) {
        _nodataView = [[NSBundle mainBundle]loadNibNamed:@"JHNoDataView" owner:nil options:nil][0];
        _nodataView.hidden = YES;
        [self.view addSubview:_nodataView];
    }
    return _nodataView;
}
-(JHNoWifiView*)errorView{
    if (!_errorView) {
        _errorView = [[NSBundle mainBundle]loadNibNamed:@"JHNoWifiView" owner:nil options:nil][0];
        _errorView.hidden = YES;
        [self.view addSubview:_errorView];
    }
    return _errorView;
}

#pragma mark - LifeCycle
-(void)viewDidLoad {
    [super viewDidLoad];
    self.pageSize = 6;
    self.pageIndex = 0;
    [self initPackage];
    [self layoutMainView];
    [self layoutBaseView];
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

#pragma mark - NeedOverRrite Methods
-(void)getData:(JHGetDataType)type{
}
-(void)initPackage{
    self.package = [[JHTableViewPackage alloc]initWithStyle:JHPackageTypeTableGrouped];
}
#pragma mark - CanOverRrite Methods
-(void)layoutMainView{
    [self.view addSubview:self.mainView];
    NSArray *arr = JH_EqualVCWithNavi(self.mainView, self.view);
    JH_AddLayouts(self.view, arr);
}
-(void)layoutBaseView{
    NSArray* arr1 = JH_EqualSizeLayouts(self.loadingView, self.mainView);
    JH_AddLayouts(self.view, arr1);
    NSArray* arr2 = JH_EqualSizeLayouts(self.nodataView, self.mainView);
    JH_AddLayouts(self.view, arr2);
    NSArray* arr3 = JH_EqualSizeLayouts(self.errorView, self.mainView);
    JH_AddLayouts(self.view, arr3);
}
-(void)reloadUI{
    [self.package reload];
}
#pragma mark - Private Methods

#pragma mark - Key-Value Observer

#pragma mark - UITableViewDelegate,UITableViewDataSource

#pragma mark - UICollectionViewDelegate,UICollectionViewDataSource

#pragma mark - UIScrollViewDelegate

@end
