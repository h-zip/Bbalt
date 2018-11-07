//
//  JHBaseRequestService.m
//  Xinxy
//
//  Created by bory on 2018/5/4.
//  Copyright © 2018年 hans. All rights reserved.
//

#import "JHBaseRequestService.h"

@implementation JHBaseRequestService
static bool _canListen = NO;
-(instancetype)initWithCerSet:(NSSet*)cerSet RequestHeaderDic:(NSDictionary*)headerDic{
    if (self = [super init]) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration ephemeralSessionConfiguration];
        self.afSessionManager = [[AFHTTPSessionManager alloc]initWithBaseURL:[NSURL URLWithString:DevelopHost]sessionConfiguration:config];
        self.afSessionManager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
        [self.afSessionManager.securityPolicy setAllowInvalidCertificates:YES];
        [self.afSessionManager.securityPolicy setPinnedCertificates:cerSet];
        self.afSessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
        for (NSString *httpHeaderField in headerDic.allKeys) {
            NSString *value = headerDic[httpHeaderField];
            [self.afSessionManager.requestSerializer setValue:value forHTTPHeaderField:httpHeaderField];
        }
        self.afSessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    return self;
}
-(instancetype)initWithRequestHeaderDic:(NSDictionary*)headerDic{
    if (self = [super init]) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration ephemeralSessionConfiguration];
        self.afSessionManager = [[AFHTTPSessionManager alloc]initWithBaseURL:[NSURL URLWithString:DevelopHost]sessionConfiguration:config];
        self.afSessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
        for (NSString *httpHeaderField in headerDic.allKeys) {
            NSString *value = headerDic[httpHeaderField];
            [self.afSessionManager.requestSerializer setValue:value forHTTPHeaderField:httpHeaderField];
        }
        self.afSessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    return self;
}
-(void)dealloc{
    [self.afSessionManager invalidateSessionCancelingTasks:NO];
}
+ (void)netWorkStatus:(void (^)(NetWorkStatus))ret{
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        _canListen = YES;
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                ret(NetWorkStatusUnknown);
                break;
            case AFNetworkReachabilityStatusNotReachable:
                ret(NetWorkStatusNotReachable);
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                ret(NetWorkStatusReachableViaWWAN);
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                ret(NetWorkStatusReachableViaWiFi);
                break;
            default:
                break;
        }
    }];
    
}
/** post请求 */
- (void)postRequestWithUrl:(NSString *)url Params:(NSDictionary *)params NeedHandle:(BOOL)needHandle RequestBlock:(RequestBlock)requestBlock{
    __block id response = nil;
    [self.afSessionManager POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        response = responseObject;
        requestBlock(YES, response);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        response = error;
        requestBlock(NO, response);
    }];
}
/** post请求 arr*/
- (void)postRequestWithUrl:(NSString *)url Arr:(NSArray *)params NeedHandle:(BOOL)needHandle RequestBlock:(RequestBlock)requestBlock{
    __block id response = nil;
    [self.afSessionManager POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        response = responseObject;
        requestBlock(YES, response);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        response = error;
        requestBlock(NO, response);
    }];
}
/** get请求 */
- (void)getRequestWithUrl:(NSString *)url Params:(NSDictionary *)params NeedHandle:(BOOL)needHandle RequestBlock:(RequestBlock)requestBlock{
    __block id response = nil;
    [self.afSessionManager GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        response = responseObject;
        requestBlock(YES, response);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        response = error;
        requestBlock(NO, response);
    }];
}

- (void)upLoadWithUrl:(NSString *)url Params:(NSDictionary *)params FormData:(void (^)(id<AFMultipartFormData> formData))formDataRet Progress:(void (^)(NSProgress *))progress Success:(RequestBlock)success Failed:(RequestBlock)failed{
    __block id response = nil;
    [self.afSessionManager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if (formDataRet) {
            formDataRet(formData);
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        //DLog(@"\n请求进度%lf",1.0 *uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        response = responseObject;
        success(YES, response);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        response = error;
        failed(NO, response);
    }];
}

- (void)putRequestWithUrl:(NSString *)url Params:(NSDictionary *)params NeedHandle:(BOOL)needHandle RequestBlock:(RequestBlock)requestBlock{
    __block id response = nil;
    [self.afSessionManager PUT:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        response = responseObject;
        requestBlock(YES, response);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        response = error;
        requestBlock(NO, response);
    }];
}

- (void)patchRequestWithUrl:(NSString *)url Params:(NSDictionary *)params NeedHandle:(BOOL)needHandle RequestBlock:(RequestBlock)requestBlock{
    __block id response = nil;
    [self.afSessionManager PATCH:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        response = responseObject;
        requestBlock(YES, response);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        response = error;
        requestBlock(NO, response);
    }];
}
@end
