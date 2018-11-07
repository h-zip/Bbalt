//
//  JHNoWifiView.m
//  Xinxy
//
//  Created by bory on 2018/5/7.
//  Copyright © 2018年 hans. All rights reserved.
//

#import "JHNoWifiView.h"

@implementation JHNoWifiView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)awakeFromNib{
    [super awakeFromNib];
    self.retryBtn.layer.cornerRadius = self.retryBtn.frame.size.height/2;
    self.retryBtn.layer.borderWidth = 1;
    self.retryBtn.layer.borderColor = self.retryBtn.currentTitleColor.CGColor;
    self.retryBtn.layer.masksToBounds = YES;
}
@end
