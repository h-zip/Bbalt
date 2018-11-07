//
//  JHBaseRequestService.h
//  Xinxy
//
//  Created by bory on 2018/5/4.
//  Copyright © 2018年 hans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "JHHudManager.h"
@protocol AFMultipartFormData;

typedef NS_ENUM(NSInteger, NetWorkStatus) {
    NetWorkStatusUnknown          = -1,  // 未知
    NetWorkStatusNotReachable     = 0,   // 无连接
    NetWorkStatusReachableViaWWAN = 1,   // 3G
    NetWorkStatusReachableViaWiFi = 2,   // WiFi
};

typedef void(^RequestBlock)(BOOL requestSuccess, id response);

@interface JHBaseRequestService : NSObject
@property(nonatomic,strong)AFHTTPSessionManager* afSessionManager;
-(instancetype)initWithRequestHeaderDic:(NSDictionary*)headerDic;
-(instancetype)initWithCerSet:(NSSet*)cerSet
             RequestHeaderDic:(NSDictionary*)headerDic;
/** 检查网络状态 */
+ (void)netWorkStatus:(void(^)(NetWorkStatus))ret;

/** 上传数据 */
- (void)upLoadWithUrl:(NSString*)url
               Params:(NSDictionary*)params
             FormData:(void (^)(id<AFMultipartFormData> formData))formDataRet
             Progress:(void(^)(NSProgress* progress))progress
              Success:(RequestBlock)success
               Failed:(RequestBlock)failed;

/** Post请求 */
- (void)postRequestWithUrl:(NSString*)url
                    Params:(NSDictionary*)params
                NeedHandle:(BOOL)needHandle
               RequestBlock:(RequestBlock)requestBlock;
- (void)postRequestWithUrl:(NSString *)url
                       Arr:(NSArray *)params
                NeedHandle:(BOOL)needHandle
               RequestBlock:(RequestBlock)requestBlock;

/** Patch请求 */
- (void)patchRequestWithUrl:(NSString*)url
                     Params:(NSDictionary*)params
                 NeedHandle:(BOOL)needHandle
                RequestBlock:(RequestBlock)requestBlock;

/** Put请求 */
- (void)putRequestWithUrl:(NSString*)url
                   Params:(NSDictionary*)params
               NeedHandle:(BOOL)needHandle
              RequestBlock:(RequestBlock)requestBlock;

/** GET请求 */
- (void)getRequestWithUrl:(NSString*)url
                   Params:(NSDictionary*)params
               NeedHandle:(BOOL)needHandle
              RequestBlock:(RequestBlock)requestBlock;

///** 处理请求失败成功的统一方法 */
//- (void)handelRequestSuccess:(BOOL)success
//                 successBack:(void(^)())ret;

@end
