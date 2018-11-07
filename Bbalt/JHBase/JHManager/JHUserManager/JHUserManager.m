//
//  JHUserManager.m
//  Ubtms-boss
//
//  Created by hjh on 17/7/27.
//  Copyright © 2017年 com. All rights reserved.
//

#import "JHUserManager.h"
#import "NSDate+Category.h"
#import "JHHudManager.h"
@interface JHUserManager()

@property(nonatomic,assign)BOOL needRelogin;
@property(nonatomic,assign)BOOL needRefeshToken;
@property(nonatomic,assign)BOOL isLogin;
@property(nonatomic,assign)BOOL needAuth;
@end

#define UserTokenPlist @"userToken.plist"
#define AppTokenPlist @"appToken.plist"
#define QNTokenPlist @"qnToken.plist"
#define IMTokenPlist @"imToken.plist"
#define CityPlist @"city.plist"
#define ShoppingCarPlist @"shopingCar.plist"
#define JPushPlist @"jPush.plist"
@implementation JHUserManager
-(BOOL)needAuth{
    return _needAuth;
}
-(BOOL)alreadyLogin{
    return _isLogin;
}
-(void)setNeedRelogin:(BOOL)needRelogin{
    _needRelogin = needRelogin;
}
-(void)setNeedRefeshToken:(BOOL)needRefeshToken{
    _needRefeshToken = needRefeshToken;
}
-(void)checkAppTokenExpireTime{
    
    if (!self.appTokenModel){
        self.needAuth = YES;
    }else{
//        NSString* s = [self.appTokenModel.InvalidTime componentsSeparatedByString:@"+"][0];
//        NSString* t = [s componentsSeparatedByString:@"("][1];
//        //NSLog(@"%@",t);
//        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//        NSString *strDate = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:[t integerValue]/1000]];
        
        NSTimeInterval exp = [[NSDate dateString:self.appTokenModel.InvalidTime formatString:@"YYYY/MM/dd HH:mm:ss"]timeIntervalSince1970];
        NSTimeInterval now = [[NSDate date]timeIntervalSince1970];
        if (exp>=now) {
            self.needAuth = NO;
        }else{
            self.needAuth = YES;
        }
    }
}
-(void)checkTokenExpireTime{
    //DLog(@"%@",[JHUserManager shareInstance].accessTokenInfo);
    //DLog(@"%@",[JHUserManager shareInstance].refreshTokenInfo);
    //NSTimeInterval now = [[NSDate new] timeIntervalSince1970];
    //currentTime = [JHUserManager shareInstance].refreshTokenInfo.exp+1;
    
    if (!self.tokenModel) {
        self.needRelogin = YES;
        self.needRefeshToken = NO;
    }else{
//        NSString* s = [self.tokenModel.InvalidTime componentsSeparatedByString:@"+"][0];
//        NSString* t = [s componentsSeparatedByString:@"("][1];
//        //NSLog(@"%@",t);
//        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//        NSString *strDate = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:[t integerValue]/1000]];
        
        NSTimeInterval exp = [[NSDate dateString:self.tokenModel.InvalidTime formatString:@"YYYY/MM/dd HH:mm:ss"]timeIntervalSince1970];
        NSTimeInterval now = [[NSDate date]timeIntervalSince1970];
        if (exp>=now) {
            self.needRelogin = NO;
            self.needRefeshToken = NO;
        }else{
            self.needRelogin = NO;
            self.needRefeshToken = YES;
        }
    }
}
-(BOOL)firstEnter{
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"first_enter"]||[[NSUserDefaults standardUserDefaults] boolForKey:@"first_enter"]==NO) {
//        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"first_enter"];
//        [[NSUserDefaults standardUserDefaults] synchronize];
        return YES;
    }else{
        return NO;
    }
}
-(BOOL)needRefeshTokenHandle{
    [self checkTokenExpireTime];
    return self.needRefeshToken;
}
-(BOOL)needLoginHandle{
    [self checkTokenExpireTime];
    return self.needRelogin;
}
-(BOOL)needAuthHandle{
    [self checkAppTokenExpireTime];
    return self.needAuth;
}
-(BOOL)needDownloadCityList{
    NSString *cachePaht = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    
    NSString *filePath = [cachePaht stringByAppendingPathComponent:CityPlist];
    return ![[NSFileManager defaultManager]fileExistsAtPath:filePath];
}
-(void)login{
    self.isLogin = YES;
}
-(void)logout{
    self.isLogin = NO;
    self.tokenModel = nil;
    self.iMTokenModel = nil;
    self.shoppingCar = nil;
    //self.jPushRegistrationModel = nil;
}
-(NSData*)deviceToken{
    if (!_deviceToken) {
        _deviceToken = [[NSData alloc]init];
    }
    return _deviceToken;
}
-(void)setShoppingCar:(NSMutableDictionary *)shoppingCar{
    _shoppingCar = shoppingCar;
    if (_shoppingCar) {
        [self saveShoppingCarToPlist];
    }else{
        [self deleteShoppingCarPlist];
    }
}
-(void)setJPushRegistrationModel:(JPushRegistrationModel *)jPushRegistrationModel{
    _jPushRegistrationModel = jPushRegistrationModel;
    if (_jPushRegistrationModel) {
        [self saveJPushToPlist];
    }else{
        [self deleteJPushPlist];
    }
}
-(void)setQiniuTokenModel:(QNTokenModel *)qiniuTokenModel{
    _qiniuTokenModel = qiniuTokenModel;
    if (_qiniuTokenModel) {
        [self saveQNTokenToPlist];
    }else{
        [self deleteQNTokenPlist];
    }
}
-(void)setTokenModel:(TokenModel *)tokenModel{
    _tokenModel = tokenModel;
    if (_tokenModel) {
        [self saveUserTokenToPlist];
    }else{
        [self deleteUserTokenPlist];
    }
}
-(void)setAppTokenModel:(AppTokenModel *)appTokenModel{
    _appTokenModel = appTokenModel;
    if (_appTokenModel) {
        [self saveAppTokenToPlist];
    }else{
        [self deleteAppTokenPlist];
    }
}
-(void)setIMTokenModel:(IMTokenModel *)iMTokenModel{
    _iMTokenModel = iMTokenModel;
    if (_iMTokenModel) {
        [self saveImTokenToPlist];
    }else{
        [self deleteImTokenPlist];
    }
}
+(instancetype)shareInstance{
    static JHUserManager *_JHUserManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _JHUserManager = [[self alloc]init];
        //[_JHUserManager checkTokenExpireTime];
        _JHUserManager.isLogin = NO;
        _JHUserManager.needAuth = YES;
    });
    return _JHUserManager;
}
-(instancetype)init{
    if (self = [super init]) {
        [self loadUserTokenFromPlist];
        [self loadAppTokenFromPlist];
        [self loadQNTokenFromPlist];
        [self loadImTokenFromPlist];
        [self loadShoppingCarFromPlist];
        [self loadJPushFromPlist];
    }
    return self;
}
-(NSMutableDictionary*)getCityPlist{
    NSString *cachePaht = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    
    NSString *filePath = [cachePaht stringByAppendingPathComponent:CityPlist];
    
    if ([[NSFileManager defaultManager]fileExistsAtPath:filePath]) {
        NSMutableDictionary *plistDic = [[NSMutableArray alloc] initWithContentsOfFile:filePath][0];
        
        return plistDic;
        
    }else{
        return nil;
    }
}
- (NSString *)headerToken{
    NSString* headerToken = [@"Bearer " stringByAppendingString:self.tokenModel.Token];
    //DLog(@"token ====== %@",headerToken);
    return headerToken;
}
-(void)loadQNTokenFromPlist{
    NSString *cachePaht = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    
    NSString *filePath = [cachePaht stringByAppendingPathComponent:QNTokenPlist];
    
    if ([[NSFileManager defaultManager]fileExistsAtPath:filePath]) {
        NSMutableDictionary *plistDic = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
        self.qiniuTokenModel = [QNTokenModel modelWithDic:plistDic];
    }
}
-(void)loadImTokenFromPlist{
    NSString *cachePaht = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    
    NSString *filePath = [cachePaht stringByAppendingPathComponent:IMTokenPlist];
    
    if ([[NSFileManager defaultManager]fileExistsAtPath:filePath]) {
        NSMutableDictionary *plistDic = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
        self.iMTokenModel = [IMTokenModel modelWithDic:plistDic];
    }
}
-(void)saveQNTokenToPlist{
    NSString *cachePaht = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    
    NSString *filePath = [cachePaht stringByAppendingPathComponent:QNTokenPlist];
    
    [[self.qiniuTokenModel dicWithModel]writeToFile:filePath atomically:YES];
}

