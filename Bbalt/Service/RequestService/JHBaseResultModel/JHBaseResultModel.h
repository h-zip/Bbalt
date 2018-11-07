//
//  JHBaseResultModel.h
//  Xinxy
//
//  Created by bory on 2018/5/4.
//  Copyright © 2018年 hans. All rights reserved.
//

#import "JHBaseModel.h"

@interface JHBaseResultModel : JHBaseModel
@property(nonatomic,strong)NSString *M;
@property(nonatomic,strong)NSString *C;
@property(nonatomic,strong)NSString *S;
@property(nonatomic,strong)id R;
-(id)result;
-(NSString*)code;
-(NSString*)status;
-(NSString*)info;
@end
