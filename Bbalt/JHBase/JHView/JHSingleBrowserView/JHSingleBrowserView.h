//
//  JHSingleBrowserView.h
//  Bbalt
//
//  Created by bory on 2019/2/15.
//  Copyright © 2019年 hans. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
#define JHZoom_Min 1.f
#define JHZoom_Max 2.f
@interface JHSingleBrowserView : UIView
@property(nonatomic,strong)JHScrollView *scrollView;
@end

NS_ASSUME_NONNULL_END
