//
//  JHBaseVC.h
//  Ubtms-boss
//
//  Created by hjh on 17/6/22.
//  Copyright © 2017年 com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHBaseVC : UIViewController

@property(nonatomic,strong)UIButton *cancelEditBtn;
@property(nonatomic,strong)UIView * _Nullable customNavi;
-(void)initCustomNavi;
-(void)hideCustomNavi;
-(void)showCustomNavi;
-(void)setCustomNaviAlpha:(CGFloat)alpha;
+(instancetype _Nullable )initFromXIB;
-(void)cancelEditBtnTo:(BOOL)show;
@end
