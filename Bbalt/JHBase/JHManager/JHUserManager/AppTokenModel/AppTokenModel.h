//
//  AppTokenModel.h
//  Xinxy
//
//  Created by bory on 2017/11/28.
//  Copyright © 2017年 hans. All rights reserved.
//
//Xinxy.App.Api.Application.Dto.SysAppIsv.SysAppIsvSingleResult {
//    Id (string, optional): ID ,
//    Name (string, optional): 名称 ,
//    AppId (string, optional): AppID ,
//    AppToken (string, optional): Token ,
//    AppSecret (string, optional): AppSecret ,
//    InvalidTime (string, optional): 有效日期
//}
#import "JHBaseModel.h"

@interface AppTokenModel : JHBaseModel
@property(nonatomic,strong)NSString *Id;
@property(nonatomic,strong)NSString *Name;
@property(nonatomic,strong)NSString *AppId;
@property(nonatomic,strong)NSString *AppToken;
@property(nonatomic,strong)NSString *AppSecret;
@property(nonatomic,strong)NSString *InvalidTime;
@end
