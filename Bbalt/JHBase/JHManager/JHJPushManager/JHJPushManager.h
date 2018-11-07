//
//  JHJPushManager.h
//  Xinxy
//
//  Created by bory on 2018/3/21.
//  Copyright © 2018年 hans. All rights reserved.
//

#import <Foundation/Foundation.h>
// 引入JPush功能所需头文件
#import "JPUSHService.h"
// iOS10注册APNs所需头文件
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif
@interface JHJPushManager : NSObject<JPUSHRegisterDelegate>
+(instancetype)shareInstance;
@property(nonatomic,strong)NSDictionary *userInfo;
@property(nonatomic,assign)BOOL isLaunch;
-(void)configJPush:(NSDictionary*)launchOptions;
-(void)recievePushAction:(UIApplication *)application Info:(NSDictionary *)userInfo;
-(void)registerDeviceToken:(NSData *)deviceToken;
-(void)handleRemoteNotification:(NSDictionary *)remoteInfo;
-(void)handleUserInfo;
@end
