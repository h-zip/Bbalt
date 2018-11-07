//
//  JHUploadManager.m
//  Xinxy
//
//  Created by bory on 2017/12/1.
//  Copyright © 2017年 hans. All rights reserved.
//

#import "JHUploadManager.h"
#import<CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>
#import <Qiniu/QiniuSDK.h>
#import <Qiniu/QN_GTM_Base64.h>
@implementation JHUploadManager
+(instancetype)shareInstance{
    static JHUploadManager *_JHUploadManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _JHUploadManager = [[self alloc]init];
    });
    return _JHUploadManager;
}

-(void)putData:(NSData *)data WithToken:(NSString *)token ResponseBlock:(ResponseBlock)responseBlock ErrorBlock:(ErrorBlock)errorBlock{
    QNUploadManager *manager = [[QNUploadManager alloc]init];

    [manager putData:data key:nil token:token complete:^(QNResponseInfo *info, NSString *key, NSDictionary *resp) {
        NSLog(@"=========%f秒",info.duration);
        if (responseBlock) {
            if (info.isOK) {
                responseBlock(key,resp);
            }else{
                errorBlock(info.error);
            }
        }
    } option:nil];
    
}
-(NSString*)createTokenByScope:(NSString*)scope
                     SecretKey:(NSString*)secretKey
                     AccessKey:(NSString*)accessKey{
    // 将上传策略中的scrop和deadline序列化成json格式
    NSMutableDictionary *authInfo = [NSMutableDictionary dictionary];
    [authInfo setObject:scope forKey:@"scope"];
    [authInfo
     setObject:[NSNumber numberWithLong:[[NSDate date] timeIntervalSince1970] + 1 * 24 * 3600]
     forKey:@"deadline"];
    
    NSData *jsonData =
    [NSJSONSerialization dataWithJSONObject:authInfo options:NSJSONWritingPrettyPrinted error:nil];
    
    // 对json序列化后的上传策略进行URL安全的base64编码
    NSString *encodedString = [self urlSafeBase64Encode:jsonData];
    
    // 用secretKey对编码后的上传策略进行HMAC-SHA1加密，并且做安全的base64编码，得到encoded_signed
    NSString *encodedSignedString = [self HMACSHA1:secretKey text:encodedString];
    
    // 将accessKey、encodedSignedString和encodedString拼接，中间用：分开，就是上传的token
    NSString *token =
    [NSString stringWithFormat:@"%@:%@:%@", accessKey, encodedSignedString, encodedString];
    return token;
}
- (NSString *)urlSafeBase64Encode:(NSData *)text {
    NSString *base64 =
    [[NSString alloc] initWithData:[QN_GTM_Base64 encodeData:text] encoding:NSUTF8StringEncoding];
    base64 = [base64 stringByReplacingOccurrencesOfString:@"+" withString:@"-"];
    base64 = [base64 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    return base64;
}
- (NSString *)HMACSHA1:(NSString *)key text:(NSString *)text {
    const char *cKey = [key cStringUsingEncoding:NSUTF8StringEncoding];
    const char *cData = [text cStringUsingEncoding:NSUTF8StringEncoding];
    
    char cHMAC[CC_SHA1_DIGEST_LENGTH];
    
    CCHmac(kCCHmacAlgSHA1, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    
    NSData *HMAC = [[NSData alloc] initWithBytes:cHMAC length:CC_SHA1_DIGEST_LENGTH];
    NSString *hash = [self urlSafeBase64Encode:HMAC];
    return hash;
}
@end
