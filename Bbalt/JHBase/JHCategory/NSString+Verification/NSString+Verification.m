//
//  NSString+Verification.m
//  Ubtms-boss
//
//  Created by hjh on 17/7/28.
//  Copyright © 2017年 com. All rights reserved.
//

#import "NSString+Verification.h"
#import<CommonCrypto/CommonDigest.h>
@implementation NSString (Verification)
#pragma mark - 是否为空
+ (BOOL)isEmptyOrWhitespace:(NSString*)string
{
    if((id)string==[NSNull null] || string==nil || string==NULL)
        return YES;
    
    if(!string)
        return YES;
    
    if(string.length<=0)
        return YES;
    
    if([string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length<=0)
        return YES;
    
    return NO;
}

#pragma mark 判断字符串是否为web端的null,是返回@""
+ (NSString*)stringVerifyEmptyWithContent:(NSString*)content
{
    if(content== nil || content == NULL || [content isEqual:[NSNull null]]||[content isEqual:@"(null)"])
        return @"";
    
    return content;
}

#pragma mark 验证转成NSNumber
- (BOOL)VerifyToNSNumber
{
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    
    NSNumber *ber = nil;
    ber = [f numberFromString:self];
    return ber?YES:NO;
}


#pragma mark 验证车牌
- (BOOL)VerifyCarNo
{
    NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[A-Z]{1}[a-zA-Z_0-9]{5}$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    BOOL isMatch = [carTest evaluateWithObject:self];
    return isMatch;
}

#pragma mark 验证手机号码
- (BOOL)VerifyPhone
{
    NSString *pattern = @"^(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}

#pragma mark 验证短信验证码
- (BOOL)VerifySMSNote
{
    NSString *pattern = @"^[A-Za-z0-9]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}

#define NUMBERS @"0123456789\n"
#pragma mark - 验证是否数字
- (BOOL)VerifyNum{
    NSCharacterSet* cs = [[NSCharacterSet characterSetWithCharactersInString:NUMBERS] invertedSet];
    NSString *filtered = [[self componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    return [self isEqualToString:filtered];
}
#pragma mark - md5
+ (NSString *) md5:(NSString *) input {
    const char *cStr = [input UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return  [output uppercaseString];
}
#pragma mark 转换钱的小数点位数，只有小数点后一位的只取到小数点后1位，是整数的取整数,最多保留后2位
- (NSString*)getMoneyString
{
    NSString *money = [NSString stringWithFormat:@"%.02f",[self doubleValue]];
    double d = [money doubleValue];
    int i = d;
    if (d != i) {
        if ([[money substringFromIndex:money.length-1] isEqualToString:@"0"]) {
            money = [money substringToIndex:money.length-1];
        }
        
        return money;
    }
    
    return [NSString stringWithFormat:@"%d",i];
}

- (BOOL)VerifyPwd{
    if (self.length<6 || self.length>15) {
        return NO;
    }
    return YES;
}

- (NSString*)getMoneyStringWithDouble:(double)value
{
    NSString *money = [NSString stringWithFormat:@"%.02f",value];
    
    return [money getMoneyString];
}
@end
