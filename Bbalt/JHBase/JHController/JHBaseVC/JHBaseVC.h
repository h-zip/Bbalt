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
    GetDataLoading,
    GetDataNoData,
    GetDataError,
    GetDataSuccess
};
@interface JHBaseVC : UIViewController

@property(nonatomic,assign)NSInteger pageIndex;
@property(nonatomic,assign)NSInteger pageSize;
@property(nonatomic,assign)GetDataStatus getdataStatus;

@property(nonatomic,strong)UIView * _Nullable customNavi;
-(void)initCustomNavi;
-(void)hideCustomNavi;
-(void)showCustomNavi;
-(void)setCustomNaviAlpha:(CGFloat)alpha;
+(instancetype _Nullable )initFromXIB;








-(void)hideNavigationBar;
-(void)appearNavigationBar;
-(void)configNavigationBarAlpba:(float)alpha;
-(void)configNavigationBarBgImage:(UIImage* _Nonnull)bgImage;
-(void)configNavigationLeftBarBtnItemImage:( UIImage* _Nonnull )image
                                       Target:(nullable id)target
                                       action:(nullable SEL)action;
-(void)configNavigationRightBarBtnItemImage:( UIImage* _Nonnull )image
                                    Target:(nullable id)target
                                    action:(nullable SEL)action;
-(void)configNavigationBarTitleStyle:(NSDictionary* _Nonnull)style;
-(void)handleFirstResponder;
-(void)cancelNaviBackItemTitle;
-(void)hiddenNavigationBackBarBtnItem;
-(void)changeNavigationBackBarBtnItemWithCustomImage:(nullable UIImage*)image;
-(void)configNavigationBackBarBtnItemWithCustomImage:(nullable UIImage*)image;
-(void)configNavigationLeftBarBtnItemWithCustomView:(nullable UIView*)view;
-(void)configNavigationRightBarBtnItemWithCustomView:(nullable UIView*)view;
-(void)configNavigationLeftBarBtnItemWithCustomViews:(nullable NSArray*)views;
-(void)configNavigationRightBarBtnItemWithCustomViews:(nullable NSArray*)views;
@end
