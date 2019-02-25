//
//  JHAnimateManager.h
//  Bbalt
//
//  Created by bory on 2019/2/25.
//  Copyright © 2019年 hans. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JHAnimateManager : NSObject
+(instancetype)share;
+(void)defaultAnimate_1_WithAnimations:(void (^)(void))animations
                            Completion:(void (^ __nullable)(BOOL finished))completion;
@end

NS_ASSUME_NONNULL_END
