//
//  JHUserManager.h
//  Ubtms-boss
//
//  Created by hjh on 17/7/27.
//  Copyright © 2017年 com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TokenModel.h"
#import "TokenInfoModel.h"
#import "AppTokenModel.h"
#import "QNTokenModel.h"
#import "IMTokenModel.h"
#import "JPushRegistrationModel.h"
@interface JHUserManager : NSObject
+(instancetype)share;
@property(nonatomic,strong)NSData* deviceToken;
@property(nonatomic,strong)AppTokenModel *appTokenModel;
@property(nonatomic,strong)TokenModel *tokenModel;
@property(nonatomic,strong)QNTokenModel* qiniuTokenModel;
@property(nonatomic,strong)IMTokenModel* iMTokenModel;
@property(nonatomic,strong)JPushRegistrationModel* jPushRegistrationModel;
@property(nonatomic,strong)NSMutableDictionary* shoppingCar;
@property(nonatomic,strong)NSString *liveRoomID;
- (NSString *)headerToken;

-(BOOL)firstEnter;
-(BOOL)needLoginHandle;
-(BOOL)needRefeshTokenHandle;
-(BOOL)needAuthHandle;
-(BOOL)needDownloadCityList;
-(void)login;
-(void)logout;
-(BOOL)alreadyLogin;
-(void)saveCityPlistWithDic:(NSDictionary*)dic;
-(NSMutableDictionary*)getCityPlist;

@end
