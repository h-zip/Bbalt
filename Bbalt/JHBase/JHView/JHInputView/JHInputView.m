//
//  JHInputView.m
//  Bbalt
//
//  Created by bory on 2019/1/30.
//  Copyright © 2019年 hans. All rights reserved.
//

#import "JHInputView.h"

@implementation JHInputView
-(void)awakeFromNib{
    [super awakeFromNib];
    if (@available(iOS 11.0, *)) {
        self.mTV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
}
- (IBAction)bgTap:(UIButton *)sender {
    [self.mTV resignFirstResponder];
    self.hidden = YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
