//
//  UIImage+Resize.h
//  interview
//
//  Created by hjh on 16/6/2.
//  Copyright © 2016年 hjh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Resize)
+(UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize;
+(UIImage *)circleImage:(UIImage *)image withLineWidth:(CGFloat)lineWidth andLineColor:(UIColor *)lineColor toSize:(CGSize)reSize;
- (UIImage *)normalizedImage;
@end
