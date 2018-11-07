//
//  JHTestRequestService.h
//  Xinxy
//
//  Created by bory on 2018/5/4.
//  Copyright © 2018年 hans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JHRequestConstant.h"
#import "JHBaseRequestService.h"
#import "JHBaseResultModel.h"
#import "JHBaseResultHandler.h"
#import "JHUserManager.h"
typedef void(^TestRequestBlock)( BOOL success, id response);
typedef void (^VoidBlock)(void);
typedef void (^PackageRequestBlock)(NSArray *responses);
@interface JHTestRequestService : NSObject

+(void)checkAppTokenAvailableWithCallback:(VoidBlock)accessCallback Group:(dispatch_group_t)group;

+(void)checkUserTokenAvailableWithCallback:(VoidBlock)accessCallback Group:(dispatch_group_t)group;

+(void)postWithURL:(NSString*)url
               Dic:(NSDictionary*)dic
               Ret:(TestRequestBlock)ret;

+(void)postWithURLs:(NSArray*)urls
               Dics:(NSArray*)dics
               Ret:(PackageRequestBlock)ret;
@end
