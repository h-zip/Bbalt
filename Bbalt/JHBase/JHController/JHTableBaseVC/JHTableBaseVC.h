//
//  JHTableBaseVC.h
//  Test
//
//  Created by bory on 2018/7/11.
//  Copyright © 2018年 hans. All rights reserved.
//

#import "JHBaseVC.h"
#import "JHLoadingView.h"
#import "JHNoDataView.h"
#import "JHNoWifiView.h"
#import "JHBaseModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JHTableBaseVC : JHBaseVC

@property(nonatomic,strong)JHTableView *mTableView;
@property(nonatomic,strong)JHLoadingView *loadingView;
@property(nonatomic,strong)JHNoDataView *nodataView;
@property(nonatomic,strong)JHNoWifiView *errorView;

@property(nonatomic,strong)JHTableViewPackage *package;

@property(nonatomic,strong)NSString *url;
@property(nonatomic,strong)NSDictionary *dic;

-(void)reloadUI;
-(void)initTableViewPackage;
-(void)getData:(GetDataType)type;
@end

NS_ASSUME_NONNULL_END
