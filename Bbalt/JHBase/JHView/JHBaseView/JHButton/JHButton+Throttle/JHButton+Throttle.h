//
//  JHButton+Throttle.h
//  Bbalt
//
//  Created by bory on 2019/2/15.
//  Copyright © 2019年 hans. All rights reserved.
//

#import "JHButton.h"

NS_ASSUME_NONNULL_BEGIN

@interface JHButton (Throttle)
@property (nonatomic, assign) NSTimeInterval jh_eventInterval;
@end

NS_ASSUME_NONNULL_END
