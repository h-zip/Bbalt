//
//  JHAnimateManager.m
//  Bbalt
//
//  Created by bory on 2019/2/25.
//  Copyright © 2019年 hans. All rights reserved.
//

#import "JHAnimateManager.h"

@implementation JHAnimateManager
+(instancetype)share{
    static JHAnimateManager *_JHAnimateManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _JHAnimateManager = [[self alloc]init];
    });
    return _JHAnimateManager;
}
-(instancetype)init{
    if (self = [super init]) {
    }
    return self;
}
+(void)defaultAnimate_1_WithAnimations:(void (^)(void))animations
                            Completion:(void (^ __nullable)(BOOL finished))completion{
    [UIView animateWithDuration:.2f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:animations completion:completion];
}
@end
