//
//  JHDebugManager.m
//  Ubtms-boss
//
//  Created by hjh on 17/7/24.
//  Copyright © 2017年 com. All rights reserved.
//

#import "JHDebugManager.h"
#import "JHRequestConstant.h"
@interface JHDebugManager()
@end
NSString *requestHost;
@implementation JHDebugManager
-(void)setRequestDebug:(BOOL)requestDebug{
    if (requestDebug == _requestDebug) return;
    if (!requestDebug) {
        [self.bugBtn removeFromSuperview];
        [self.logVC.view removeFromSuperview];
    }else{
        [self.bugBtn removeFromSuperview];
        [AppDelegateInstance.window addSubview:self.bugBtn];
    }
    _requestDebug = requestDebug;
    
}
+(instancetype)share{
    static JHDebugManager *_debugManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _debugManager = [[self alloc]init];
    });
    return _debugManager;
}
-(instancetype)init{
    if (self = [super init]) {
        self.logArr = [@[]mutableCopy];
        self.bugBtn = [JHButton buttonWithType:UIButtonTypeCustom];
        self.bugBtn.backgroundColor = [UIColor whiteColor];
        self.bugBtn.titleLabel.font = [UIFont systemFontOfSize:10.f];
        [self.bugBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        self.bugBtn.layer.borderWidth = 2.f;
        self.bugBtn.layer.borderColor = [[UIColor blackColor]CGColor];
        [self.bugBtn setTitle:@"BUG" forState:UIControlStateNormal];
        self.bugBtn.frame = (CGRect){kSCREEN_W-30-20,kTopHeight+20,30,30};
        @WeakObj(self);
        [[self.bugBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
            @StrongObj(self);
            [self showLogs];
        }];
        self.logVC = [[JHRequestLogVC alloc]init];
    }
    return self;
}
-(void)storeRequestInfo:(NSString*)url
                 Header:(NSDictionary*)header
                   Body:(NSDictionary*)body
               Response:(id)response{
    if (self.requestDebug) {
        NSDictionary *r = [JHRequestLogModel dicWithJSON:response];
        JHRequestLogModel *m = [[JHRequestLogModel alloc] initWithURL:url Header:header Body:body Response:r];
        [self.logArr addObject:m];
    }
}
-(void)resetLogs{
    self.logArr = [@[]mutableCopy];
}
-(void)showLogs{
    [AppDelegateInstance.window addSubview:self.logVC.view];
}
-(NSString *)convertToJsonData:(NSDictionary *)dict
{
    
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *jsonString;
    
    if (!jsonData) {
        
        NSLog(@"%@",error);
        
    }else{
        
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        
    }
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    
    NSRange range = {0,jsonString.length};
    
    //去掉字符串中的空格
    
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    
    return mutStr;
    
}
@end
