//
//  JHButton.m
//  Xinxy
//
//  Created by bory on 2018/3/20.
//  Copyright © 2018年 hans. All rights reserved.
//

#import "JHButton.h"
#import "JHButton+Throttle.h"
#define EventInterval 1.f
@implementation JHButton
- (UIEdgeInsets)alignmentRectInsets {
    if (UIEdgeInsetsEqualToEdgeInsets(self.alignmentRectInsetsOverride, UIEdgeInsetsZero)) {
        return super.alignmentRectInsets;
    } else {
        return self.alignmentRectInsetsOverride;
    }
}
-(void)awakeFromNib{
    [super awakeFromNib];
    self.jh_eventInterval = EventInterval;
}
-(instancetype)init{
    self = [super init];
    if (self) {
        self.jh_eventInterval = EventInterval;
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.jh_eventInterval = EventInterval;
    }
    return self;
}
+(instancetype)buttonWithType:(UIButtonType)buttonType{
    JHButton *btn = [super buttonWithType:buttonType];
    btn.jh_eventInterval = EventInterval;
    return btn;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
