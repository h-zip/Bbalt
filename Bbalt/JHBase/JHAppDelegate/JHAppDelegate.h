//
//  AppDelegate.h
//  Test
//
//  Created by bory on 2018/5/7.
//  Copyright © 2018年 hans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppConfigModel.h"
@interface JHAppDelegate : UIResponder <UIApplicationDelegate,UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic,strong)AppConfigModel *config;

@end

