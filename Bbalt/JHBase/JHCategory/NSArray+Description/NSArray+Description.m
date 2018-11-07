//
//  NSArray+Description.m
//  Ubtms-boss
//
//  Created by hjh on 17/7/21.
//  Copyright © 2017年 com. All rights reserved.
//

#import "NSArray+Description.h"

@implementation NSArray (Description)
- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level
{
    NSMutableString *mStr = [NSMutableString string];
    NSMutableString *tab = [NSMutableString stringWithString:@""];
    for (int i = 0; i < level+1; i++) {
        [tab appendString:@"\t"];
    }
    [mStr appendString:@"[\n"];
    for (int i = 0; i < self.count; i++) {
        NSString *lastSymbol = (self.count == i + 1) ? @"":@",";
        id value = self[i];
        if ([value respondsToSelector:@selector(descriptionWithLocale:indent:)]) {
            [mStr appendFormat:@"\t%@%@%@\n",tab,[value descriptionWithLocale:locale indent:level+1],lastSymbol];
        } else {
            [mStr appendFormat:@"\t%@%@%@\n",tab,value,lastSymbol];
        }
    }
    [mStr appendFormat:@"%@]",tab];
    return mStr;
}
@end
