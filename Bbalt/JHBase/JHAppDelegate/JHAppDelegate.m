//
//  AppDelegate.m
//  Test
//
//  Created by bory on 2018/5/7.
//  Copyright © 2018年 hans. All rights reserved.
//

#import "JHAppDelegate.h"
#import <AlipaySDK/AlipaySDK.h>
#import <Bugly/Bugly.h>
@interface JHAppDelegate ()

@end

@implementation JHAppDelegate

-(AppConfigModel*)config{
    if (!_config) {
        _config = [[AppConfigModel alloc]init];
        _config.needJPush = NO;
        _config.needAliPay = NO;
        _config.needUShare = NO;
        _config.needBugly = NO;
    }
    return _config;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    requestHost = DevelopHost;
    [self configBugly];
    [self configJPush:launchOptions];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = JHNaviInstance.navi1;
    [self.window makeKeyAndVisible];
    [self configUShare];
    return YES;
}
-(void)configBugly{
    if (self.config.needBugly) {
        [Bugly startWithAppId:BuglyKey];
    }
}
-(void)configJPush:(NSDictionary*)launchOptions{
    if (self.config.needJPush) {
        [JHJPushInstance configJPush:launchOptions];
    }
}
-(void)configUShare{
    if (self.config.needUShare) {
        [JHShareInstance confitUShareSettings];
        [JHShareInstance configUSharePlatforms];
    }
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    
    /// Required - 注册 DeviceToken
    JHUserInstance.deviceToken = deviceToken;
    [JHJPushInstance registerDeviceToken:deviceToken];
}
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    //Optional
    NSLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    // Required, iOS 7 Support
    [JHJPushInstance handleRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
    [JHJPushInstance recievePushAction:application Info:userInfo];
    
}
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    // Required,For systems with less than or equal to iOS6
    [JHJPushInstance handleRemoteNotification:userInfo];
}
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options
{
    if ([url.host isEqualToString:@"safepay"]) {
        //跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
            [[NSNotificationCenter defaultCenter]postNotificationName:Ali_RESULT_NOTIFICATION object:nil userInfo:resultDic];
        }];
    }
    return YES;
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    if ([url.host isEqualToString:@"safepay"]) {
        //跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
            [[NSNotificationCenter defaultCenter]postNotificationName:Ali_RESULT_NOTIFICATION object:nil userInfo:resultDic];
        }];
        
    }
    if ([JHShareInstance handleOpenURL:url sourceApplication:sourceApplication annotation:annotation]) {
        
    }
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
