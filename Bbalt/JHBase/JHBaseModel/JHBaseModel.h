//
//  JHBaseModel.h
//  Ubtms-boss
//
//  Created by hjh on 17/7/21.
//  Copyright © 2017年 com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHBaseModel : NSObject

+(instancetype)modelWithJSON:(id)json;
+(instancetype)modelWithDic:(NSDictionary*)dic;
-(id)dicWithModel;
+(NSDictionary*)dicWithJSON:(id)json;
@end
