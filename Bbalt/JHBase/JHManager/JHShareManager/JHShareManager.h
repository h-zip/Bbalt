//
//  JHShareManager.h
//  Xinxy
//
//  Created by bory on 2018/4/13.
//  Copyright © 2018年 hans. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHShareManager : NSObject
+(instancetype)share;
-(void)configUSharePlatforms;
-(void)confitUShareSettings;
-(BOOL)handleOpenURL:(NSURL*)url sourceApplication:(NSString*)sourceApplication annotation:(id)annotation;
-(void)share:(UIViewController*)vc;
@end
