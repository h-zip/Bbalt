//
//  UINavigationController+Rotation.m
//  Xinxy
//
//  Created by bory on 2018/1/2.
//  Copyright © 2018年 hans. All rights reserved.
//

#import "UINavigationController+Rotation.h"

@implementation UINavigationController (Rotation)
- (BOOL)shouldAutorotate {
    return [self.visibleViewController shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.visibleViewController supportedInterfaceOrientations];
}
@end
