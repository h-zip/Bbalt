//
//  JHBaseResultModel.m
//  Xinxy
//
//  Created by bory on 2018/5/4.
//  Copyright © 2018年 hans. All rights reserved.
//

#import "JHBaseResultModel.h"

@implementation JHBaseResultModel
-(NSString*)code{
    return _C;
}
-(NSString*)status{
    return _S;
}
-(NSString*)info{
    return _M;
}
-(id)result{
    return _R;
}
+(instancetype)modelWithJSON:(id)json{
    if ([json isKindOfClass:NSError.class]) {
        
        return [[self class]modelWithError:json];
    }else{
        return [[self class]yy_modelWithJSON:json];
    }
}
+(instancetype)modelWithError:(NSError *)error{
    JHBaseResultModel *model = [[self class]alloc];
    model.C = [NSString stringWithFormat:@"%ld",(long)error.code];
    model.S = model.C;
    model.M = error.localizedDescription;
    model.R = error;
    return model;
}
@end
