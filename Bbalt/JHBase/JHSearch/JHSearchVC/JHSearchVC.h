//
//  JHSearchVC.h
//  Bbalt
//
//  Created by bory on 2019/1/29.
//  Copyright © 2019年 hans. All rights reserved.
//

#import "JHScrollListVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface JHSearchVC : JHScrollListVC
@property(nonatomic,copy)BtnTapBlock cancelBlock;
-(void)toggleTF;
@end

NS_ASSUME_NONNULL_END
