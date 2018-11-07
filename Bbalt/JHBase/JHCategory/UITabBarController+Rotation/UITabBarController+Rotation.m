//
//  UITabBarController+Rotation.m
//  Xinxy
//
//  Created by bory on 2018/1/2.
//  Copyright © 2018年 hans. All rights reserved.
//

#import "UITabBarController+Rotation.h"

@implementation UITabBarController (Rotation)
- (BOOL)shouldAutorotate {
    return [self.selectedViewController shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.selectedViewController supportedInterfaceOrientations];
}
@end
