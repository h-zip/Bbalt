//
//  BaseService.m
//  Bbalt
//
//  Created by bory on 2019/1/25.
//  Copyright © 2019年 hans. All rights reserved.
//

#import "BaseService.h"
#define loginUrl @""
#define logoutUrl @""
@implementation BaseService
+(void)loginWithDic:(NSDictionary*)dic
                Ret:(TestRequestBlock)ret{
    [self postWithURL:loginUrl Dic:dic Ret:ret];
    
}
+(void)logoutWithDic:(NSDictionary*)dic
                 Ret:(TestRequestBlock)ret;{
    [self postWithURL:logoutUrl Dic:dic Ret:ret];
}
@end
