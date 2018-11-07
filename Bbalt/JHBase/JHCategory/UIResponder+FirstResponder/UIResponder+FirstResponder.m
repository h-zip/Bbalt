//
//  UIResponder+FirstResponder.m
//  Ubtms-boss
//
//  Created by hjh on 17/8/1.
//  Copyright © 2017年 com. All rights reserved.
//

#import "UIResponder+FirstResponder.h"
static __weak id currentFirstResponder = nil;
@implementation UIResponder (FirstResponder)

+ (id)currentFirstResponder {
    currentFirstResponder = nil;
    [[UIApplication sharedApplication] sendAction:@selector(findFirstResponder:) to:nil from:nil forEvent:nil];
    return currentFirstResponder;
}

- (void)findFirstResponder:(id)sender {
    currentFirstResponder = self;
}
@end
