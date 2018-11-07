//
//  JHBaseResultHandler.h
//  Xinxy
//
//  Created by bory on 2018/5/4.
//  Copyright © 2018年 hans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JHBaseResultModel.h"
@interface JHBaseResultHandler : NSObject
+(instancetype)share;
+(BOOL)shouldGotoSuccessCallBackBasedOnBaseResult:(JHBaseResultModel*)baseResultModel;
+(void)handleFailResult:(JHBaseResultModel*)baseResultModel;
@end
