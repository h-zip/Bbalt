//
//  JHTableListVC.m
//  Xinxy
//
//  Created by bory on 2018/4/26.
//  Copyright © 2018年 hans. All rights reserved.
//
#import "JHScrollListVC.h"

@interface JHScrollListVC ()

@end

@implementation JHScrollListVC

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

-(void)getData:(JHGetDataType)type{
    [super getData:type];
    if (!self.url || !self.dic) {
        return;
    }
    if (![[AFNetworkReachabilityManager sharedManager]isReachable]) {
        self.getdataStatus = JHGetDataError;
        return;
    }
    NSInteger pageIndex = 0;
    NSInteger pageSize = 0;
    if (type==JHGetDataOrigin) {
        pageIndex = 0;
        pageSize = self.pageSize;
        self.getdataStatus = JHGetDataLoading;
    }else if (type == JHGetDataPullDown){
        pageIndex = 0;
        pageSize = self.pageSize;
    }else if (type == JHGetDataPullUp){
        pageIndex = self.pageIndex+1;
        pageSize = self.pageSize;
    }else{
        pageIndex = 0;
        pageSize = (self.pageIndex+1)*self.pageSize;
        self.getdataStatus = JHGetDataLoading;
    }
    
    NSMutableDictionary *dic = [@{PageIndex:[NSString stringWithFormat:@"%ld",(long)pageIndex],PageSize:[NSString stringWithFormat:@"%ld",(long)pageSize]}mutableCopy];
    [dic addEntriesFromDictionary:self.dic];
    [JHTestRequestService postWithURL:self.url Dic:dic Ret:^(BOOL success, id response) {
        JHBaseResultModel *model = [JHBaseResultModel modelWithJSON:response];
        [self.mainView.mj_header endRefreshing];
        [self.mainView.mj_footer endRefreshing];
        if ([JHBaseResultHandler shouldGotoSuccessCallBackBasedOnBaseResult:model]) {
            NSArray *arr = [self getArrWithJson:model.R];
            if (type==JHGetDataOrigin) {
                self.dataArr = arr;
                if (arr.count==0) {
                    self.getdataStatus = JHGetDataNoData;
                }else{
                    self.getdataStatus = JHGetDataSuccess;
                    if (arr.count<pageSize) {
                        [self.mainView.mj_footer endRefreshingWithNoMoreData];
                    }else{
                        [self.mainView.mj_footer endRefreshing];
                    }
                }
            }else if (type == JHGetDataPullDown){
                self.dataArr = arr;
                if (arr.count==0) {
                    self.getdataStatus = JHGetDataNoData;
                }else{
                    self.getdataStatus = JHGetDataSuccess;
                    if (arr.count<pageSize) {
                        [self.mainView.mj_footer endRefreshingWithNoMoreData];
                    }else{
                        [self.mainView.mj_footer endRefreshing];
                    }
                }
            }else if (type == JHGetDataPullUp){
                self.dataArr = [self.dataArr arrayByAddingObjectsFromArray:arr];
                self.pageIndex = pageIndex;
                self.getdataStatus = JHGetDataSuccess;
                if (arr.count<pageSize) {
                    [self.mainView.mj_footer endRefreshingWithNoMoreData];
                }else{
                    [self.mainView.mj_footer endRefreshing];
                }
            }else{
                self.dataArr = arr;
                if (arr.count==0) {
                    self.getdataStatus = JHGetDataNoData;
                }else{
                    self.getdataStatus = JHGetDataSuccess;
                    if (arr.count<pageSize) {
                        [self.mainView.mj_footer endRefreshingWithNoMoreData];
                    }else{
                        [self.mainView.mj_footer endRefreshing];
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
//                self.getdataStatus = JHGetDataNoData;
//            }else{
//                self.getdataStatus = JHGetDataSuccess;
//            }
        }
    }];
}
#pragma mark - CanOverRrite Methods
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
