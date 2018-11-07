//
//  NSString+Verification.h
//  Ubtms-boss
//
//  Created by hjh on 17/7/28.
//  Copyright © 2017年 com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Verification)
#pragma mark - 是否为空
+ (BOOL)isEmptyOrWhitespace:(NSString*)string;

#pragma mark 判断字符串是否为web端的null,是返回@""
+ (NSString*)stringVerifyEmptyWithContent:(NSString*)content;

#pragma mark 验证转成NSNumber
- (BOOL)VerifyToNSNumber;

#pragma mark 验证车牌
- (BOOL)VerifyCarNo;

#pragma mark 验证手机号码
- (BOOL)VerifyPhone;

#pragma mark 验证短信验证码
- (BOOL)VerifySMSNote;

#pragma mark 验证是否合法密码
- (BOOL)VerifyPwd;

#pragma mark - 验证是否数字
- (BOOL)VerifyNum;

#pragma mark - md5
+ (NSString *) md5:(NSString *)input;

#pragma mark 转换钱的小数点位数，只有小数点后一位的只取到小数点后1位，是整数的取整数,最多保留后2位
- (NSString*)getMoneyString;

- (NSString*)getMoneyStringWithDouble:(double)value;
@end
