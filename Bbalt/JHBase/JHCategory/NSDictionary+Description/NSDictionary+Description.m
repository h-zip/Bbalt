//
//  NSDictionary+Description.m
//  Ubtms-boss
//
//  Created by hjh on 17/7/21.
//  Copyright © 2017年 com. All rights reserved.
//

#import "NSDictionary+Description.h"

@implementation NSDictionary (Description)
- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level
{
    NSMutableString *mStr = [NSMutableString string];
    NSMutableString *tab = [NSMutableString stringWithString:@""];
    for (int i = 0; i < level+1; i++) {
        [tab appendString:@"\t"];
    }
    [mStr appendString:@"{\n"];
    NSArray *allKey = self.allKeys;
    for (int i = 0; i < allKey.count; i++) {
        id value = self[allKey[i]];
        NSString *lastSymbol = (allKey.count == i + 1) ? @"":@",";
        if ([value respondsToSelector:@selector(descriptionWithLocale:indent:)]) {
            [mStr appendFormat:@"\t%@%@ : '%@'%@\n",tab,allKey[i],[value descriptionWithLocale:locale indent:level],lastSymbol];
        } else {
            [mStr appendFormat:@"\t%@'%@' : '%@'%@\n",tab,allKey[i],value,lastSymbol];
        }
    }
    [mStr appendFormat:@"%@}",tab];
    return mStr;
}
@end
