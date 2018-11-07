//
//  JHJPushManager.m
//  Xinxy
//
//  Created by bory on 2018/3/21.
//  Copyright © 2018年 hans. All rights reserved.
//

#import "JHJPushManager.h"


#define liveBroadcastRemindingByDay @"liveBroadcastRemindingByDay"
#define liveBroadcastRemindingByHour @"liveBroadcastRemindingByHour"
#define liveBroadcastRemindingByFiveMinute @"liveBroadcastRemindingByFiveMinute"
#define liveBeginTimeChangeRemind @"liveBeginTimeChangeRemind"
#define liveCancel @"liveCancel"
#define memberExpirationReminding @"memberExpirationReminding"
#define commodityShipmentReminding @"commodityShipmentReminding"
#define activitiesBeginToRemind @"activitiesBeginToRemind"
#define activitiesChange @"activitiesChange"
#define activitiesCancel @"activitiesCancel"
#define orderPaySuccessByPush @"orderPaySuccessByPush"
#define coupon2memberByPush @"coupon2memberByPush"
#define systemAnnouncement @"systemAnnouncement"
#define memStoreNotice @"memStoreNotice"
#define messageInfoType3 @"messageInfoType3"
#define memberShopAuthenticationTrueByPush @"memberShopAuthenticationTrueByPush"
#define memberShopAuthenticationFalseByPush @"memberShopAuthenticationFalseByPush"
#define memberAdd2StoreByQrCodeAndPush @"memberAdd2StoreByQrCodeAndPush"
#define platformDeleteStoreByPush @"platformDeleteStoreByPush"

@implementation JHJPushManager
+(instancetype)shareInstance{
    static JHJPushManager *_jpManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _jpManager = [[self alloc]init];
    });
    return _jpManager;
}
-(instancetype)init{
    if (self = [super init]) {
        NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
        
        [defaultCenter addObserver:self
                          selector:@selector(networkDidReceiveMessage:)
                              name:kJPFNetworkDidReceiveMessageNotification
                            object:nil];
    }
    return self;
}
-(void)configJPush:(NSDictionary*)launchOptions{
    NSDictionary * userInfo = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
    [self configJPushWithOptions:launchOptions];
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    [JPUSHService resetBadge];
    if(userInfo)  {
        self.userInfo = userInfo;
        self.isLaunch = YES;
    }
}
-(void)configJPushWithOptions:(NSDictionary *)launchOptions{
    //Required
    //notice: 3.0.0及以后版本注册可以这样写，也可以继续用之前的注册方式
    JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
    entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        // 可以添加自定义categories
        // NSSet<UNNotificationCategory *> *categories for iOS10 or later
        // NSSet<UIUserNotificationCategory *> *categories for iOS8 and iOS9
    }
    [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
    [JPUSHService setupWithOption:launchOptions appKey:JPushKey
                          channel:@"App Store"
                 apsForProduction:NO
            advertisingIdentifier:nil];
    [JPUSHService registrationIDCompletionHandler:^(int resCode, NSString *registrationID) {
        NSLog(@"resCode : %d,registrationID: %@",resCode,registrationID);
        if (registrationID&&![registrationID isEqualToString:@""]) {
            JPushRegistrationModel *pushModel = [[JPushRegistrationModel alloc]init];
            pushModel.RegistrationID = registrationID;
            [JHUserManager shareInstance].jPushRegistrationModel = pushModel;
        }
    }];
}
-(void)recievePushAction:(UIApplication *)application Info:(NSDictionary *)userInfo{
    int badge =[userInfo[@"aps"][@"badge"] intValue];
    badge--;
    [JPUSHService setBadge:badge];
    [UIApplication sharedApplication].applicationIconBadgeNumber = badge;
    /**
     *  iOS的应用程序分为3种状态
     *      1、前台运行的状态UIApplicationStateActive；
     *      2、后台运行的状态UIApplicationStateInactive；
     *      3、app关闭状态UIApplicationStateBackground。
     */
    NSLog(@"userInfo---:%@", userInfo);
    // 1、应用正处在前台状态下，不会收到推送消息，这里创建一个UIAlertController来接受消息
    if (application.applicationState == UIApplicationStateActive) {
        self.userInfo = userInfo;
        [self handleUserInfo];
        
    } else if (application.applicationState == UIApplicationStateInactive) {
        // 处于后台运行状态时
        NSLog(@"---UIApplicationStateInactive---");
        
        if (!self.isLaunch) {
            self.userInfo = userInfo;
            [self handleUserInfo];
        }else{
            self.isLaunch = NO;
        }
    }
    // badge清零
    [application setApplicationIconBadgeNumber:0];
    [JPUSHService resetBadge];
}
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger options))completionHandler API_AVAILABLE(ios(10.0)){
    
}
//iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)())completionHandler  API_AVAILABLE(ios(10.0)){
    // Required
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    completionHandler();// 系统要求执行这个方法
    [self recievePushAction:[UIApplication sharedApplication] Info:userInfo];
}
-(void)registerDeviceToken:(NSData *)deviceToken{
     [JPUSHService registerDeviceToken:deviceToken];
}
-(void)handleRemoteNotification:(NSDictionary *)remoteInfo{
    [JPUSHService handleRemoteNotification:remoteInfo];
}
- (void)networkDidReceiveMessage:(NSNotification *)notification{
    NSDictionary *userInfo = [notification userInfo];
    NSString *title = [userInfo valueForKey:@"title"];
    NSString *content = [userInfo valueForKey:@"content"];
    NSDictionary *extra = [userInfo valueForKey:@"extras"];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    
    NSString *currentContent = [NSString
                                stringWithFormat:
                                @"收到自定义消息:%@\ntitle:%@\ncontent:%@\nextra:%@\n",
                                [NSDateFormatter localizedStringFromDate:[NSDate date]
                                                               dateStyle:NSDateFormatterNoStyle
                                                               timeStyle:NSDateFormatterMediumStyle],
                                title, content, extra];
    NSLog(@"%@", currentContent);
}

-(void)handleUserInfo{

    if (self.userInfo)
    {
        self.userInfo = nil;
    }
}
@end
