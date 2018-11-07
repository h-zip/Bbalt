//
//  UILabel+Alignment.h
//  Xinxy
//
//  Created by bory on 2018/3/1.
//  Copyright © 2018年 hans. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Alignment)
//两端对齐

- (void)textAlignmentLeftAndRight;



//指定Label的width两端对齐

- (void)textAlignmentLeftAndRightWith:(CGFloat)labelWidth;
@end
