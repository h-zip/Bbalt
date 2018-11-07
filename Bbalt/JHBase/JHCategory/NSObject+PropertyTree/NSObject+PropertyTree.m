//
//  NSObject+PropertyTree.m
//  Ubtms-boss
//
//  Created by hjh on 17/7/22.
//  Copyright © 2017年 com. All rights reserved.
//

#import "NSObject+PropertyTree.h"
#import <objc/runtime.h>
@implementation NSObject (PropertyTree)
+(NSString *)propertyTreeDescription:(NSString*)classString{
    NSMutableString *mStr = [NSMutableString string];
    NSMutableString *tab = [NSMutableString stringWithString:@""];
    
    [mStr appendFormat:@"\n<%@ = {\n",classString];
    
    unsigned int outCount;
    Ivar *ivars = class_copyIvarList(NSClassFromString(classString), &outCount);
   // objc_property_t *properties = class_copyPropertyList(NSClassFromString(classString), &outCount);
    for (int i = 0; i < outCount; i++)
    {
//        objc_property_t property = properties[i];
//        const char *charProperty = property_getName(property);
//        NSString *propertyName = [NSString stringWithUTF8String:charProperty];
//        if (propertyName) {
//            NSString *lastSymbol = (outCount == i + 1) ? @"":@";";
//            [mStr appendFormat:@"\t%@%@%@\n",tab,propertyName,lastSymbol];
//        }
        Ivar ivar = ivars[i];
        const char * charIvar = ivar_getName(ivar);
        NSString *ivarName = [NSString stringWithUTF8String:charIvar];
        const char * charIvarType = ivar_getTypeEncoding(ivar);
        NSString *ivarTypeName = [NSString stringWithUTF8String:charIvarType];
        if (ivarName) {
            NSString *lastSymbol = (outCount == i + 1) ? @"":@";";
            [mStr appendFormat:@"\t%@(%@) %@%@\n",tab,ivarTypeName,ivarName,lastSymbol];
        }
        
    }
    free(ivars);
//    free(properties);
    [mStr appendFormat:@"%@}>",tab];
    return mStr;
}
- (NSString *)propertyTreeDescriptionWithIndent:(NSUInteger)level
{
    NSMutableString *mStr = [NSMutableString string];
    NSMutableString *tab = [NSMutableString stringWithString:@""];
    for (int i = 0; i < level+1; i++) {
        [tab appendString:@"\t"];
    }
    [mStr appendFormat:@"<%@ = {\n",NSStringFromClass(self.class)];
    
    unsigned int outCount;
    Ivar *ivars = class_copyIvarList(self.class, &outCount);
    //objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (int i = 0; i < outCount; i++)
    {
//        objc_property_t property = properties[i];
//        const char *charProperty = property_getName(property);
//        NSString *propertyName = [NSString stringWithUTF8String:charProperty];
//        if (propertyName) {
//            id propertyValue = [self valueForKey:propertyName];
//            NSString *lastSymbol = (outCount == i + 1) ? @"":@";";
//            [mStr appendFormat:@"\t%@(%@) %@ = %@%@\n",tab,NSStringFromClass([propertyValue class]),propertyName,propertyValue,lastSymbol];
//        }
        Ivar ivar = ivars[i];
        const char * charIvar = ivar_getName(ivar);
        NSString *ivarName = [NSString stringWithUTF8String:charIvar];
        const char * charIvarType = ivar_getTypeEncoding(ivar);
        NSString *ivarTypeName = [NSString stringWithUTF8String:charIvarType];
        //id ivarValue = object_getIvar(self, ivar);
        if (ivarName) {
            NSString *lastSymbol = (outCount == i + 1) ? @"":@";";
            [mStr appendFormat:@"\t%@(%@) %@ = %@%@\n",tab,ivarTypeName,ivarName,[self valueForKey:ivarName],lastSymbol];
        }
    }
    free(ivars);
//    free(properties);
    [mStr appendFormat:@"%@}>",tab];
    return mStr;
}
@end
