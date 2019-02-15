//
//  JHSingleBrowserView.m
//  Bbalt
//
//  Created by bory on 2019/2/15.
//  Copyright © 2019年 hans. All rights reserved.
//

#import "JHSingleBrowserView.h"

@implementation JHSingleBrowserView
-(instancetype)init{
    self = [super init];
    if (self) {
        self.scrollView = JH_ZoomScrollView(JHZoom_Min, JHZoom_Max);
        [self addSubview:self.scrollView];
        NSArray *arr = JH_EqualLayouts(self.scrollView, self);
        JH_AddLayouts(self, arr);
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
