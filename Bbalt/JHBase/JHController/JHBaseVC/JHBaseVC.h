//
//  JHBaseVC.h
//  Ubtms-boss
//
//  Created by hjh on 17/6/22.
//  Copyright © 2017年 com. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,GetDataType) {
    GetDataOrigin,
    GetDataPullDown,
    GetDataPullUp,
    GetDataRefresh
};
typedef NS_ENUM(NSInteger,GetDataStatus) {
    GetDataSuccess,
    GetDataLoading,
    GetDataNoData,
    GetDataError
};
@interface JHBaseVC : UIViewController

@property(nonatomic,assign)NSInteger pageIndex;
@property(nonatomic,assign)NSInteger pageSize;
@property(nonatomic,assign)GetDataStatus getdataStatus;
@property(nonatomic,strong)UIButton *cancelEditBtn;
@property(nonatomic,strong)UIView * _Nullable customNavi;
-(void)initCustomNavi;
-(void)hideCustomNavi;
-(void)showCustomNavi;
-(void)setCustomNaviAlpha:(CGFloat)alpha;
+(instancetype _Nullable )initFromXIB;
-(void)cancelEditBtnTo:(BOOL)show;
@end
