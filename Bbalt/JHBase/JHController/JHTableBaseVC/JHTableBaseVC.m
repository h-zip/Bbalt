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
            [self.mTableView removeFromSuperview];
            [self.nodataView removeFromSuperview];
            [self.errorView removeFromSuperview];
            
            [self.loadingView stopAnimating];
            [self.loadingView removeFromSuperview];
            
            [self.loadingView startAnimating];
            [self.view addSubview:self.loadingView];
        }
            break;
        case GetDataNoData:
        {
            [self.mTableView removeFromSuperview];
            [self.nodataView removeFromSuperview];
            [self.errorView removeFromSuperview];
            
            [self.loadingView stopAnimating];
            [self.loadingView removeFromSuperview];
            
            [self.view addSubview:self.nodataView];
        }
            break;
        case GetDataSuccess:
        {
            [self.mTableView removeFromSuperview];
            [self.nodataView removeFromSuperview];
            [self.errorView removeFromSuperview];
            
            [self.loadingView stopAnimating];
            [self.loadingView removeFromSuperview];
            
            [self.view addSubview:self.mTableView];
        }
            break;
        case GetDataError:
        {
            [self.mTableView removeFromSuperview];
            [self.nodataView removeFromSuperview];
            [self.errorView removeFromSuperview];
            
            [self.loadingView stopAnimating];
            [self.loadingView removeFromSuperview];
            
            [self.view addSubview:self.errorView];
        }
            break;
            
        default:
            break;
    }
}
-(JHLoadingView*)loadingView{
    if (!_loadingView) {
        _loadingView = [[NSBundle mainBundle]loadNibNamed:@"JHLoadingView" owner:nil options:nil][0];
        _loadingView.frame = _mTableView.frame;
    }
    return _loadingView;
}
-(JHNoDataView*)nodataView{
    if (!_nodataView) {
        _nodataView = [[NSBundle mainBundle]loadNibNamed:@"JHNoDataView" owner:nil options:nil][0];
        _nodataView.frame = _mTableView.frame;
    }
    return _nodataView;
}
-(JHNoWifiView*)errorView{
    if (!_errorView) {
        _errorView = [[NSBundle mainBundle]loadNibNamed:@"JHNoWifiView" owner:nil options:nil][0];
        _errorView.frame = _mTableView.frame;
    }
    return _errorView;
}
-(JHTableView*)mTableView{
    if (!_mTableView) {
        _mTableView = [[JHTableView alloc]initWithFrame:CGRectMake(0, kTopHeight, kSCREEN_W, kSCREEN_H-kTopHeight) style:self.tableViewStyle];
        _mTableView.delegate = self;
        _mTableView.dataSource = self;
        if (@available(iOS 11.0, *)) {
            self.mTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        self.mTableView.estimatedRowHeight = 0;
        self.mTableView.estimatedSectionFooterHeight = 0;
        self.mTableView.estimatedSectionHeaderHeight = 0;
        _mTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _mTableView;
}
#pragma mark - LifeCycle
-(void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.mTableView];
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
    //need override
}
-(void)initRefreshHeader{
    @WeakObj(self);
    MJRefreshNormalHeader *mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        @StrongObj(self);
        [self getData:GetDataPullDown];
        
    }];
    mj_header.lastUpdatedTimeLabel.hidden = YES;
    
    self.mTableView.mj_header = mj_header;
    
}
-(void)initRefreshFooter{
    @WeakObj(self);
    MJRefreshAutoNormalFooter *mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        @StrongObj(self);
        [self getData:GetDataPullUp];
        
    }];
    self.mTableView.mj_footer = mj_footer;
}
-(void)reloadUI{
    [self.mTableView reloadData];
}
-(void)initTableHeader:(UIView*)header{
    UIView *view = [[UIView alloc]initWithFrame:header.frame];
    [view addSubview:header];
    self.mTableView.tableHeaderView = view;
}
-(void)initTableFooter:(UIView*)footer{
    UIView *view = [[UIView alloc]initWithFrame:footer.frame];
    [view addSubview:footer];
    self.mTableView.tableFooterView = view;
}
#pragma mark - Private Methods

#pragma mark - Key-Value Observer

#pragma mark - UITableViewDelegate,UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSInteger num = 0;
    if (self.sectionNumBlock) {
        num = self.sectionNumBlock(tableView);
    }
    return num;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger num = 0;
    if (self.rowNumBlock) {
        num = self.rowNumBlock(tableView, section);
    }
    return num;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = 0;
    if (self.rowHeightBlock) {
        height = self.rowHeightBlock(tableView, indexPath);
    }
    return height;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    if (self.cellBlock) {
        cell = self.cellBlock(tableView, indexPath);
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    CGFloat height = 0;
    if (self.sectionHeaderBlock) {
        height = self.sectionHeaderHeightBlock(tableView, section);
    }
    return height;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * header = nil;
    if (self.sectionHeaderBlock) {
        header = self.sectionFooterBlock(tableView, section);
    }
    return header;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    CGFloat height = 0;
    if (self.sectionFooterHeightBlock) {
        height = self.sectionFooterHeightBlock(tableView, section);
    }
    return height;
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * footer = nil;
    if (self.sectionFooterBlock) {
        footer = self.sectionFooterBlock(tableView, section);
    }
    return footer;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.rowSelectBlock) {
        self.rowSelectBlock(tableView, indexPath);
    }
}
#pragma mark - UICollectionViewDelegate,UICollectionViewDataSource

#pragma mark - UIScrollViewDelegate

@end
