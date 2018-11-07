//
//  UIImage+Resize.m
//  interview
//
//  Created by hjh on 16/6/2.
//  Copyright © 2016年 hjh. All rights reserved.
//

#import "UIImage+Resize.h"

@implementation UIImage (Resize)
+(UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize
{
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return reSizeImage;
    
}
+(UIImage*) circleImage:(UIImage*) image withLineWidth:(CGFloat)lineWidth andLineColor:(UIColor*)lineColor toSize:(CGSize)reSize{
    UIGraphicsBeginImageContext(image.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context,lineWidth);
    CGContextSetStrokeColorWithColor(context, lineColor.CGColor);
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    CGContextAddEllipseInRect(context, rect);
    CGContextClip(context);
    [image drawInRect:rect];
    CGContextAddEllipseInRect(context, (CGRect){0,0,image.size.width,image.size.height});
    //    CGContextStrokePath(context);
    CGContextDrawPath(context, kCGPathStroke);
    UIImage *newimg = UIGraphicsGetImageFromCurrentImageContext();
    newimg=[self reSizeImage:newimg toSize:reSize];
    UIGraphicsEndImageContext();
    return newimg;
}
- (UIImage *)normalizedImage {
    if (self.imageOrientation == UIImageOrientationUp) return self;
    
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    [self drawInRect:(CGRect){0, 0, self.size}];
    UIImage *normalizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return normalizedImage;
}
@end
