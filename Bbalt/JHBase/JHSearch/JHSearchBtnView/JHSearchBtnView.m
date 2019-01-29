//
//  JHSearchBtnView.m
//  Bbalt
//
//  Created by bory on 2019/1/29.
//  Copyright © 2019年 hans. All rights reserved.
//

#import "JHSearchBtnView.h"

@implementation JHSearchBtnView
-(void)awakeFromNib{
    [super awakeFromNib];
    self.searchBtn.layer.cornerRadius = 29/2;
    self.searchBtn.backgroundColor = [UIColor blackColor];
    [self.searchBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}
- (IBAction)btnTap:(UIButton *)sender {
    if (self.btnTapBlock) {
        self.btnTapBlock(sender);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
