//
//  JHGlobal.m
//  Bbalt
//
//  Created by bory on 2019/1/21.
//  Copyright © 2019年 hans. All rights reserved.
//

#import "JHGlobal.h"
@interface JHFontSize ()
@end
@implementation JHFontSize
+(CGFloat)fixSize:(CGFloat)size{
    NSInteger w = (NSInteger)[[UIScreen mainScreen] bounds].size.width;
    CGFloat s = size;
    switch (w) {
        case 320:
        {
            s = size - 2;
        }
            break;
        case 375:
        {
            s = size;
        }
            break;
        case 414:
        {
            s = size + 1;
        }
            break;
        default:
            break;
    }
    return s;
}
-(CGFloat)ss{
    return [[self class] fixSize:10.f];
}
-(CGFloat)s{
    return [[self class] fixSize:11.f];
}
-(CGFloat)m{
    return [[self class] fixSize:12.f];
}
-(CGFloat)l{
    return [[self class] fixSize:13.f];
}
-(CGFloat)ll{
    return [[self class] fixSize:14.f];
}
@end
@interface JHColor ()
@end
@implementation JHColor
-(UIColor*)red_light_0{
    return [UIColor colorWithHexString:@""];
}
-(UIColor*)red_light_1{
    return [UIColor colorWithHexString:@""];
}
-(UIColor*)red_dark_0{
    return [UIColor colorWithHexString:@""];
}
-(UIColor*)red_dark_1{
    return [UIColor colorWithHexString:@""];
}
@end
@interface JHFont ()
@end
@implementation JHFont
-(UIFont*)system_ss_regular{
    return [UIFont systemFontOfSize:[JHGlobal share].fontsizes.ss weight:UIFontWeightRegular];
}
-(UIFont*)pingfang_ss_semibold{
    return [UIFont fontWithName:@"PingFangSC-Semibold" size:[JHGlobal share].fontsizes.ss];
}
@end
@interface JHAttributes ()
@end
@implementation JHAttributes
-(NSDictionary*)pingfang_red_light_0{
    return @{
             NSForegroundColorAttributeName: [JHGlobal share].colors.red_light_0,
             NSFontAttributeName: [JHGlobal share].fonts.pingfang_ss_semibold
             };
}
@end
@interface JHSafeArea ()
@end
@implementation JHSafeArea
-(UIEdgeInsets)insets {
    if (@available(iOS 11.0, *)) {
        return UIApplication.sharedApplication.keyWindow.safeAreaInsets;
    } else {
        return UIEdgeInsetsZero;
    }
}
@end
@implementation JHGlobal
+(instancetype)share{
    static JHGlobal *_JHGlobal = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _JHGlobal = [[self alloc]init];
        _JHGlobal.fontsizes = [JHFontSize new];
        _JHGlobal.colors = [JHColor new];
        _JHGlobal.fonts = [JHFont new];
        _JHGlobal.attributes = [JHAttributes new];
        _JHGlobal.safeareas = [JHSafeArea new];
    });
    return _JHGlobal;
}
@end
