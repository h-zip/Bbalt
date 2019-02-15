//
//  JHButton+Throttle.m
//  Bbalt
//
//  Created by bory on 2019/2/15.
//  Copyright © 2019年 hans. All rights reserved.
//

#import "JHButton+Throttle.h"
#import <objc/runtime.h>
static char * const jh_eventIntervalKey = "jh_eventIntervalKey";
static char * const eventUnavailableKey = "eventUnavailableKey";
@interface JHButton ()

@property (nonatomic, assign) BOOL eventUnavailable;

@end
@implementation JHButton (Throttle)
+ (void)load {
    
    Method method = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method qi_method = class_getInstanceMethod(self, @selector(jh_sendAction:to:forEvent:));
    method_exchangeImplementations(method, qi_method);
}


#pragma mark - Action functions
- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    [super sendAction:action to:target forEvent:event];
}
- (void)jh_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    
    if (self.eventUnavailable == NO) {
        self.eventUnavailable = YES;
        [self jh_sendAction:action to:target forEvent:event];
        [self performSelector:@selector(setEventUnavailable:) withObject:@(NO) afterDelay:self.jh_eventInterval];
    }
}


#pragma mark - Setter & Getter functions

- (NSTimeInterval)jh_eventInterval {
    
    return [objc_getAssociatedObject(self, jh_eventIntervalKey) doubleValue];
}

- (void)setJh_eventInterval:(NSTimeInterval)jh_eventInterval {
    
    objc_setAssociatedObject(self, jh_eventIntervalKey, @(jh_eventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)eventUnavailable {
    
    return [objc_getAssociatedObject(self, eventUnavailableKey) boolValue];
}

- (void)setEventUnavailable:(BOOL)eventUnavailable {
    
    objc_setAssociatedObject(self, eventUnavailableKey, @(eventUnavailable), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
