//
//  JHTableBaseVC.h
//  Test
//
//  Created by bory on 2018/7/11.
//  Copyright © 2018年 hans. All rights reserved.
//

#import "JHBaseVC.h"
#import "JHBaseModel.h"
#import "JHLoadingView.h"
#import "JHNoDataView.h"
#import "JHNoWifiView.h"
typedef NS_ENUM(NSInteger,JHGetDataType) {
    JHGetDataOrigin,
    JHGetDataPullDown,
    JHGetDataPullUp,
    JHGetDataRefresh
};
typedef NS_ENUM(NSInteger,JHGetDataStatus) {
    JHGetDataSuccess,
    JHGetDataLoading,
    JHGetDataNoData,
    JHGetDataError
};
typedef NS_ENUM(NSInteger,JHMainViewType) {
    JHMainViewTypeTable,
    JHMainViewTypeCollection
};
NS_ASSUME_NONNULL_BEGIN

@interface JHScrollBaseVC : JHBaseVC

@property(nonatomic,strong)JHLoadingView *loadingView;
@property(nonatomic,strong)JHNoDataView *nodataView;
@property(nonatomic,strong)JHNoWifiView *errorView;
@property(nonatomic,strong)UIScrollView *mainView;
@property(nonatomic,strong)JHTableView *mTableView;
@property(nonatomic,strong)JHCollectionView *mCollectionView;
@property(nonatomic,assign)JHMainViewType mainViewType;
@property(nonatomic,strong)JHScrollBasePackage *package;

@property(nonatomic,assign)NSInteger pageIndex;
@property(nonatomic,assign)NSInteger pageSize;
@property(nonatomic,assign)JHGetDataStatus getdataStatus;

@property(nonatomic,strong)NSString *url;
@property(nonatomic,strong)NSDictionary *dic;

-(void)reloadUI;
-(void)initPackage;
-(void)getData:(JHGetDataType)type;
@end

NS_ASSUME_NONNULL_END
