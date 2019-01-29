//
//  JHTableDetailVC.m
//  Test
//
//  Created by bory on 2018/7/11.
//  Copyright © 2018年 hans. All rights reserved.
//

#import "JHTableDetailVC.h"

@interface JHTableDetailVC ()

@end

@implementation JHTableDetailVC

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
-(void)getData:(GetDataType)type{
    [super getData:type];
    if (!self.url || !self.dic) {
        return;
    }
    if (![[AFNetworkReachabilityManager sharedManager]isReachable]) {
        self.getdataStatus = GetDataError;
        return;
    }
    if (type==GetDataOrigin) {
        self.getdataStatus = GetDataLoading;
    }else if (type == GetDataPullDown){
        
    }else if (type == GetDataPullUp){
        return;
    }else{
        return;
    }
    
    NSMutableDictionary *dic = [@{}mutableCopy];
    [dic addEntriesFromDictionary:self.dic];
    [JHTestRequestService postWithURL:self.url Dic:dic Ret:^(BOOL success, id response) {
        JHBaseResultModel *model = [JHBaseResultModel modelWithJSON:response];
        [self.mTableView.mj_header endRefreshing];
        if ([JHBaseResultHandler shouldGotoSuccessCallBackBasedOnBaseResult:model]) {
            self.dataModel = [[self.dataModel class] modelWithJSON:model.result];
            if (self.dataModel) {
                self.getdataStatus = GetDataSuccess;
                [self reloadUI];
            }else{
                self.getdataStatus = GetDataNoData;
            }
            
        }else{
            //            if (self.dataArr.count==0) {
            //                self.getdataStatus = GetDataNoData;
            //            }else{
            //                self.getdataStatus = GetDataSuccess;
            //            }
        }
    }];
}
#pragma mark - Private Methods

#pragma mark - Key-Value Observer

#pragma mark - UITableViewDelegate,UITableViewDataSource

#pragma mark - UICollectionViewDelegate,UICollectionViewDataSource

#pragma mark - UIScrollViewDelegate

@end
