//
//  JHSingleBrowserView.h
//  Bbalt
//
//  Created by bory on 2019/2/15.
//  Copyright © 2019年 hans. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface JHSingleBrowserView : UIView<UIScrollViewDelegate>
@property(nonatomic,strong)JHScrollView *scrollView;
@property(nonatomic,strong)JHImageView *imageView;
@property(nonatomic,copy)GestureBlock singleTapBlock;
@property(nonatomic,copy)GestureBlock doubleTapBlock;
-(instancetype)initWithMin:(CGFloat)min
                       Max:(CGFloat)max;
-(void)beCenter;
@end

NS_ASSUME_NONNULL_END
