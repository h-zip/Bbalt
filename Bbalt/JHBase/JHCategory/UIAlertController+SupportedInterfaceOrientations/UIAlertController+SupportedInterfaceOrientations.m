//
//  UIAlertController+SupportedInterfaceOrientations.m
//  Bbalt
//
//  Created by bory on 2019/2/22.
//  Copyright © 2019年 hans. All rights reserved.
//

#import "UIAlertController+SupportedInterfaceOrientations.h"

@implementation UIAlertController (supportedInterfaceOrientations)

#if __IPHONE_OS_VERSION_MAX_ALLOWED < 90000
- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}
#else
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}
#endif

@end
