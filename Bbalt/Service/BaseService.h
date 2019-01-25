//
//  BaseService.h
//  Bbalt
//
//  Created by bory on 2019/1/25.
//  Copyright © 2019年 hans. All rights reserved.
//

#import "JHTestRequestService.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseService : JHTestRequestService
+(void)loginWithDic:(NSDictionary*)dic
               Ret:(TestRequestBlock)ret;
+(void)logoutWithDic:(NSDictionary*)dic
                 Ret:(TestRequestBlock)ret;;
@end

NS_ASSUME_NONNULL_END
