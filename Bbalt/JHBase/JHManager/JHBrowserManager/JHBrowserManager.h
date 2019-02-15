//
//  JHBrowserManager.h
//  Bbalt
//
//  Created by bory on 2019/2/15.
//  Copyright © 2019年 hans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JHSingleBrowserView.h"
NS_ASSUME_NONNULL_BEGIN

@interface JHBrowserManager : NSObject
@property(nonatomic,strong)JHSingleBrowserView *singleBrowserView;
+(instancetype)share;
@end

NS_ASSUME_NONNULL_END
