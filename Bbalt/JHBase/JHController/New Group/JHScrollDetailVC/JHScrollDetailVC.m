//
//  JHTableDetailVC.m
//  Test
//
//  Created by bory on 2018/7/11.
//  Copyright © 2018年 hans. All rights reserved.
//

#import "JHScrollDetailVC.h"

@interface JHScrollDetailVC ()

@end

@implementation JHScrollDetailVC

#pragma mark - Setter Getter Methods

#pragma mark - LifeCycle
-(void)viewDidLoad {
    [super viewDidLoad];
    [self initRefreshHeader];
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
-(void)getData:(JHGetDataType)type{
    [super getData:type];
    if (!self.url || !self.dic) {
        return;
    }
    if (![[AFNetworkReachabilityManager sharedManager]isReachable]) {
        self.getdataStatus = JHGetDataError;
        return;
    }
    if (type==JHGetDataOrigin) {
        self.getdataStatus = JHGetDataLoading;
    }else if (type == JHGetDataPullDown){
        
    }else if (type == JHGetDataPullUp){
        return;
    }else{
        return;
    }
    
    NSMutableDictionary *dic = [@{}mutableCopy];
    [dic addEntriesFromDictionary:self.dic];
    [JHTestRequestService postWithURL:self.url Dic:dic Ret:^(BOOL success, id response) {
        JHBaseResultModel *model = [JHBaseResultModel modelWithJSON:response];
        [self.mainView.mj_header endRefreshing];
        if ([JHBaseResultHandler shouldGotoSuccessCallBackBasedOnBaseResult:model]) {
            self.dataModel = [[self.dataModel class] modelWithJSON:model.result];
            if (self.dataModel) {
                self.getdataStatus = JHGetDataSuccess;
                [self reloadUI];
            }else{
                self.getdataStatus = JHGetDataNoData;
            }
            
        }else{
            //            if (self.dataArr.count==0) {
            //                self.getdataStatus = JHGetDataNoData;
            //            }else{
            //                self.getdataStatus = JHGetDataSuccess;
            //            }
        }
    }];
}
#pragma mark - Private Methods
-(void)initRefreshHeader{
    @WeakObj(self);
    [self.package initRefreshHeaderWithBlock:^{
        @StrongObj(self);
        [self getData:JHGetDataPullDown];
    }];
}
#pragma mark - Key-Value Observer

#pragma mark - UITableViewDelegate,UITableViewDataSource

#pragma mark - UICollectionViewDelegate,UICollectionViewDataSource

#pragma mark - UIScrollViewDelegate

@end
