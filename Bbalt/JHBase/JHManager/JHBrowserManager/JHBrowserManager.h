//
//  JHBrowserManager.h
//  Bbalt
//
//  Created by bory on 2019/2/15.
//  Copyright © 2019年 hans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JHSingleBrowserView.h"
NS_ASSUME_NONNULL_BEGIN
#define JHZoom_Min 0.2f
#define JHZoom_Max 5.f
@interface JHBrowserManager : NSObject<UIScrollViewDelegate>
@property(nonatomic,strong)UIView *containerView;
@property(nonatomic,strong)JHScrollView *containerScrollView;
@property(nonatomic,strong)UIView *progressView;
@property(nonatomic,strong)CAShapeLayer *progressLayer;
@property(nonatomic,strong)NSArray *srcArr;
@property(nonatomic,strong)NSMutableArray<JHSingleBrowserView*> *singleBrowserArr;
+(instancetype)share;
-(void)showWithPicSrcs:(NSArray*)srcs
                InView:(UIView*)view;
-(void)dismiss;
-(void)showWithIndex:(NSInteger)index;
@end

NS_ASSUME_NONNULL_END
