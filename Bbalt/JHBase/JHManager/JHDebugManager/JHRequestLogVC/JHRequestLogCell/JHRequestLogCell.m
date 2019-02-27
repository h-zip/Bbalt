//
//  JHRequestLogCell.m
//  Bbalt
//
//  Created by bory on 2019/2/27.
//  Copyright © 2019年 hans. All rights reserved.
//

#import "JHRequestLogCell.h"

@implementation JHRequestLogCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)configCell:(JHRequestLogModel*)model{
    self.timeLabel.text = model.time;
    self.urlLabel.text = model.url;
    self.headerLabel.text = [model c_headerStr];
    self.bodyLabel.text = [model c_bodyStr];
    self.responseLabel.text = [model c_responseStr];
}
@end
