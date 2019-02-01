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
@end
