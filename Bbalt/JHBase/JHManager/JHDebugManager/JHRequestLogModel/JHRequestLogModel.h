//
//  JHRequestLogModel.h
//  Bbalt
//
//  Created by bory on 2019/2/27.
//  Copyright © 2019年 hans. All rights reserved.
//

#import "JHBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JHRequestLogModel : JHBaseModel
@property(nonatomic,strong)NSString *url;
@property(nonatomic,strong)NSDictionary *header;
@property(nonatomic,strong)NSDictionary *body;
@property(nonatomic,strong)NSDictionary *response;
@property(nonatomic,strong)NSString *time;

-(instancetype)initWithURL:(NSString*)url
                    Header:(NSDictionary*)header
                      Body:(NSDictionary*)body
                  Response:(NSDictionary*)response;
-(NSString*)c_headerStr;
-(NSString*)c_bodyStr;
-(NSString*)c_responseStr;
-(NSString*)c_pasteStr;
@end

NS_ASSUME_NONNULL_END
