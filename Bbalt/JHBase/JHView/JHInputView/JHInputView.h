//
//  JHInputView.h
//  Bbalt
//
//  Created by bory on 2019/1/30.
//  Copyright © 2019年 hans. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JHInputView : UIView
@property (weak, nonatomic) IBOutlet UIButton *bgBtn;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet JHTextView *mTV;

@end

NS_ASSUME_NONNULL_END
