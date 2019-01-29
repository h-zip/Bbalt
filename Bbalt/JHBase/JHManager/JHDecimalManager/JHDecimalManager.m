//
//  JHDecimalManager.m
//  Bbalt
//
//  Created by bory on 2019/1/29.
//  Copyright © 2019年 hans. All rights reserved.
//

#import "JHDecimalManager.h"

@implementation JHDecimalManager
+(instancetype)share{
    static JHDecimalManager *_JHDecimalManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _JHDecimalManager = [[self alloc]init];
    });
    return _JHDecimalManager;
}
-(instancetype)init{
    if (self = [super init]) {
        self.roundPlainHandler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain scale:2 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES];
    }
    return self;
}
@end
