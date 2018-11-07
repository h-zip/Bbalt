//
//  JHBaseModel.m
//  Ubtms-boss
//
//  Created by hjh on 17/7/21.
//  Copyright © 2017年 com. All rights reserved.
//

#import "JHBaseModel.h"
#import <objc/runtime.h>
#import <YYModel/YYModel.h>
@implementation JHBaseModel
+(instancetype)modelWithJSON:(id)json{
    return [[self class]yy_modelWithJSON:json];
}
+(instancetype)modelWithDic:(NSDictionary *)dic{
    return [[self class]yy_modelWithDictionary:dic];
}
-(id)dicWithModel{
    return [self yy_modelToJSONObject];
}
+(NSDictionary*)dicWithJSON:(id)json{
    return [NSJSONSerialization JSONObjectWithData:json options:kNilOptions error:NULL];
}
-(NSString*)description{
    NSMutableString *mStr = [NSMutableString string];
    NSMutableString *tab = [NSMutableString stringWithString:@""];

    [mStr appendFormat:@"\n<%@ = {\n",NSStringFromClass(self.class)];
    
    unsigned int outCount;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (int i = 0; i < outCount; i++)
    {
        objc_property_t property = properties[i];
        const char *charProperty = property_getName(property);
        NSString *propertyName = [NSString stringWithUTF8String:charProperty];
        if (propertyName) {
            id propertyValue = [self valueForKey:propertyName];
            NSString *lastSymbol = (outCount == i + 1) ? @"":@",";
            [mStr appendFormat:@"\t%@'%@' : '%@'%@\n",tab,propertyName,propertyValue,lastSymbol];
        }
    }
    free(properties);
    [mStr appendFormat:@"%@}>",tab];
    return mStr;
}
- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level
{
    NSMutableString *mStr = [NSMutableString string];
    NSMutableString *tab = [NSMutableString stringWithString:@""];
    for (int i = 0; i < level+1; i++) {
        [tab appendString:@"\t"];
    }
    [mStr appendFormat:@"<%@ = {\n",NSStringFromClass(self.class)];
    
    unsigned int outCount;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (int i = 0; i < outCount; i++)
    {
        objc_property_t property = properties[i];
        const char *charProperty = property_getName(property);
        NSString *propertyName = [NSString stringWithUTF8String:charProperty];
        if (propertyName) {
            id propertyValue = [self valueForKey:propertyName];
            NSString *lastSymbol = (outCount == i + 1) ? @"":@",";
            if ([propertyValue respondsToSelector:@selector(descriptionWithLocale:indent:)]) {
                [mStr appendFormat:@"\t%@'%@' : %@'%@'\n",tab,propertyName,[propertyValue descriptionWithLocale:locale indent:level+1],lastSymbol];
            } else {
                [mStr appendFormat:@"\t%@'%@' : %@'%@'\n",tab,propertyName,propertyValue,lastSymbol];
            }
        }
    }
    free(properties);
    [mStr appendFormat:@"%@}>",tab];
    return mStr;
}
@end