-(void)deleteQNTokenPlist{
    NSString *cachePaht = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    
    NSString *filePath = [cachePaht stringByAppendingPathComponent:QNTokenPlist];
    if ([[NSFileManager defaultManager]fileExistsAtPath:filePath]) {
        [[NSFileManager defaultManager]removeItemAtPath:filePath error:nil];
    }
}
-(void)saveShoppingCarToPlist{
    NSString *cachePaht = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    
    NSString *filePath = [cachePaht stringByAppendingPathComponent:ShoppingCarPlist];
    
    [self.shoppingCar writeToFile:filePath atomically:YES];
}
-(void)deleteShoppingCarPlist{
    NSString *cachePaht = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    
    NSString *filePath = [cachePaht stringByAppendingPathComponent:ShoppingCarPlist];
    if ([[NSFileManager defaultManager]fileExistsAtPath:filePath]) {
        [[NSFileManager defaultManager]removeItemAtPath:filePath error:nil];
    }
}
-(void)loadShoppingCarFromPlist{
    NSString *cachePaht = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    
    NSString *filePath = [cachePaht stringByAppendingPathComponent:ShoppingCarPlist];
    
    if ([[NSFileManager defaultManager]fileExistsAtPath:filePath]) {
        NSMutableDictionary *shoppingCarArr = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
        self.shoppingCar = shoppingCarArr;
    }
}
-(void)loadUserTokenFromPlist{
    NSString *cachePaht = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    
    NSString *filePath = [cachePaht stringByAppendingPathComponent:UserTokenPlist];
    
    if ([[NSFileManager defaultManager]fileExistsAtPath:filePath]) {
        NSMutableDictionary *plistDic = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
        self.tokenModel = [TokenModel modelWithDic:plistDic];
    }
}
-(void)loadAppTokenFromPlist{
    NSString *cachePaht = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    
    NSString *filePath = [cachePaht stringByAppendingPathComponent:AppTokenPlist];
    
    if ([[NSFileManager defaultManager]fileExistsAtPath:filePath]) {
        NSMutableDictionary *plistDic = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
        self.appTokenModel = [AppTokenModel modelWithDic:plistDic];
    }
}
-(void)loadJPushFromPlist{
    NSString *cachePaht = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    
    NSString *filePath = [cachePaht stringByAppendingPathComponent:JPushPlist];
    
    if ([[NSFileManager defaultManager]fileExistsAtPath:filePath]) {
        NSMutableDictionary *plistDic = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
        self.jPushRegistrationModel = [JPushRegistrationModel modelWithDic:plistDic];
    }
}
-(void)saveAppTokenToPlist{
    NSString *cachePaht = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    
    NSString *filePath = [cachePaht stringByAppendingPathComponent:AppTokenPlist];
    
    [[self.appTokenModel dicWithModel]writeToFile:filePath atomically:YES];
}
-(void)saveUserTokenToPlist{
    NSString *cachePaht = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    
    NSString *filePath = [cachePaht stringByAppendingPathComponent:UserTokenPlist];
    
    [[self.tokenModel dicWithModel]writeToFile:filePath atomically:YES];
    //NSMutableDictionary *plistDic = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    //DLog(@"%@",plistDic);
}
-(void)saveImTokenToPlist{
    NSString *cachePaht = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    
    NSString *filePath = [cachePaht stringByAppendingPathComponent:IMTokenPlist];
    
    [[self.iMTokenModel dicWithModel]writeToFile:filePath atomically:YES];
    //NSMutableDictionary *plistDic = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    //DLog(@"%@",plistDic);
}
-(void)saveJPushToPlist{
    NSString *cachePaht = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    
    NSString *filePath = [cachePaht stringByAppendingPathComponent:JPushPlist];
    
    [[self.jPushRegistrationModel dicWithModel]writeToFile:filePath atomically:YES];
    //NSMutableDictionary *plistDic = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    //DLog(@"%@",plistDic);
}
-(void)saveCityPlistWithDic:(NSDictionary*)dic{
    NSString *cachePaht = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    
    NSString *filePath = [cachePaht stringByAppendingPathComponent:CityPlist];
    
    [dic writeToFile:filePath atomically:YES];
    //NSMutableDictionary *plistDic = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    //DLog(@"%@",plistDic);
}

