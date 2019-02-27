//
//  JHRequestLogCell.h
//  Bbalt
//
//  Created by bory on 2019/2/27.
//  Copyright © 2019年 hans. All rights reserved.
//

#import "JHTableViewCell.h"
#import "JHRequestLogModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JHRequestLogCell : JHTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *urlLabel;
@property (weak, nonatomic) IBOutlet UILabel *headerLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;
@property (weak, nonatomic) IBOutlet UILabel *responseLabel;
-(void)configCell:(JHRequestLogModel*)model;
@end

NS_ASSUME_NONNULL_END
