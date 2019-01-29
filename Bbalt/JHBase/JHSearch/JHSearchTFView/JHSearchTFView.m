//
//  JHSearchTFView.m
//  Bbalt
//
//  Created by bory on 2019/1/29.
//  Copyright © 2019年 hans. All rights reserved.
//

#import "JHSearchTFView.h"

@implementation JHSearchTFView
-(void)awakeFromNib{
    [super awakeFromNib];
    self.searchTF.delegate = self;
    self.bgView.layer.cornerRadius = 29/2;
    self.bgView.backgroundColor = [UIColor blackColor];
    self.searchTF.textColor = [UIColor whiteColor];
    self.searchTF.tintColor = [UIColor whiteColor];
    [self.searchTF setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self.searchTF setValue:[UIFont systemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    self.searchTF.clearButtonMode = UITextFieldViewModeWhileEditing;
//    UIButton *clearButton = [self.searchTF valueForKey:@"_clearButton"];
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    
}
- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason API_AVAILABLE(ios(10.0)){
    
} // if implemented, called in place of textFieldDidEndEditing:

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    return YES;
}
- (BOOL)textFieldShouldClear:(UITextField *)textField{
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    return YES;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

