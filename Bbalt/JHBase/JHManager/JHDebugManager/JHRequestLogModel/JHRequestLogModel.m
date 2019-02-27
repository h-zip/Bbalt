//
//  JHRequestLogModel.m
//  Bbalt
//
//  Created by bory on 2019/2/27.
//  Copyright © 2019年 hans. All rights reserved.
//

#import "JHRequestLogModel.h"
#import "NSDate+Category.h"
@implementation JHRequestLogModel

-(instancetype)initWithURL:(NSString*)url
                    Header:(NSDictionary*)header
                      Body:(NSDictionary*)body
                  Response:(NSDictionary*)response{
    self = [super init];
    if (self) {
        self.url = url;
        self.header = header;
        self.body = body;
        self.response = response;
        self.time = [NSDate currentDateWithFormatString:@"yyyy-MM-dd HH:mm:ss"];
    }
    return self;
}
-(NSString*)c_headerStr{
    return [JHDebugInstance convertToJsonData:self.header];
}

-(NSString*)c_bodyStr{
    return [JHDebugInstance convertToJsonData:self.body];
}
-(NSString*)c_responseStr{
    return [JHDebugInstance convertToJsonData:self.response];
}
-(NSString*)c_pasteStr{
    NSString *p = [NSString stringWithFormat:@"time:%@ \nurl:%@ \nheader:%@ \nbody:%@ \nresponse:%@",self.time,self.url,self.c_headerStr,self.c_bodyStr,self.c_responseStr];
    return p;
}
@end
