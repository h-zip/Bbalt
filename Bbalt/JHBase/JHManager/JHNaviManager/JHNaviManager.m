//
//  JHNaviManager.m
//  Test
//
//  Created by bory on 2018/5/9.
//  Copyright © 2018年 hans. All rights reserved.
//

#import "JHNaviManager.h"

@implementation JHNaviManager
+(instancetype)share{
    static JHNaviManager *_JHNaviManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _JHNaviManager = [[self alloc]init];
    });
    return _JHNaviManager;
}
-(instancetype)init{
    if (self = [super init]) {
//        self.loginNavi = [[JHBaseNaviC alloc]initWithRootViewController:[JHLoginVC initFromXIB]];
//        @TODO("navi");
        
        self.navi1 = [[JHBaseNaviC alloc]initWithRootViewController:[TestVC2 new]];
//
//        self.navi2 = [[JHBaseNaviC alloc]init];
//        self.navi3 = [[JHBaseNaviC alloc]init];
//        self.navi4 = [[JHBaseNaviC alloc]init];
    }
    return self;
}


@end