-(void)deleteUserTokenPlist{
    NSString *cachePaht = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    
    NSString *filePath = [cachePaht stringByAppendingPathComponent:UserTokenPlist];
    if ([[NSFileManager defaultManager]fileExistsAtPath:filePath]) {
        [[NSFileManager defaultManager]removeItemAtPath:filePath error:nil];
    }
}
-(void)deleteAppTokenPlist{
    NSString *cachePaht = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    
    NSString *filePath = [cachePaht stringByAppendingPathComponent:AppTokenPlist];
    if ([[NSFileManager defaultManager]fileExistsAtPath:filePath]) {
        [[NSFileManager defaultManager]removeItemAtPath:filePath error:nil];
    }
}
-(void)deleteImTokenPlist{
    NSString *cachePaht = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    
    NSString *filePath = [cachePaht stringByAppendingPathComponent:IMTokenPlist];
    if ([[NSFileManager defaultManager]fileExistsAtPath:filePath]) {
        [[NSFileManager defaultManager]removeItemAtPath:filePath error:nil];
    }
}
-(void)deleteJPushPlist{
    NSString *cachePaht = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    
    NSString *filePath = [cachePaht stringByAppendingPathComponent:JPushPlist];
    if ([[NSFileManager defaultManager]fileExistsAtPath:filePath]) {
        [[NSFileManager defaultManager]removeItemAtPath:filePath error:nil];
    }
}
-(id)jwtDecodeWithJwtString:(NSString *)jwtStr{
    
    NSArray * segments = [jwtStr componentsSeparatedByString:@"."];
    NSString * base64String = [segments objectAtIndex:1];
    
    int requiredLength = (int)(4 *ceil((float)[base64String length]/4.0));
    int nbrPaddings = requiredLength - (int)[base64String length];
    if(nbrPaddings > 0){
        NSString * pading = [[NSString string] stringByPaddingToLength:nbrPaddings withString:@"=" startingAtIndex:0];
        base64String = [base64String stringByAppendingString:pading];
    }
    base64String = [base64String stringByReplacingOccurrencesOfString:@"-" withString:@"+"];
    base64String = [base64String stringByReplacingOccurrencesOfString:@"_" withString:@"/"];
    NSData * decodeData = [[NSData alloc] initWithBase64EncodedData:(NSData*)base64String options:0];
    NSString * decodeString = [[NSString alloc] initWithData:decodeData encoding:NSUTF8StringEncoding];
    NSDictionary * jsonDict = [NSJSONSerialization JSONObjectWithData:[decodeString dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil];
    return jsonDict;
}

@end
