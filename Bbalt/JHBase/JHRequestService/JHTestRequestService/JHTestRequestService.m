//
//  JHTestRequestService.m
//  Xinxy
//
//  Created by bory on 2018/5/4.
//  Copyright © 2018年 hans. All rights reserved.
//

#import "JHTestRequestService.h"

@implementation JHTestRequestService
static NSSet* _cerSet = nil;
+(NSSet*)cerSet{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"https" ofType:@"cer"];
        NSData * certData =[NSData dataWithContentsOfFile:cerPath];
        _cerSet = [[NSSet alloc] initWithObjects:certData, nil];
    });
    return _cerSet;
}
+(NSDictionary*)requestHeaderDic{
    NSMutableDictionary* headerDic = [@{
                                        @"AppId":@"21322",
                                        @"AppSecret":@"212121"
//                                        @"AppToken":[JHUserManager share].appTokenModel.AppToken,
//                                        @"Token":[JHUserManager share].tokenModel.Token,
//                                        @"AppVersion":[NSString stringWithFormat:@"%@.%@",[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"],[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]],
//                                        @"AppType":@"1"
                                        
                                        }mutableCopy];
    return [headerDic copy];
    
}
+(NSDictionary*)requestBodyDic{
    NSDictionary* bodyDic = @{};
    return bodyDic;
}
+(void)checkAppTokenAvailableWithCallback:(VoidBlock)accessCallback Group:(dispatch_group_t)group{
//    if ([[JHUserManager share] needAuthHandle]) {
//        [self postWithURL:@"" Dic:@{} Ret:^(BOOL success, id response) {
//            JHBaseResultModel *model = [JHBaseResultModel modelWithJSON:response];
//            NSLog(@"====================%@",model);
//            if ([JHBaseResultHandler shouldGotoSuccessCallBackBasedOnBaseResult:model]) {
//                [JHUserManager share].appTokenModel = [AppTokenModel modelWithJSON:model.R];
//                accessCallback();
//            }else{
//
//            }
//        }];
//    }else{
//        accessCallback();
//    }
    accessCallback();
}
+(void)checkUserTokenAvailableWithCallback:(VoidBlock)accessCallback Group:(dispatch_group_t)group{
//    if ([[JHUserManager share] needRefeshTokenHandle]) {
//        [self postWithURL:@"" Dic:@{} Ret:^(BOOL success, id response) {
//            JHBaseResultModel *model = [JHBaseResultModel modelWithJSON:response];
//            NSLog(@"====================%@",model);
//            if ([JHBaseResultHandler shouldGotoSuccessCallBackBasedOnBaseResult:model]) {
//                [JHUserManager share].tokenModel = [TokenModel modelWithJSON:model.R];
//                accessCallback();
//            }else{
//
//            }
//        }];
//    }else{
//        accessCallback();
//    }
    accessCallback();
}
+(void)postWithURL:(NSString *)url Dic:(NSDictionary *)dic Ret:(TestRequestBlock)ret{
    if (1) {
        [self checkAppTokenAvailableWithCallback:^{
            [self checkUserTokenAvailableWithCallback:^{
                NSString *turl = CombileUrl(url);
                NSMutableDictionary *body = [[self requestBodyDic]mutableCopy];
                NSDictionary *header = [self requestHeaderDic];
                [body addEntriesFromDictionary:dic];
                JHBaseRequestService *request = nil;
                if ([turl containsString:@"https"]) {
                    request = [[JHBaseRequestService alloc]initWithCerSet:[self cerSet] RequestHeaderDic:header];
                }else{
                    request = [[JHBaseRequestService alloc]initWithRequestHeaderDic:header];
                }
                [request postRequestWithUrl:turl Params:body NeedHandle:YES RequestBlock:^(BOOL requestSuccess, id response) {
                    JH_DebugRequest(turl, header, body, response);
                    ret(requestSuccess,response);
                }];
            } Group:nil];
        } Group:nil];
    }else{
        ret(NO,nil);
    }
}
+(void)postWithURLs:(NSArray*)urls
               Dics:(NSArray*)dics
                Ret:(PackageRequestBlock)ret{
    if ([[AFNetworkReachabilityManager sharedManager]isReachable]) {
        dispatch_group_t group = dispatch_group_create();
        NSMutableArray * res = [@[]mutableCopy];
        [self checkAppTokenAvailableWithCallback:^{
            [self checkUserTokenAvailableWithCallback:^{
                for (int i = 0; i<urls.count; i++) {
                    dispatch_group_enter(group);
                    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                        res[i] = [NSData data];
                        NSString *turl = CombileUrl(urls[i]);
                        NSMutableDictionary *body = [[self requestBodyDic]mutableCopy];
                        [body addEntriesFromDictionary:dics[i]];
                        JHBaseRequestService *request = nil;
                        if ([turl containsString:@"https"]) {
                            request = [[JHBaseRequestService alloc]initWithCerSet:[self cerSet] RequestHeaderDic:[self requestHeaderDic]];
                        }else{
                            request = [[JHBaseRequestService alloc]initWithRequestHeaderDic:[self requestHeaderDic]];
                        }
                        [request postRequestWithUrl:turl Params:body NeedHandle:YES RequestBlock:^(BOOL requestSuccess, id response) {
                            res[i] = response;
                            dispatch_group_leave(group);
                        }];
                    });
                }
            } Group:group];
        } Group:group];
        dispatch_group_notify(group, dispatch_get_main_queue(), ^{
            ret(res);
        });
    }else{
        ret(nil);
    }
}
@end
