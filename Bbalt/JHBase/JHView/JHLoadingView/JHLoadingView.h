//
//  JHLoadingView.h
//  Xinxy
//
//  Created by bory on 2018/4/26.
//  Copyright © 2018年 hans. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHLoadingView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet UILabel *desLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *yCenterConst;
@property(nonatomic,strong)NSArray *imageArr;
-(void)startAnimating;
-(void)stopAnimating;
@end
