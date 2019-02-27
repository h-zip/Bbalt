//
//  JHTableViewCell.m
//  Test
//
//  Created by bory on 2018/7/13.
//  Copyright © 2018年 hans. All rights reserved.
//

#import "JHTableViewCell.h"

@implementation JHTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
