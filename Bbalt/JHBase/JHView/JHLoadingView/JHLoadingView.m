//
//  JHLoadingView.m
//  Xinxy
//
//  Created by bory on 2018/4/26.
//  Copyright © 2018年 hans. All rights reserved.
//

#import "JHLoadingView.h"
@interface JHLoadingView()

@end
@implementation JHLoadingView
-(NSArray*)imageArr{
    if (!_imageArr) {
        _imageArr = @[@"common_loading_1",@"common_loading_2"];
    }
    return _imageArr;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)awakeFromNib{
    [super awakeFromNib];
    
    NSMutableArray *images = [@[]mutableCopy];
    for (int i = 0; i<self.imageArr.count; i++) {
        UIImage *image = [UIImage imageNamed:self.imageArr[i]];
        [images addObject:image];
    }
    self.logoImageView.animationImages = [images copy];
    self.logoImageView.animationDuration = 0.5;
    self.logoImageView.animationRepeatCount = 0;
}
-(void)startAnimating{
    [self.logoImageView startAnimating];
}
-(void)stopAnimating{
    [self.logoImageView stopAnimating];
}
@end
