//
//  JHDebugManager.h
//  Ubtms-boss
//
//  Created by hjh on 17/7/24.
//  Copyright © 2017年 com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JHRequestLogModel.h"
#import "JHRequestLogVC.h"
#define JH_DebugRequest(url,header,body,response) [[JHDebugManager share]storeRequestInfo:url Header:header Body:body Response:response]
@interface JHDebugManager : NSObject
@property(nonatomic,assign)BOOL requestDebug;
@property(nonatomic,strong)NSMutableArray<JHRequestLogModel*> *logArr;
@property(nonatomic,strong)JHButton *bugBtn;
@property(nonatomic,strong)JHRequestLogVC *logVC;
+(instancetype)share;
-(void)storeRequestInfo:(NSString*)url
                 Header:(NSDictionary*)header
                   Body:(NSDictionary*)body
               Response:(id)response;
-(void)resetLogs;
-(NSString *)convertToJsonData:(NSDictionary *)dict;
-(void)showLogs;
@end
