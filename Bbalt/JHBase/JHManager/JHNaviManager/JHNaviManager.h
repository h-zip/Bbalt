//
//  JHNaviManager.h
//  Test
//
//  Created by bory on 2018/5/9.
//  Copyright © 2018年 hans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JHBaseNaviC.h"
#import "JHLoginVC.h"
#import "TestVC1.h"
@interface JHNaviManager : NSObject
@property(nonatomic,strong)UINavigationController *loginNavi;
@property(nonatomic,strong)UINavigationController *navi1;
@property(nonatomic,strong)UINavigationController *navi2;
@property(nonatomic,strong)UINavigationController *navi3;
@property(nonatomic,strong)UINavigationController *navi4;
+(instancetype)share;
@end
