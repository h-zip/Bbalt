//
//  JHBaseResultHandler.m
//  Xinxy
//
//  Created by bory on 2018/5/4.
//  Copyright © 2018年 hans. All rights reserved.
//

#import "JHBaseResultHandler.h"

@implementation JHBaseResultHandler
+(instancetype)share{
    static JHBaseResultHandler *_baseResultHandler = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _baseResultHandler = [[self alloc]init];
    });
    return _baseResultHandler;
}
-(instancetype)init{
    if (self = [super init]) {
        
    }
    return self;
}
+(BOOL)shouldGotoSuccessCallBackBasedOnBaseResult:(JHBaseResultModel*)baseResultModel{
    if ([baseResultModel.status isEqualToString:@"200"]) {
        return YES;
    }else{
        [self handleFailResult:baseResultModel];
        return NO;
    }
}
+(void)handleFailResult:(JHBaseResultModel*)baseResultModel{
//    enum
//    {
//        NSURLErrorUnknown = -1,
//        NSURLErrorCancelled = -999,
//        NSURLErrorBadURL = -1000,
//        NSURLErrorTimedOut = -1001,
//        NSURLErrorUnsupportedURL = -1002,
//        NSURLErrorCannotFindHost = -1003,
//        NSURLErrorCannotConnectToHost = -1004,
//        NSURLErrorDataLengthExceedsMaximum = -1103,
//        NSURLErrorNetworkConnectionLost = -1005,
//        NSURLErrorDNSLookupFailed = -1006,
//        NSURLErrorHTTPTooManyRedirects = -1007,
//        NSURLErrorResourceUnavailable = -1008,
//        NSURLErrorNotConnectedToInternet = -1009,
//        NSURLErrorRedirectToNonExistentLocation = -1010,
//        NSURLErrorBadServerResponse = -1011,
//        NSURLErrorUserCancelledAuthentication = -1012,
//        NSURLErrorUserAuthenticationRequired = -1013,
//        NSURLErrorZeroByteResource = -1014,
//        NSURLErrorCannotDecodeRawData = -1015,
//        NSURLErrorCannotDecodeContentData = -1016,
//        NSURLErrorCannotParseResponse = -1017,
//        NSURLErrorInternationalRoamingOff = -1018,
//        NSURLErrorCallIsActive = -1019,
//        NSURLErrorDataNotAllowed = -1020,
//        NSURLErrorRequestBodyStreamExhausted = -1021,
//        NSURLErrorFileDoesNotExist = -1100,
//        NSURLErrorFileIsDirectory = -1101,
//        NSURLErrorNoPermissionsToReadFile = -1102,
//        NSURLErrorSecureConnectionFailed = -1200,
//        NSURLErrorServerCertificateHasBadDate = -1201,
//        NSURLErrorServerCertificateUntrusted = -1202,
//        NSURLErrorServerCertificateHasUnknownRoot = -1203,
//        NSURLErrorServerCertificateNotYetValid = -1204,
//        NSURLErrorClientCertificateRejected = -1205,
//        NSURLErrorClientCertificateRequired = -1206,
//        NSURLErrorCannotLoadFromNetwork = -2000,
//        NSURLErrorCannotCreateFile = -3000,
//        NSURLErrorCannotOpenFile = -3001,
//        NSURLErrorCannotCloseFile = -3002,
//        NSURLErrorCannotWriteToFile = -3003,
//        NSURLErrorCannotRemoveFile = -3004,
//        NSURLErrorCannotMoveFile = -3005,
//        NSURLErrorDownloadDecodingFailedMidStream = -3006,
//        NSURLErrorDownloadDecodingFailedToComplete = -3007
//    }

    if (baseResultModel==nil) {
        
    }else{
        if ([baseResultModel.result isKindOfClass:NSError.class]) {
            @TODO("code");
        }
        
    }
    //        if([baseResultModel.code isEqualToString:@"unauthorized"]){
    //            [[JHUserManager share]logout];
    //            XxyAppDelegateInstance.window.rootViewController = [[StoryBoardManager shareInstance] getViewController:@"LoginNavi" FromSB:@"LoginAndChangePWD"];
    //            [JHHudManager showInfoWithStatus:@"用户过期,请重新登录"];
    //        }else{
    //            if (baseResultModel.msg) {
    //                [JHHudManager showInfoWithStatus:baseResultModel.msg];
    //            }else if (baseResultModel.detail){
    //
    //                [JHHudManager showInfoWithStatus:baseResultModel.detail];
    //            }
    //        }
}
@end
