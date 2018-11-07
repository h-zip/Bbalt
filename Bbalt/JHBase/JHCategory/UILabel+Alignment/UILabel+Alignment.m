//
//  UILabel+Alignment.m
//  Xinxy
//
//  Created by bory on 2018/3/1.
//  Copyright © 2018年 hans. All rights reserved.
//

#import "UILabel+Alignment.h"
#import<CoreText/CoreText.h>
@implementation UILabel (Alignment)
- (void)textAlignmentLeftAndRight{
    
    [self  textAlignmentLeftAndRightWith:CGRectGetWidth(self.frame)];
    
}



- (void)textAlignmentLeftAndRightWith:(CGFloat)labelWidth{
    
    CGSize size = [self.text boundingRectWithSize:CGSizeMake(labelWidth,MAXFLOAT)  options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading  attributes:@{NSFontAttributeName :self.font}  context:nil].size;
    
    CGFloat margin = (labelWidth - size.width)/(self.text.length - 1);
    
    NSNumber *number = [NSNumber  numberWithFloat:margin];
    
    NSMutableAttributedString *attribute = [[NSMutableAttributedString  alloc]  initWithString:self.text];
    
    [attribute  addAttribute:NSKernAttributeName  value:number range:NSMakeRange(0,self.text.length -1 )];
    self.attributedText = attribute;
    
}
@end
