//
//  JHBrowserManager.m
//  Bbalt
//
//  Created by bory on 2019/2/15.
//  Copyright © 2019年 hans. All rights reserved.
//

#import "JHBrowserManager.h"

@implementation JHBrowserManager
+(instancetype)share{
    static JHBrowserManager *_JHBrowserManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _JHBrowserManager = [[self alloc]init];
    });
    return _JHBrowserManager;
}
-(instancetype)init{
    if (self = [super init]) {
        self.singleBrowserView = [[JHSingleBrowserView alloc]init];
    }
    return self;
}
@end
