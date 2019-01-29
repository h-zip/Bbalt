//
//  JHSearchBtnView.h
//  Bbalt
//
//  Created by bory on 2019/1/29.
//  Copyright © 2019年 hans. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JHSearchBtnView : UIView
@property (weak, nonatomic) IBOutlet UIButton *searchBtn;
@property (nonatomic,copy)BtnTapBlock btnTapBlock;
@end

NS_ASSUME_NONNULL_END
