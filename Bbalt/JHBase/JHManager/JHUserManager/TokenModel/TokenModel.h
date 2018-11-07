//
//  TokenModel.h
//  Ubtms-boss
//
//  Created by hjh on 17/7/27.
//  Copyright © 2017年 com. All rights reserved.
//

//Xinxy.App.Api.Application.Dto.MemInfo.MemInfoLoginResult {
//    Id (string, optional): ID ,
//    Account (string, optional): 账号 ,
//    HeadPortrait (string, optional): 头像 ,
//    Gender (integer, optional): 性别1=男2=女3=其他 ,
//    Age (integer, optional): 年龄 ,
//    Name (string, optional): 名称 ,
//    Position (string, optional): 地区 ,
//    Address (string, optional): 地址 ,
//    Phone (string, optional): 电话 ,
//    Type (integer, optional): 会员类型1=老板2=店长3=员工 ,
//    MemStoreId (string, optional): 店铺ID ,
//    Status (integer, optional): 会员状态1=认证2=未认证 ,
//    Token (string, optional): 会话Token ,
//    InvalidTime (string, optional): 有效日期
//    }
//Xinxy.App.Api.Application.Dto.MemInfo.MemInfoSingleResult {
//    Id (string, optional): ID ,
//    Account (string, optional): 账号 ,
//    PassWord (string, optional): 密码 ,
//    HeadPortrait (string, optional): 头像 ,
//    Gender (string, optional): 性别1=男2=女3=其他 ,
//    Age (string, optional): 年龄 ,
//    Birthday (string, optional): 生日 ,
//    Name (string, optional): 名称 ,
//    Position (string, optional): 地区 ,
//    Address (string, optional): 地址 ,
//    Cover (string, optional): 封面 ,
//    Content (string, optional): 介绍（富文本） ,
//    Title (string, optional): 抬头 ,
//    Phone (string, optional): 电话 ,
//    Type (string, optional): 会员类型1=老板2=店长3=员工4=普通会员5=不是会员 ,
//    IsLector (string, optional): 是否是讲师1=是2=不是 ,
//    IsStar (string, optional): 是否是明星1=是2=不是 ,
//    LectorCategoryId (string, optional): 讲师分类ID ,
//    MemStoreId (string, optional): 店铺ID ,
//    Status (string, optional): 会员状态1=认证2=未认证
//    }
//Xinxy.App.Api.Application.Dto.MemInfo.MemInfoSingleResult {
//    Id (string, optional): ID ,
//    Account (string, optional): 账号 ,
//    PassWord (string, optional): 密码 ,
//    HeadPortrait (string, optional): 头像 ,
//    Gender (string, optional): 性别1=男2=女3=其他 ,
//    Age (string, optional): 年龄 ,
//    Birthday (string, optional): 生日 ,
//    Name (string, optional): 名称 ,
//    Position (string, optional): 地区 ,
//    Address (string, optional): 地址 ,
//    Cover (string, optional): 封面 ,
//    Content (string, optional): 介绍（富文本） ,
//    Title (string, optional): 抬头 ,
//    Phone (string, optional): 电话 ,
//    Type (string, optional): 会员类型1=老板2=店长3=员工4=普通会员5=不是会员 ,
//    IsLector (string, optional): 是否是讲师1=是2=不是 ,
//    IsStar (string, optional): 是否是明星1=是2=不是 ,
//    LectorCategoryId (string, optional): 讲师分类ID ,
//    LevelCategoryId (string, optional): 会员等级分类ID ,
//    LevelName (string, optional): 会员等级名称 ,
//    LevelDiscount (string, optional): 会员商城折扣 ,
//    LevelValidTime (string, optional): 会员等级有效期 ,
//    Point (string, optional): 积分 ,
//    TerminalType (string, optional): 终端类型1-IOS,2-android,3-winphone ,
//    PushReceiveId (string, optional): 推送接收ID ,
//    MemStoreId (string, optional): 店铺ID ,
//    Status (string, optional): 会员状态1=认证2=未认证 ,
//    InviteMemId (string, optional): 邀请会员Id ,
//    MemStoreCount (string, optional): 店铺数量
//    }
//    PendingPaymentCount (string, optional): 待付款数量 ,
//ToBeDeliveredCount (string, optional): 待发货数量 ,
//ToBeReceivedCount (string, optional): 待收货数量 ,
//BeEvaluatedCount (string, optional): 待评价数量 ,
//AllCount (string, optional): 待评价数量
#import "JHBaseModel.h"

@interface TokenModel : JHBaseModel
@property (nonatomic,strong)NSString *Token;
@property (nonatomic,strong)NSString *InvalidTime;
@property (nonatomic,strong)NSString *Id;
@property (nonatomic,strong)NSString *Account;
@property (nonatomic,strong)NSString *PassWord;
@property (nonatomic,strong)NSString *HeadPortrait;
@property (nonatomic,assign)NSString *Gender;
@property (nonatomic,assign)NSString *Age;
@property (nonatomic,strong)NSString *Birthday;
@property (nonatomic,strong)NSString *Name;
@property (nonatomic,strong)NSString *Position;
@property (nonatomic,assign)NSString *Address;
@property (nonatomic,strong)NSString *Cover;
@property (nonatomic,strong)NSString *Content;
@property (nonatomic,strong)NSString *Title;
@property (nonatomic,strong)NSString *Phone;
@property (nonatomic,strong)NSString *Type;
@property (nonatomic,strong)NSString *IsLector;
@property (nonatomic,strong)NSString *IsStar;
@property (nonatomic,strong)NSString *LectorCategoryId;
@property (nonatomic,strong)NSString *Point;
@property (nonatomic,strong)NSString *MemStoreId;
@property (nonatomic,strong)NSString *LevelName;
@property (nonatomic,strong)NSString *LevelValidTime;
@property (nonatomic,strong)NSString *Status;
@property (nonatomic,strong)NSString *IsNullPassWord;
@property (nonatomic,strong)NSString *PushReceiveId;
@property (nonatomic,strong)NSString *LevelDiscount;
@property (nonatomic,strong)NSString *MemStoreCount;
@property (nonatomic,strong)NSString *LevelCategoryId;
@property (nonatomic,strong)NSString *Level;
@property (nonatomic,strong)NSString *MemStoreName;
@property (nonatomic,strong)NSString *PendingPaymentCount;
@property (nonatomic,strong)NSString *ToBeDeliveredCount;
@property (nonatomic,strong)NSString *ToBeReceivedCount;
@property (nonatomic,strong)NSString *BeEvaluatedCount;
@property (nonatomic,strong)NSString *AllCount;
@end
