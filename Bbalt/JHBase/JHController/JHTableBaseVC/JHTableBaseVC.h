//
//  JHTableBaseVC.h
//  Test
//
//  Created by bory on 2018/7/11.
//  Copyright © 2018年 hans. All rights reserved.
//

#import "JHBaseVC.h"
#import "JHTableView.h"
#import "JHLoadingView.h"
#import "JHNoDataView.h"
#import "JHNoWifiView.h"
#import "JHBaseModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JHTableBaseVC : JHBaseVC<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,copy)SectionNumBlock sectionNumBlock;
@property(nonatomic,copy)RowNumBlock rowNumBlock;
@property(nonatomic,copy)RowHeightBlock rowHeightBlock;
@property(nonatomic,copy)CellBlock cellBlock;
@property(nonatomic,copy)SectionHeaderHeightBlock sectionHeaderHeightBlock;
@property(nonatomic,copy)SectionHeaderBlock sectionHeaderBlock;
@property(nonatomic,copy)SectionFooterHeightBlock sectionFooterHeightBlock;
@property(nonatomic,copy)SectionFooterBlock sectionFooterBlock;
@property(nonatomic,copy)RowSelectBlock rowSelectBlock;

@property(nonatomic,copy)TableHeaderBlock tableHeaderBlock;
@property(nonatomic,copy)TableFooterBlock tableFooterBlock;

@property(nonatomic,strong)JHTableView *mTableView;
@property(nonatomic,strong)JHLoadingView *loadingView;
@property(nonatomic,strong)JHNoDataView *nodataView;
@property(nonatomic,strong)JHNoWifiView *errorView;

@property(nonatomic,assign)UITableViewStyle tableViewStyle;

@property(nonatomic,strong)NSString *url;
@property(nonatomic,strong)NSDictionary *dic;

-(void)initTableHeader:(UIView*)header;
-(void)initTableFooter:(UIView*)footer;

-(void)initRefreshHeader;
-(void)initRefreshFooter;

-(void)reloadUI;

-(void)getData:(GetDataType)type;
@end

NS_ASSUME_NONNULL_END
