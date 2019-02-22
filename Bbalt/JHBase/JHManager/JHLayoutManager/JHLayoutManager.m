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
-(NSArray*)equalSizeLayoutItem:(UIView*)item1
                ToItem:(UIView*)item2{
    item1.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *top = JH_Layout(item1, JH_Top, item2, JH_Top, 0);
    NSLayoutConstraint *left = JH_Layout(item1, JH_Leading, item2, JH_Leading, 0);
    NSLayoutConstraint *right = JH_Layout(item1, JH_Trailing, item2, JH_Trailing, 0);
    NSLayoutConstraint *bottom = JH_Layout(item1, JH_Bottom, item2, JH_Bottom, 0);
    return @[top,left,right,bottom];
}
-(NSArray*)equalRowLayoutItems:(NSArray*)items
                        ToItem:(UIView*)item{
    NSMutableArray *arr = [@[]mutableCopy];
    UIView *last = nil;
    for (int i = 0; i<items.count; i++) {
        UIView *v = items[i];
        v.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *top = JH_Layout(v, JH_Top, item, JH_Top, 0);
        NSLayoutConstraint *left = i == 0 ? JH_Layout(v, JH_Leading, item, JH_Leading, 0) : JH_Layout(v, JH_Leading, last, JH_Trailing, 0);
        NSLayoutConstraint *bottom = JH_Layout(v, JH_Bottom, item, JH_Bottom, 0);
        NSLayoutConstraint *width = JH_Layout(v, JH_Width, item, JH_Width, 0);
        NSLayoutConstraint *height = JH_Layout(v, JH_Height, item, JH_Height, 0);
        [arr addObjectsFromArray:@[top,left,bottom,width,height]];
        if (i == items.count-1) {
            NSLayoutConstraint *right = JH_Layout(v, JH_Trailing, item, JH_Trailing, 0);
            [arr addObject:right];
        }
        last = v;
    }
    return [arr copy];
}
-(NSArray*)centerLayoutSize:(CGSize)size
                       Item:(UIView*)item1
                     ToItem:(UIView*)item2{
    item1.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *cx = JH_Layout(item1, JH_CenterX, item2, JH_CenterX, 0);
    NSLayoutConstraint *cy = JH_Layout(item1, JH_CenterY, item2, JH_CenterY, 0);
    NSMutableArray *arr = [@[cx,cy]mutableCopy];
    if (size.width != 0) {
        NSLayoutConstraint *width = JH_Layout(item1, JH_Width, nil, JH_NotAnAttribute, size.width);
        [arr addObject:width];
    }
    if (size.height != 0) {
        NSLayoutConstraint *height = JH_Layout(item1, JH_Height, nil, JH_NotAnAttribute, size.height);
        [arr addObject:height];
    }
    return [arr copy];
}
-(NSArray*)centerYLayoutSize:(CGSize)size
                     Leading:(CGFloat)leading
                    Trailing:(CGFloat)trailing
                        Item:(UIView*)item1
                      ToItem:(UIView*)item2{
    item1.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *cy = JH_Layout(item1, JH_CenterY, item2, JH_CenterY, 0);
    NSMutableArray *arr = [@[cy]mutableCopy];
    if (size.width != 0) {
        NSLayoutConstraint *width = JH_Layout(item1, JH_Width, nil, JH_NotAnAttribute, size.width);
        [arr addObject:width];
    }
    if (size.height != 0) {
        NSLayoutConstraint *height = JH_Layout(item1, JH_Height, nil, JH_NotAnAttribute, size.height);
        [arr addObject:height];
    }
    if (leading) {
        NSLayoutConstraint *l = JH_Layout(item1, JH_Leading, item2, JH_Leading, leading);
        [arr addObject:l];
    }
    if (trailing) {
        NSLayoutConstraint *t = JH_Layout(item1, JH_Trailing, item2, JH_Trailing, trailing);
        [arr addObject:t];
    }
    return [arr copy];
}

-(NSArray*)centerXLayoutSize:(CGSize)size
                         Top:(CGFloat)top
                      Bottom:(CGFloat)bottom
                        Item:(UIView*)item1
                      ToItem:(UIView*)item2{
    item1.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *cx = JH_Layout(item1, JH_CenterX, item2, JH_CenterX, 0);
    NSMutableArray *arr = [@[cx]mutableCopy];
    if (size.width != 0) {
        NSLayoutConstraint *width = JH_Layout(item1, JH_Width, nil, JH_NotAnAttribute, size.width);
        [arr addObject:width];
    }
    if (size.height != 0) {
        NSLayoutConstraint *height = JH_Layout(item1, JH_Height, nil, JH_NotAnAttribute, size.height);
        [arr addObject:height];
    }
    if (top) {
        NSLayoutConstraint *t = JH_Layout(item1, JH_Top, item2, JH_Top, top);
        [arr addObject:t];
    }
    if (bottom) {
        NSLayoutConstraint *b = JH_Layout(item1, JH_Bottom, item2, JH_Bottom, bottom);
        [arr addObject:b];
    }
    return [arr copy];
}
@end
