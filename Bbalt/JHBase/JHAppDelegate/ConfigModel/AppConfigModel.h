//
//  AppConfigModel.h
//  Test
//
//  Created by bory on 2018/5/10.
//  Copyright © 2018年 hans. All rights reserved.
//

#import "JHBaseModel.h"

@interface AppConfigModel : JHBaseModel
@property(nonatomic,assign)BOOL needJPush;
@property(nonatomic,assign)BOOL needAliPay;
@property(nonatomic,assign)BOOL needUShare;
@property(nonatomic,assign)BOOL needBugly;
@end
