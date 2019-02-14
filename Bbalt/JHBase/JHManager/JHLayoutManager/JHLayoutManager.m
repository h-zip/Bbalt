//
//  JHLayoutManager.m
//  Bbalt
//
//  Created by bory on 2019/1/31.
//  Copyright © 2019年 hans. All rights reserved.
//

#import "JHLayoutManager.h"

@implementation JHLayoutManager
+(instancetype)share{
    static JHLayoutManager *_JHLayoutManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _JHLayoutManager = [[self alloc]init];
    });
    return _JHLayoutManager;
}
-(instancetype)init{
    if (self = [super init]) {
    }
    return self;
}
-(nullable id)safeArea:(UIView*)view{
    if (@available(iOS 11.0, *)) {
        return view.safeAreaLayoutGuide;
    } else {
        return view;
    }
}
-(NSArray*)equalLayoutItem:(UIView*)item1
                ToItem:(UIView*)item2{
    item1.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *top = JH_Layout(item1, JH_Top, item2, JH_Top, 0);
    NSLayoutConstraint *left = JH_Layout(item1, JH_Leading, item2, JH_Leading, 0);
    NSLayoutConstraint *right = JH_Layout(item1, JH_Trailing, item2, JH_Trailing, 0);
    NSLayoutConstraint *bottom = JH_Layout(item1, JH_Bottom, item2, JH_Bottom, 0);
    return @[top,left,right,bottom];
}
@end
