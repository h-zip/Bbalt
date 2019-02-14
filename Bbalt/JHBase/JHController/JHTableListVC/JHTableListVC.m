//
//  JHTableListVC.m
//  Xinxy
//
//  Created by bory on 2018/4/26.
//  Copyright © 2018年 hans. All rights reserved.
//
#import "JHTableListVC.h"

@interface JHTableListVC ()

@end

@implementation JHTableListVC

-(NSArray*)dataArr{
    if (!_dataArr) {
        _dataArr = @[];
    }
    return _dataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //[self initRefreshHeader];
    //[self initRefreshFooter];
}

-(void)getData:(GetDataType)type{
    [super getData:type];
    if (!self.url || !self.dic) {
        return;
    }
    if (![[AFNetworkReachabilityManager sharedManager]isReachable]) {
        self.getdataStatus = GetDataError;
        return;
    }
    NSInteger pageIndex = 0;
    NSInteger pageSize = 0;
    if (type==GetDataOrigin) {
        pageIndex = 0;
        pageSize = self.pageSize;
        self.getdataStatus = GetDataLoading;
    }else if (type == GetDataPullDown){
        pageIndex = 0;
        pageSize = self.pageSize;
    }else if (type == GetDataPullUp){
        pageIndex = self.pageIndex+1;
        pageSize = self.pageSize;
    }else{
        pageIndex = 0;
        pageSize = (self.pageIndex+1)*self.pageSize;
        self.getdataStatus = GetDataLoading;
    }
    
    NSMutableDictionary *dic = [@{PageIndex:[NSString stringWithFormat:@"%ld",(long)pageIndex],PageSize:[NSString stringWithFormat:@"%ld",(long)pageSize]}mutableCopy];
    [dic addEntriesFromDictionary:self.dic];
    [JHTestRequestService postWithURL:self.url Dic:dic Ret:^(BOOL success, id response) {
        JHBaseResultModel *model = [JHBaseResultModel modelWithJSON:response];
        [self.mTableView.mj_header endRefreshing];
        [self.mTableView.mj_footer endRefreshing];
        if ([JHBaseResultHandler shouldGotoSuccessCallBackBasedOnBaseResult:model]) {
            NSArray *arr = [self getArrWithJson:model.R];
            if (type==GetDataOrigin) {
                self.dataArr = arr;
                if (arr.count==0) {
                    self.getdataStatus = GetDataNoData;
                }else{
                    self.getdataStatus = GetDataSuccess;
                    if (arr.count<pageSize) {
                        [self.mTableView.mj_footer endRefreshingWithNoMoreData];
                    }else{
                        [self.mTableView.mj_footer endRefreshing];
                    }
                }
            }else if (type == GetDataPullDown){
                self.dataArr = arr;
                if (arr.count==0) {
                    self.getdataStatus = GetDataNoData;
                }else{
                    self.getdataStatus = GetDataSuccess;
                    if (arr.count<pageSize) {
                        [self.mTableView.mj_footer endRefreshingWithNoMoreData];
                    }else{
                        [self.mTableView.mj_footer endRefreshing];
                    }
                }
            }else if (type == GetDataPullUp){
                self.dataArr = [self.dataArr arrayByAddingObjectsFromArray:arr];
                self.pageIndex = pageIndex;
                self.getdataStatus = GetDataSuccess;
                if (arr.count<pageSize) {
                    [self.mTableView.mj_footer endRefreshingWithNoMoreData];
                }else{
                    [self.mTableView.mj_footer endRefreshing];
                }
            }else{
                self.dataArr = arr;
                if (arr.count==0) {
                    self.getdataStatus = GetDataNoData;
                }else{
                    self.getdataStatus = GetDataSuccess;
                    if (arr.count<pageSize) {
                        [self.mTableView.mj_footer endRefreshingWithNoMoreData];
                    }else{
                        [self.mTableView.mj_footer endRefreshing];
                    }
                    NSInteger aa=self.dataArr.count%self.pageSize;
                    NSInteger index = self.dataArr.count/self.pageSize;
                    if (aa==0) {
                        self.pageIndex=index-1;
                    }
                    else{
                        self.pageIndex=index;
                    }
                }
            }
            [self reloadUI];
        }else{
//            if (self.dataArr.count==0) {
//                self.getdataStatus = GetDataNoData;
//            }else{
//                self.getdataStatus = GetDataSuccess;
//            }
        }
    }];
}
-(NSArray*)getArrWithJson:(id)json{
    return [NSArray yy_modelArrayWithClass:[self.classModel class] json:json];
}
-(void)bindObserver{
//    @WeakObj(self);
//    [RACObserve(self, getdataStatus) subscribeNext:^(id x) {
//        @StrongObj(self);
//        
//    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
