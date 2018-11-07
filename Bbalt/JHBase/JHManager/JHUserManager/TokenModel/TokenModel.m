//
//  TokenModel.m
//  Ubtms-boss
//
//  Created by hjh on 17/7/27.
//  Copyright © 2017年 com. All rights reserved.
//


#import "TokenModel.h"
//@property (nonatomic,strong)NSString *Id;
//@property (nonatomic,strong)NSString *Account;
//@property (nonatomic,strong)NSString *HeadPortrait;
//@property (nonatomic,assign)NSInteger Gender;
//@property (nonatomic,assign)NSInteger Age;
//@property (nonatomic,strong)NSString *Name;
//@property (nonatomic,assign)NSInteger Type;
//@property (nonatomic,strong)NSString *MemStoreId;
//@property (nonatomic,assign)NSInteger Status;
//@property (nonatomic,strong)NSString *Token;
//@property (nonatomic,strong)NSString *InvalidTime;
//@property (nonatomic,strong)NSString *Position;
//@property (nonatomic,strong)NSString *Address;
//@property (nonatomic,strong)NSString *Phone;
@implementation TokenModel
-(NSString*)Id{
    if (!_Id) {
        _Id = @"";
    }
    return _Id;
}

-(NSString*)Gender{
    if (!_Gender) {
        _Gender = @"";
    }
    return _Gender;
}
-(NSString*)Age{
    if (!_Age) {
        _Age = @"";
    }
    return _Age;
}
-(NSString*)Type{
    if (!_Type) {
        _Type = @"";
    }
    return _Type;
}
-(NSString*)Status{
    if (!_Status) {
        _Status = @"";
    }
    return _Status;
}
-(NSString*)Account{
    if (!_Account) {
        _Account = @"";
    }
    return _Account;
}
-(NSString*)HeadPortrait{
    if (!_HeadPortrait) {
        _HeadPortrait = @"";
    }
    return _HeadPortrait;
}
-(NSString*)Name{
    if (!_Name) {
        _Name = @"";
    }
    return _Name;
}
-(NSString*)MemStoreId{
    if (!_MemStoreId) {
        _MemStoreId = @"";
    }
    return _MemStoreId;
}
-(NSString*)Token{
    if (!_Token) {
        _Token = @"";
    }
    return _Token;
}
-(NSString*)InvalidTime{
    if (!_InvalidTime) {
        _InvalidTime = @"";
    }
    return _InvalidTime;
}
-(NSString*)Phone{
    if (!_Phone) {
        _Phone = @"";
    }
    return _Phone;
}
-(NSString*)Position{
    if (!_Position) {
        _Position = @"";
    }
    return _Position;
}
-(NSString*)Address{
    if (!_Address) {
        _Address = @"";
    }
    return _Address;
}
-(NSString*)PassWord{
    if (!_PassWord) {
        _PassWord = @"";
    }
    return _PassWord;
}
-(NSString*)Birthday{
    if (!_Birthday) {
        _Birthday = @"";
    }
    return _Birthday;
}

-(NSString*) Point{
    if (!_Point) {
        _Point = @"";
    }
    return _Point;
}
-(NSString*)MemStoreName{
    if (!_MemStoreName) {
        _MemStoreName = @"";
    }
    return _MemStoreName;
}
@end
